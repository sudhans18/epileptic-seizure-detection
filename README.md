<h1 align="center">Epileptic Seisure Detection</h1>

## 🧠 About This Project

This mini-project explores the detection of epileptic seizures using EEG signal data and machine learning techniques implemented in MATLAB. Developed as part of the Digital Signal Processing lab coursework, it demonstrates foundational skills in signal preprocessing, feature analysis, and classification workflows.

While the scope is academic, the methodology aligns with practical challenges in biomedical signal processing—laying groundwork for future exploration into clinical applications and real-time prediction systems.
<table>
  <tr>
    <td style="vertical-align: top;">
      <img width="474" height="267" alt="Epileptic Seizure Image" src="https://github.com/user-attachments/assets/2fc5ebf4-97b2-4ab5-b7cc-05038b0791ed" />
    </td>
    <td style="vertical-align: top; padding-left: 40px;">
      <strong>Epileptic Seizure:</strong><br>
      A transient occurrence of signs and/or symptoms caused by abnormal, excessive, or synchronous neuronal activity in the brain.<br><br>
      <strong>Epilepsy:</strong><br>
      A chronic neurological disorder marked by recurrent, unprovoked seizures. It reflects an enduring predisposition to generate epileptic seizures and is often accompanied by cognitive, psychological, and social consequences.
    </td>
  </tr>
</table>



## ⚙️ Methodology

1. **Dataset Acquisition**: EEG signals sourced from the publicly available Bonn University dataset, encompassing five distinct categories (A–E), totaling 500 EEG recordings.
2. **Preprocessing**: Bandpass filtering and smoothing applied to raw signals. Each 4097-point time series was segmented into 1-second windows of 178 data points.
3. **Labeling**: Segments labeled based on seizure presence, with class `1` indicating epileptic seizure activity and classes `2–5` denoting non-seizure cases.
4. **Model Training**: Features extracted from each segment were fed into machine learning classifiers (e.g., Random Forest, SVM) implemented in MATLAB.
5. **Performance Evaluation**: Accuracy and confusion matrices used to assess model performance.


