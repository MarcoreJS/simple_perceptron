class Perceptron {
  float[] weights;
  float lr = 0.001;
  
  Perceptron (int n) {
    weights = new float[n];
    for(int i = 0; i < weights.length; i++){
      weights[i] = random(-1, 1); 
    } 
  }
  
  int feedForward(float[] inputs) {
    float sum = 0;
    for(int i = 0; i < weights.length; i++){
      sum += inputs[i] * weights[i]; 
    }
    return activate(sum);
  }
  
  int activate(float sum) {
   if(sum > 0) return 1;
   else return -1;
  }
  
  void train(float[] inputs, int target) {
   int guess = feedForward(inputs);
   int error = target - guess;
   
   for(int i = 0; i < weights.length; i++){
      weights[i] += error * inputs[i] * lr;
    }
  }
  
  float guessY(float x) {
    float w0 = weights[0];
    float w1 = weights[1];
    float w2 = weights[2];
    return -(w2 / w1) - (w0/w1) * x;
  }
}
