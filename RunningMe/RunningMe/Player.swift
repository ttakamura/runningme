 
class Player: AKInstrument {
    
    // INSTRUMENT PROPERTIES =====================================================
    
    var azimuth              = AKInstrumentProperty(value: 0.0, minimum: -180.0, maximum: 180.0)
    var elevation            = AKInstrumentProperty(value: 0.0, minimum: -40.0,  maximum: 90.0)
    var reverbFeedback       = AKInstrumentProperty(value: 0.0, minimum: 0.0,    maximum: 0.99)
    var reverbLevel          = AKInstrumentProperty(value: 0.0, minimum: 0.0,    maximum: 0.99)
    
    override init() {
        super.init()
        
        // INSTRUMENT DEFINITION ==================================================

        //let file = AKManager.pathToSoundFile("PianoBassDrumLoop", ofType: "wav")
        let file = NSBundle.mainBundle().pathForResource("running", ofType: "wav")
        let fileIn = AKFileInput(filename: file!)
        //fileIn.loop = true
        
        // EFFECTS  ==================================================
        let mono = AKMix(monoAudioFromStereoInput: fileIn)
        
        // Binaural Audio
        let binaural = AK3DBinauralAudio(input: mono)
        binaural.azimuth = azimuth
        binaural.elevation = elevation
        
        // Reverb
        let reverb = AKReverb(stereoInput: binaural)
        reverb.feedback = reverbFeedback.plus(akp(0.2))
        
        // Mixer
        let mixL = AKMix(input1: binaural.leftOutput, input2: reverb.leftOutput, balance: reverbLevel)
        let mixR = AKMix(input1: binaural.rightOutput, input2: reverb.rightOutput, balance: reverbLevel)
        let mix = AKStereoAudio(leftAudio: mixL, rightAudio: mixR)
        
        // AUDIO OUTPUT ========================================================
        setStereoAudioOutput(mix)
    }
    
    func rotate(value: Float){
        // print("\(value)")
        
        self.elevation.value = value
        self.reverbFeedback.value = fabs(value)/360.0
        self.reverbLevel.value    = fabs(value)/360.0
    }
}

