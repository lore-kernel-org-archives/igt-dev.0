Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBECC25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 08:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDC510E06C;
	Wed, 22 May 2024 08:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MdHDMiOl";
	dkim-atps=neutral
X-Greylist: delayed 894 seconds by postgrey-1.36 at gabe;
 Wed, 22 May 2024 08:51:00 UTC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3171710E06C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 08:50:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE976FF810;
 Wed, 22 May 2024 08:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1716367856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4sC8dmJUT7KKlv/71iksNTCvvgE4JTcB7AeeokspWmA=;
 b=MdHDMiOlxFf/Qwf7f18+aH3oPklEjJan8W0t3czq3fSr9vRxthybysYTrsr3GwcGqsvmOw
 xk6XWU5wmowkK1Bn7Yow3xzQYcu2a/EDx6IEsrj5phubWRMtOWU9cC/1dno1UVRgS1hEGZ
 XzO03bu9B6m137Z9F/SaPUoZfWCpUylw+ysNHVo9QXp69yRIWJljl3G/V6oKAjQTWRzhrE
 iRXgi9brJNrrtg8+81kKT1+Nvn0yjMsQRpmOpEIT4HyPAcL7jrJECVmEk4+Ueir9/dGZQ+
 LMVDFbEEuNKFBvRE3At+vqIg3j3ztwmAgwN9BVO3YlGpflxdDe7vg0dLFt1+Zg==
Date: Wed, 22 May 2024 10:50:54 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t v5 1/8] benchmarks/kms_fb_stress: Assert that we
 have an supported pipe
Message-ID: <Zk2x7nwtOnugJ2Io@localhost.localdomain>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
 <20240422-kms_fb_stress-dev-v5-1-0c577163dc88@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422-kms_fb_stress-dev-v5-1-0c577163dc88@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>

Le 22/04/24 - 19:18, Arthur Grillo a écrit :
> Some driver may not support overlay planes. Add a check for that.
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 36 +++++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 00eaa0a4931a..e9c051318ed6 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -87,6 +87,27 @@ static igt_output_t *find_wb_output(struct data_t *data)
>  	return NULL;
>  }
>  
> +static void set_wb_pipe(struct data_t *data)
> +{
> +	enum pipe pipe = PIPE_NONE;
> +
> +	for_each_pipe(&data->display, pipe) {
> +		igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
> +
> +		if (igt_pipe_count_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY) < 2)
> +			continue;
> +
> +		igt_debug("Selecting pipe %s to %s\n",
> +			  kmstest_pipe_name(pipe),
> +			  igt_output_name(data->wb_output));
> +		igt_output_set_pipe(data->wb_output, pipe);
> +
> +		return;
> +	}
> +
> +	igt_assert_f(0, "No pipe supports this benchmark\n");
> +}
> +
>  static void set_crtc_size(struct data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -142,7 +163,6 @@ static struct kms_t default_kms = {
>  igt_simple_main
>  {
>  	struct data_t data = {0};
> -	enum pipe pipe = PIPE_NONE;
>  	struct timespec then, now;
>  	double elapsed;
>  
> @@ -161,24 +181,22 @@ igt_simple_main
>  
>  	data.wb_output = find_wb_output(&data);
>  	igt_require(data.wb_output);
> -
> -	for_each_pipe(&data.display, pipe) {
> -		igt_debug("Selecting pipe %s to %s\n",
> -			  kmstest_pipe_name(pipe),
> -			  igt_output_name(data.wb_output));
> -		igt_output_set_pipe(data.wb_output, pipe);
> -		break;
> -	}
> +	set_wb_pipe(&data);
>  
>  	set_crtc_size(&data);
>  
>  	gen_fbs(&data);
>  
>  	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(data.kms.primary.base != NULL);
> +
>  	data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
>  								  DRM_PLANE_TYPE_OVERLAY, 0);
> +	igt_assert(data.kms.overlay_a.base != NULL);
> +
>  	data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
>  								  DRM_PLANE_TYPE_OVERLAY, 1);
> +	igt_assert(data.kms.overlay_b.base != NULL);
>  
>  	igt_assert_eq(igt_gettime(&then), 0);
>  
> 
> -- 
> 2.44.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
