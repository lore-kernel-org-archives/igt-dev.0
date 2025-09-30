Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E2CCA471
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 10:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7EC10E560;
	Tue, 30 Sep 2025 10:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="d/1tLjp3";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7CE10E55F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:37:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 064DF4E40DF4;
 Tue, 30 Sep 2025 10:37:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D1304606E4;
 Tue, 30 Sep 2025 10:36:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B3B0C102F17D5; 
 Tue, 30 Sep 2025 12:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759228619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=vzX8q0GgLE4KRMk8yCXV6ouBJ80rbW/lbfsqrM7FD8E=;
 b=d/1tLjp3Buf4Re4xY3pRMzhc4lvWAJ01vz4PQjAa7ufG4ZxJdF0/NG7Rg39tjXK8HUyWmN
 TpeD8ScSJeXaMoRulvlU5m/9T6Cy1r6ZbHcEyHfaJ9SdFucjpweRDOKrFIrR6aDSX7csK0
 NQHjBQRCNQUXbimkgokhx2fuEwDiKgS5vJBS1BJtzl+oZTrCenaBlNgR+AEIrKSU/O++aI
 MzETI1XFmDN8U8sXHeK5nqotD9zLdxPERBPKOxE+oESt8GHSF28hqDJ/gN9ltpqZzr7YKt
 h0/VfTkEYSR8p4l5eHXtnyTzKHXIwUY3G5O+FhdzYI9ZNbc6z9AJ5Sh+Nz6BoA==
Message-ID: <9e9c017d-aae9-4af7-8941-254edee40e6c@bootlin.com>
Date: Tue, 30 Sep 2025 12:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH V10 05/30] tests/kms_properties: Add colorop properties
 test
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-6-alex.hung@amd.com>
Content-Language: en-US, fr
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250815040659.3321102-6-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 15/08/2025 à 06:06, Alex Hung a écrit :
> From: Harry Wentland <harry.wentland@amd.com>
> 
> We've introduced the concept of a new DRM core object, the
> drm_colorop, to represent a color operation as part of a
> color pipeline.
> 
> Add new tests to kms_properties to test the properties of
> a drm_colorop object.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   tests/kms_properties.c | 69 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 3bdf23aad..a4d73fe1b 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -47,6 +47,7 @@
>    * @crtc:            CRTC
>    * @plane:           Plane
>    * @invalid:         Invalid (connector/crtc/plane)
> + * @colorop:         Colorop
>    *
>    * arg[2]:
>    *
> @@ -230,6 +231,39 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, boo
>   	}
>   }
>   
> +static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
> +{
> +	struct igt_fb fb;
> +	igt_plane_t *plane;
> +	igt_colorop_t *colorop;
> +	int i;
> +	int colorop_id = 0;
> +
> +	prepare_pipe(display, pipe, output, &fb);
> +
> +	for_each_plane_on_pipe(display, pipe, plane) {
> +		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
> +			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
> +
> +		/* iterate over all color pipelines on plane */
> +		for (i = 0; i < plane->num_color_pipelines; ++i) {
> +			/* iterate over all colorops in pipeline*/
> +			colorop = plane->color_pipelines[i];
> +			while (colorop) {
> +				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
> +					kmstest_pipe_name(pipe), plane->index, colorop->id, kmstest_plane_type_name(plane->type), output->name);
> +				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id, atomic, false);

Same as a previous patch, why do you pass false and not 
display->has_plane_color_pipeline?

> +
> +				colorop_id = igt_colorop_get_prop(display, colorop,
> +								IGT_COLOROP_NEXT);
> +				colorop = igt_find_colorop(display, colorop_id);
> +			}
> +		}
> +	}
> +
> +	cleanup_pipe(display, pipe, output, &fb);
> +}
> +
>   static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
>   {
>   	struct igt_fb fb;
> @@ -275,6 +309,37 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
>   		cleanup_pipe(display, pipe, output, &fb);
>   }
>   
> +static void colorop_properties(igt_display_t *display, bool atomic)
> +{
> +	bool found_any = false, found;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	/* colorops are only available with atomic */
> +	igt_skip_on(!display->is_atomic);
> +
> +	for_each_pipe(display, pipe) {
> +		found = false;
> +
> +		for_each_valid_output_on_pipe(display, pipe, output) {
> +			igt_display_reset(display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!intel_pipe_output_combo_valid(display))
> +				continue;
> +
> +			found_any = found = true;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +				igt_output_name(output)) {
> +				run_colorop_property_tests(display, pipe, output, atomic);
> +			}
> +		}
> +	}
> +
> +	igt_skip_on(!found_any);
> +}
> +
>   static void plane_properties(igt_display_t *display, bool atomic)
>   {
>   	igt_output_t *output;
> @@ -853,6 +918,10 @@ igt_main
>   		  "Tests connector properties with legacy commit" },
>   		{ "connector-properties-atomic", connector_properties, true,
>   		  "Tests connector properties with atomic commit" },
> +		{ "colorop-properties-legacy", colorop_properties, false,
> +		  "Tests colorop properties with legacy commit" },
> +		{ "colorop-properties-atomic", colorop_properties, true,
> +		  "Tests colorop properties with atomic commit" },
>   	};
>   
>   	igt_fixture {

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


