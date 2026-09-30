Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5249FCA5FB1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 11:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BCF10E168;
	Wed, 30 Sep 2026 11:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="XMVE4Fe4";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F15410E168
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 11:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1790766529;
 bh=KbWVTfw66mZMdOSrocAnzMQM+kDE2BG7sHNTCdaojks=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=XMVE4Fe4Dc/aBR//JMYDC24geZ8fqzOvaeoM3LpoEe3YdFyYGI8kW+4hQaKv9IOed
 1lsemvVytBmRwQ2GpqETm+JWVdLnbeZPGJiB9AfBxZW47+JAjiklAT3KEiNihzf0XF
 cGKQV1Lkw1aXcTWLUL0AwlVufZnpxjIXU1oaSSkSffv535ibLTOwNWHkP7dX1l0CEJ
 TiKahkI9OA44Azu8vZ974raZYjuWM0DVcqyI65vI6rDGJm02gWRQDjShrO24EWJnPa
 /+TOdqM/tjm5dbpB0vVrvfPapHghBpztMMm/N0e7iWyA1bBzbAaFBBIAi/SYir60/4
 ttxW+ptPYvBzQ==
Message-ID: <81d651a4-59c4-4f28-a2f7-c3688ee89997@lankhorst.se>
Date: Wed, 30 Sep 2026 13:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_color: Check crtc/output combo in
 bg-color test
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20260929183216.1139425-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260929183216.1139425-1-swati2.sharma@intel.com>
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

Hey,

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

On 9/29/26 20:32, Swati Sharma wrote:
> The background-color subtest does not validate whether the
> crtc/output combination is valid before committing. On
> big-joiner configurations, the output cannot be driven by a
> given pipe (e.g. pipe D), so the atomic commit fails and the
> dynamic subtest reports FAIL instead of SKIP.
> 
> Add crtc_output_combo_valid() check after test_setup(), so
> unsupported combinations are skipped.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_color.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 79ad6640a..fd419489d 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -994,6 +994,8 @@ run_background_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t
>  
>  	mode = igt_output_get_mode(output);
>  
> +	igt_require(crtc_output_combo_valid(data, crtc));
> +
>  	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>  		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
>  

