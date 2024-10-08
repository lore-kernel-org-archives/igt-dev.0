Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A4ACED26B
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 06:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C1510E03E;
	Tue,  8 Oct 2024 06:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMYGzk1o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B579010E03E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 06:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728367479; x=1759903479;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oLmQ3fWDw1J0bHXRwqSWYvzir+ru0GqytFlN+qMhtGo=;
 b=UMYGzk1o9sYLgNO113EDzBhZE2bC29rwpyN4V+xEcdOROo0ImVKI3EcF
 wH1ALTPhOBA9B4afxzlma9JRVMNyC2gAgY5I5nBEWfvweBYgssD/teft0
 cMS52Pc+FJUuMCPt8BZ+DCoX1iGxZP9TGKPOqx7FvJo5uhVduKQETdfTz
 Pt86dn67+oUpUI43oB17ZLmxZLDjl8bSOlpSPoWoSOfOwbSWknVHaHx9F
 FD3Y7X7F6jTJmJ4nLr/XzFLySl09fQEfiaIHOef+kZp0ZEMJegRuTuv/S
 jcpykgQSbE148NLQ8f7VYohsMOEDlcUd7pOL3xT3ZlbKWbd+3HsJUtdeg w==;
X-CSE-ConnectionGUID: ywP5u6kvSNC9ULtKAK2/8w==
X-CSE-MsgGUID: b8YllKihQ8K5TSYwrjSUcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38141323"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="38141323"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:04:38 -0700
X-CSE-ConnectionGUID: UeHbGq9lQqalOmQ8gkMKqw==
X-CSE-MsgGUID: vQnGfZH0Qom2LNv9ndj/hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="80501387"
Received: from barrys2-mobl1.ger.corp.intel.com (HELO [10.213.200.139])
 ([10.213.200.139])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:04:38 -0700
Message-ID: <2e883341-f0dc-434b-aa7f-fc91a8dcf2c7@linux.intel.com>
Date: Tue, 8 Oct 2024 08:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] lib/igt_audio: Replace GSL FFT usage with
 meow_fft
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <ryszard.knop@intel.com>
References: <20240913104434.56529-1-kamil.konieczny@linux.intel.com>
 <20240913104434.56529-4-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20240913104434.56529-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 13.09.2024 12:44, Kamil Konieczny wrote:
> From: Ryszard Knop <ryszard.knop@intel.com>
> 
> Tested by running kms_chamelium tests related with audio and comparing
> GSL and meow_fft outputs in a separate test program. It appears meow_fft
> is slightly less accurate than GSL (result differs after the 6th decimal
> place), but the error is low enough that it does not matter here.
> 
> v2: sort headers, remove blank spaces, fixed codestyle (Kamil)
> 

Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_audio.c | 74 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 60 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/igt_audio.c b/lib/igt_audio.c
> index e0b1bafe1..193f9aa05 100644
> --- a/lib/igt_audio.c
> +++ b/lib/igt_audio.c
> @@ -28,12 +28,14 @@
>  
>  #include <errno.h>
>  #include <fcntl.h>
> -#include <gsl/gsl_fft_real.h>
> +#include <limits.h>
>  #include <math.h>
>  #include <unistd.h>
>  
>  #include "igt_audio.h"
> +#include "igt_aux.h"
>  #include "igt_core.h"
> +#include "meow_fft/meow_fft.h"
>  
>  #define FREQS_MAX 64
>  #define CHANNELS_MAX 8
> @@ -322,6 +324,53 @@ static double hann_window(double v, size_t i, size_t N)
>  	return v * 0.5 * (1 - cos(2.0 * M_PI * (double) i / (double) N));
>  }
>  
> +/**
> + * run_fft:
> + * @array: The signal to run FFT on
> + * @length: The signal buffer length (must be a power of 2)
> + *
> + * Run the Fast Fourier Transform on the provided signal, whose
> + * length must be a power of 2. The return value points to an
> + * array of N/2 structs with real (.r) and imaginary (.j) parts.
> + *
> + * For the 0-th FFT element, only the real part is valid - its
> + * imaginary part is always 0 and is not saved anywhere.
> + *
> + * For the (N/2)-th element, again, only the real part is valid.
> + * The array does not have enough space to save it as a separate
> + * element, so its real part is saved in the 0-th element's
> + * imaginary part.
> + */
> +static Meow_FFT_Complex *run_fft(double *array, size_t length)
> +{
> +	size_t workset_bytes;
> +	Meow_FFT_Complex *fft_data;
> +	struct Meow_FFT_Workset_Real *fft_workset;
> +
> +	igt_assert(length >= 2 && is_power_of_two(length));
> +
> +	// Get size for a N point fft working on non-complex (real) data.
> +	workset_bytes = meow_fft_generate_workset_real(length, NULL);
> +	if (workset_bytes == 0)
> +		return NULL;
> +
> +	fft_data = malloc(sizeof(Meow_FFT_Complex) * length);
> +	if (!fft_data)
> +		return NULL;
> +
> +	fft_workset = (struct Meow_FFT_Workset_Real *)malloc(workset_bytes);
> +	if (!fft_workset) {
> +		free(fft_data);
> +		return NULL;
> +	}
> +
> +	meow_fft_generate_workset_real(length, fft_workset);
> +	meow_fft_real(fft_workset, array, fft_data);
> +	free(fft_workset);
> +
> +	return fft_data;
> +}
> +
>  /**
>   * Checks that frequencies specified in signal, and only those, are included
>   * in the input data.
> @@ -333,11 +382,12 @@ bool audio_signal_detect(struct audio_signal *signal, int sampling_rate,
>  			 int channel, const double *samples, size_t samples_len)
>  {
>  	double *data;
> +	Meow_FFT_Complex *fft_data;
>  	size_t data_len = samples_len;
>  	size_t bin_power_len = data_len / 2 + 1;
>  	double bin_power[bin_power_len];
>  	bool detected[FREQS_MAX];
> -	int ret, freq_accuracy, freq, local_max_freq;
> +	int freq_accuracy, freq, local_max_freq;
>  	double max, local_max, threshold;
>  	size_t i, j;
>  	bool above, success;
> @@ -360,27 +410,22 @@ bool audio_signal_detect(struct audio_signal *signal, int sampling_rate,
>  	freq_accuracy = sampling_rate / data_len;
>  	igt_debug("Allowed freq. error: %d Hz\n", freq_accuracy);
>  
> -	ret = gsl_fft_real_radix2_transform(data, 1, data_len);
> -	if (ret != 0) {
> +	fft_data = run_fft(data, data_len);
> +	if (!fft_data) {
>  		free(data);
>  		igt_assert(0);
>  	}
>  
> -	/* Compute the power received by every bin of the FFT.
> -	 *
> -	 * For i < data_len / 2, the real part of the i-th term is stored at
> -	 * data[i] and its imaginary part is stored at data[data_len - i].
> -	 * i = 0 and i = data_len / 2 are special cases, they are purely real
> -	 * so their imaginary part isn't stored.
> -	 *
> +	/* Compute the power received by every bin of the FFT. The run_fft
> +	 * function docs explain the special cases outside of the for loop.
>  	 * The power is encoded as the magnitude of the complex number and the
>  	 * phase is encoded as its angle.
>  	 */
> -	bin_power[0] = data[0];
> +	bin_power[0] = fft_data[0].r;
>  	for (i = 1; i < bin_power_len - 1; i++) {
> -		bin_power[i] = hypot(data[i], data[data_len - i]);
> +		bin_power[i] = hypot(fft_data[i].r, fft_data[i].j);
>  	}
> -	bin_power[bin_power_len - 1] = data[data_len / 2];
> +	bin_power[bin_power_len - 1] = fft_data[0].j;
>  
>  	/* Normalize the power */
>  	for (i = 0; i < bin_power_len; i++)
> @@ -487,6 +532,7 @@ bool audio_signal_detect(struct audio_signal *signal, int sampling_rate,
>  		}
>  	}
>  
> +	free(fft_data);
>  	free(data);
>  
>  	return success;

