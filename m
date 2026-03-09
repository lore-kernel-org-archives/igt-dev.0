Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8138EFCD88
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 10:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FAF10E00A;
	Mon,  9 Mar 2026 10:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BOz56qv0";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7D110E00A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 10:31:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3D5B64E425DF;
 Mon,  9 Mar 2026 10:31:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0A2BA5FFB8;
 Mon,  9 Mar 2026 10:31:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EAB3210369AA7; Mon,  9 Mar 2026 11:31:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773052280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=zs3MzGQdb8Xywtz/8gKz0XEjLY0yVDNixylVDGUFOK8=;
 b=BOz56qv0qGegyiTsQZcZtv4tPvCAVvUJFbjek3aGYZwo/060kXtqJrM/yupG9+hu7wjMmR
 agKTDCQDiH4v8uMHuvUh4szVdTvPS+Qt8Qsz9m+oKTsl7ymZPA7Dyd2H1MEO5XFtiupqDr
 Tm7L7K8QfsE1GY3M07JeMA2YvvbtAanEMnJcXUTYaDwg/HT69792RRpNvPk2zpVOwbdwpH
 bn5CWQOiqccZmQ7YtH8+44sdgSlSd//rk2YfghR9hXu8rRME0Mq7XTmC2HPMFDYIK8b0Qp
 ZYVv6qD8Yb7UNed4TPGf1I2hz6Kr9iLJwplAnvLF9bngiKyVqfGLkN8eiBhV1w==
Message-ID: <e4bd5ad3-9d1f-4be3-941e-004fd57233b8@bootlin.com>
Date: Mon, 9 Mar 2026 11:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_bw: Skip tests when outputs don't support
 the mode
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>
Cc: Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260225160408.4116524-1-jason-jh.lin@mediatek.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260225160408.4116524-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 2/25/26 17:03, Jason-JH Lin wrote:
> The kms_bw test uses hardcoded display timings that may not match
> what connected panels support. This causes test failures when forcing
> unsupported modes on fixed-mode panels like DSI.
> 
> Add output_mode_supported() to check if a mode exists in the
> connector's mode list before using it. Skip outputs that don't
> support the requested mode during buffer creation, CRC collection,
> and cleanup.
> 
> For multi-output tests, proceed if at least one output supports
> the mode. Skip only if all outputs reject it.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   tests/kms_bw.c | 39 +++++++++++++++++++++++++++++++++++----
>   1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 778900d8c9f1..dc79ccc001f1 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -187,6 +187,35 @@ static void force_output_mode(data_t *d, igt_output_t *output,
>   	igt_output_override_mode(output, mode);
>   }
>   
> +static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	int i;
> +
> +	/* Virtual/forced sinks support all modes */
> +	if (!igt_output_is_connected(output))
> +		return true;> +	for (i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *conn_mode = &connector->modes[i];
> +
> +		if (conn_mode->hdisplay == mode->hdisplay &&
> +		    conn_mode->vdisplay == mode->vdisplay &&
> +		    conn_mode->vrefresh == mode->vrefresh) {
> +			igt_info("Found matching mode for %dx%d@%dHz on %s\n",
> +				 mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +				 igt_output_name(output));

Hello,

I think this should be a igt_debug, I don't think this is useful to see 
it every time in normal operations.

With or without this:
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks,
Louis Chauvet

> +			return true;
> +		}
> +	}
> +
> +	igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes)\n",
> +		 mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +		 igt_output_name(output), connector->count_modes);
> +
> +	return false;
> +}
> +
>   static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode, bool physical) {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> @@ -194,7 +223,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	igt_crc_t zero, captured[IGT_MAX_PIPES];
>   	int i = 0, num_pipes = 0;
>   	igt_crtc_t *crtc;
> -	int ret;
> +	int ret = -EINVAL;
>   
>   	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where they do
>   	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
> @@ -211,7 +240,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	/* create buffers */
>   	for (i = 0; i <= pipe; i++) {
>   		output = physical ? data->connected_output[i] : data->output[i];
> -		if (!output) {
> +		if (!output || !output_mode_supported(output, mode)) {
>   			continue;
>   		}
>   
> @@ -228,7 +257,9 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   		igt_plane_set_fb(data->primary[i], &buffer[i]);
>   		igt_info("Assigning pipe %s to output %s with mode %s\n",
>   			 kmstest_pipe_name(i), igt_output_name(output), mode->name);
> +		ret = 0;
>   	}
> +	igt_skip_on_f(ret != 0, "Unsupported mode for all pipes\n");
 >
>   	ret = igt_display_try_commit_atomic(display,
>   					    DRM_MODE_ATOMIC_ALLOW_MODESET |
> @@ -240,7 +271,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   
>   	for (i = 0; i <= pipe; i++) {
>   		output = physical ? data->connected_output[i] : data->output[i];
> -		if (!output) {
> +		if (!output || !output_mode_supported(output, mode)) {
>   			continue;
>   		}
>   
> @@ -251,7 +282,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   
>   	for (i = pipe; i >= 0; i--) {
>   		output = physical ? data->connected_output[i] : data->output[i];
> -		if (!output)
> +		if (!output || !output_mode_supported(output, mode))
>   			continue;
>   
>   		igt_remove_fb(display->drm_fd, &buffer[i]);

