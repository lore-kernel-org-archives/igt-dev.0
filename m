Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC1FD2E6B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:18:24 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:18:01 +0200
Message-Id: <20220809121801.1044402-4-ryszard.knop@intel.com>
In-Reply-To: <20220809121801.1044402-1-ryszard.knop@intel.com>
References: <20220809121801.1044402-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] lib/igt_audio: Replace GSL FFT usage
 with meow_fft
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Tested by running kms_chamelium tests related with audio and comparing
GSL and meow_fft outputs in a separate test program. It appears meow_fft
is slightly less accurate than GSL (result differs after the 6th decimal
place), but the error is low enough that it does not matter here.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/igt_audio.c | 79 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 17 deletions(-)

diff --git a/lib/igt_audio.c b/lib/igt_audio.c
index e0b1bafe..19aa5eb7 100644
--- a/lib/igt_audio.c
+++ b/lib/igt_audio.c
@@ -28,12 +28,15 @@
 
 #include <errno.h>
 #include <fcntl.h>
-#include <gsl/gsl_fft_real.h>
 #include <math.h>
 #include <unistd.h>
+#include <limits.h>
 
-#include "igt_audio.h"
+#include "meow_fft/meow_fft.h"
+
+#include "igt_aux.h"
 #include "igt_core.h"
+#include "igt_audio.h"
 
 #define FREQS_MAX 64
 #define CHANNELS_MAX 8
@@ -322,6 +325,52 @@ static double hann_window(double v, size_t i, size_t N)
 	return v * 0.5 * (1 - cos(2.0 * M_PI * (double) i / (double) N));
 }
 
+/**
+ * run_fft:
+ * @array: The signal to run FFT on
+ * @length: The signal buffer length (must be a power of 2)
+ *
+ * Run the Fast Fourier Transform on the provided signal, whose
+ * length must be a power of 2. The return value points to an
+ * array of N/2 structs with real (.r) and imaginary (.j) parts.
+ * 
+ * For the 0-th FFT element, only the real part is valid - its
+ * imaginary part is always 0 and is not saved anywhere.
+ * 
+ * For the (N/2)-th element, again, only the real part is valid.
+ * The array does not have enough space to save it as a separate
+ * element, so its real part is saved in the 0-th element's
+ * imaginary part.
+ */
+static Meow_FFT_Complex *run_fft(double *array, size_t length) {
+	size_t workset_bytes;
+	Meow_FFT_Complex *fft_data;
+	struct Meow_FFT_Workset_Real* fft_workset;
+
+	igt_assert(length >= 2 && is_power_of_two(length));
+
+	// Get size for a N point fft working on non-complex (real) data.
+	workset_bytes = meow_fft_generate_workset_real(length, NULL);
+	if (workset_bytes == 0)
+		return NULL;
+
+	fft_data = malloc(sizeof(Meow_FFT_Complex) * length);
+	if (fft_data == NULL)
+		return NULL;
+
+	fft_workset = (struct Meow_FFT_Workset_Real*) malloc(workset_bytes);
+	if (fft_workset == NULL) {
+		free(fft_data);
+		return NULL;
+	}
+
+	meow_fft_generate_workset_real(length, fft_workset);
+	meow_fft_real(fft_workset, array, fft_data);
+	free(fft_workset);
+
+	return fft_data;
+}
+
 /**
  * Checks that frequencies specified in signal, and only those, are included
  * in the input data.
@@ -333,11 +382,12 @@ bool audio_signal_detect(struct audio_signal *signal, int sampling_rate,
 			 int channel, const double *samples, size_t samples_len)
 {
 	double *data;
+	Meow_FFT_Complex *fft_data;
 	size_t data_len = samples_len;
 	size_t bin_power_len = data_len / 2 + 1;
 	double bin_power[bin_power_len];
 	bool detected[FREQS_MAX];
-	int ret, freq_accuracy, freq, local_max_freq;
+	int freq_accuracy, freq, local_max_freq;
 	double max, local_max, threshold;
 	size_t i, j;
 	bool above, success;
@@ -360,27 +410,21 @@ bool audio_signal_detect(struct audio_signal *signal, int sampling_rate,
 	freq_accuracy = sampling_rate / data_len;
 	igt_debug("Allowed freq. error: %d Hz\n", freq_accuracy);
 
-	ret = gsl_fft_real_radix2_transform(data, 1, data_len);
-	if (ret != 0) {
+	fft_data = run_fft(data, data_len);
+	if (fft_data == NULL) {
 		free(data);
 		igt_assert(0);
 	}
 
-	/* Compute the power received by every bin of the FFT.
-	 *
-	 * For i < data_len / 2, the real part of the i-th term is stored at
-	 * data[i] and its imaginary part is stored at data[data_len - i].
-	 * i = 0 and i = data_len / 2 are special cases, they are purely real
-	 * so their imaginary part isn't stored.
-	 *
+	/* Compute the power received by every bin of the FFT. The run_fft
+	 * function docs explain the special cases outside of the for loop.
 	 * The power is encoded as the magnitude of the complex number and the
-	 * phase is encoded as its angle.
-	 */
-	bin_power[0] = data[0];
+	 * phase is encoded as its angle. */
+	bin_power[0] = fft_data[0].r;
 	for (i = 1; i < bin_power_len - 1; i++) {
-		bin_power[i] = hypot(data[i], data[data_len - i]);
+		bin_power[i] = hypot(fft_data[i].r, fft_data[i].j);
 	}
-	bin_power[bin_power_len - 1] = data[data_len / 2];
+	bin_power[bin_power_len - 1] = fft_data[0].j;
 
 	/* Normalize the power */
 	for (i = 0; i < bin_power_len; i++)
@@ -487,6 +531,7 @@ bool audio_signal_detect(struct audio_signal *signal, int sampling_rate,
 		}
 	}
 
+	free(fft_data);
 	free(data);
 
 	return success;
-- 
2.37.1
