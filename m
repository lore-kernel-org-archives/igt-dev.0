Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A27FC590E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 08:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2610E10E885;
	Thu, 26 Feb 2026 08:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZH1Y9uo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5194310E885
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772095752; x=1803631752;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yBCnRFafFrYxlncOMVZCSFhZAUKnSg4ztDNx1JgGcJU=;
 b=jZH1Y9uo+iEwlEaV4WvuN59t2Pkz/wM07JtyHubNA5tviDvAqHr244B3
 vqH761/+woB0b6VDhYYv5nlSsf3blURCakA8fhhh6/l8HgLTO0wc9CR2C
 lhiX4kxS9CR/jouCWNi4bMHpsy3MQ0BrVz8v9I2mPdXJztR8E6Mn/pfVO
 ZhdwKgt2lz+IMN8Kj2pcnvhCxtsiupnYGpj+C6DaDoaPgdutj1sBhs7XT
 MIHY9PlVRUtjCfdWcVE0aV8XlQd7bg0Zmd8TMCF57POBm53C+nIeWL8oh
 gF6f98ySZvkZb0h2lAAvUxr+siinBgcAaitVnQZlv3kcHbGm8hVbgs4WK w==;
X-CSE-ConnectionGUID: MLML/PuFREKAXZ0qGgi6IQ==
X-CSE-MsgGUID: uTe2kw1hSI+JFLmluqWP7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="77019800"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="77019800"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:49:11 -0800
X-CSE-ConnectionGUID: rgT9hLSHT5eICoOSPY2L8Q==
X-CSE-MsgGUID: 8uzjH84GQ0CmwkZVT2HX4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214076702"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:49:09 -0800
Date: Thu, 26 Feb 2026 10:48:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v1] tests/kms_async_flips: validate mode before
 proceeding with fb creation
Message-ID: <aaAI0zP8UVB6TAjS@intel.com>
References: <20260225110510.1801049-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225110510.1801049-1-santhosh.reddy.guddati@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Feb 25, 2026 at 04:35:10PM +0530, Santhosh Reddy Guddati wrote:
> Validate mode before proceeding with creating frame buffers to avoid
> passing invalid parameters to the ioctl.
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 014b7f347..d00b36544 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -298,6 +298,12 @@ static void test_init(data_t *data)
>  	igt_display_commit(&data->display);
>  
>  	mode = igt_output_get_mode(data->output);

How would that even return some kind of invalid mode?
And why would it be a problem only for kms_async_flips?

> +	igt_require_f(kmstest_mode_is_valid(mode),
> +		      "Invalid mode on %s (%dx%d@%d)",
> +		      data->output->name,
> +		      mode ? mode->hdisplay : 0,
> +		      mode ? mode->vdisplay : 0,
> +		      mode ? mode->vrefresh : 0);
>  
>  	data->crtc_id = data->crtc->crtc_id;
>  	data->refresh_rate = mode->vrefresh;
> @@ -327,6 +333,12 @@ static void test_init_fbs(data_t *data)
>  	drmModeModeInfo *mode;
>  
>  	mode = igt_output_get_mode(data->output);
> +	igt_require_f(kmstest_mode_is_valid(mode),
> +		      "Invalid mode on %s (%dx%d@%d)",
> +		      data->output->name,
> +		      mode ? mode->hdisplay : 0,
> +		      mode ? mode->vdisplay : 0,
> +		      mode ? mode->vrefresh : 0);
>  	width = mode->hdisplay;
>  	height = mode->vdisplay;
>  
> @@ -672,6 +684,12 @@ static void test_invalid(data_t *data)
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  
>  	mode = igt_output_get_mode(data->output);
> +	igt_require_f(kmstest_mode_is_valid(mode),
> +		      "Invalid mode on %s (%dx%d@%d)",
> +		      data->output->name,
> +		      mode ? mode->hdisplay : 0,
> +		      mode ? mode->vdisplay : 0,
> +		      mode ? mode->vrefresh : 0);
>  	width = mode->hdisplay;
>  	height = mode->vdisplay;
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
