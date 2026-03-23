Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155B7EC01AC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B7310E037;
	Mon, 23 Mar 2026 09:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HiDUGMsN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C155310E037
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774257924; x=1805793924;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rig0vSvvlJvVbkHH4DZFEnrK4gYyvpMitmVZICbdzL8=;
 b=HiDUGMsNrMPZ1tKy5H2Kmb25eQsZ4m2NKTvt0PSj5yJzRQWYKBhs2QSM
 UpHR4XBjo2sOa9OCAJOTndnD/QyPL+RAT8Pi4KshFimfH4BX9XrneQm55
 iGcQ8bRM7hZ03DDqk8zC/ZiTw9k7iiCQgls7bmjAjEB/s4KujmOKlMqDg
 k1+RNZIUUigbkJEtd9iL2qDHhCqlHgzt7hptj+72Ywvw1vl2/XaO9+LJM
 QzFfdhbPTMwBTG/QXEZf2S86KVjN6tHwGd6vqNMip5g5tqgDyAM1ZotyY
 mo3QRaas9q3qB4G9hIWgTL+WtoGwp5wsrARCqzwW5mF3kJKQ3aTS+QEmZ A==;
X-CSE-ConnectionGUID: Gub3kcjRRkeHOML8gjWFsg==
X-CSE-MsgGUID: x71uyoC3S7Cxc/fz2baDsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100702699"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="100702699"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:25:24 -0700
X-CSE-ConnectionGUID: OeEKlZZnQQCGdAjZIOoGYA==
X-CSE-MsgGUID: IIwFJBWzR4GoS+U2+KONFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="219621608"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:25:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Make helper use out-parameter
In-Reply-To: <20260323051049.2627387-2-pranay.samala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260323051049.2627387-1-pranay.samala@intel.com>
 <20260323051049.2627387-2-pranay.samala@intel.com>
Date: Mon, 23 Mar 2026 11:25:18 +0200
Message-ID: <bb732b6aa7a415e0e5e9848e74ddfd743994a8cd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 23 Mar 2026, Pranay Samala <pranay.samala@intel.com> wrote:
> Convert igt_get_non_joiner_mode() helper from returning a mode
> pointer to returning bool and filling an output parameter.
>
> Returning connector-owned pointer becomes invalid after connecter
> state changes/resets. Hence copying into called-owned argument,
> which keeps data stable and safe.
> Also update the doc for the new argument and return semantics.

This breaks the build and thus bisect.

Please do something like

$ git rebase -i origin -x 'ninja -C build'

before sending to ensure every commit builds.

BR,
Jani.

>
> Fixes: e404926ca0d7 ("lib/igt_kms: Add helper to get non-joiner mode")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_kms.c | 10 ++++++----
>  lib/igt_kms.h |  2 +-
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 197ed15d1..118890014 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7057,13 +7057,14 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   * igt_get_non_joiner_mode:
>   * @drm_fd: drm file descriptor
>   * @output: pointer to the output structure
> + * @mode: a pointer to a drm mode structure
>   *
>   * Finds the display mode from the output that does not require
>   * Big Joiner or Ultra Joiner.
>   *
> - * Returns: Pointer to non-joiner mode, or NULL if not found.
> + * Returns: True if non-joiner mode found.
>   */
> -drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output)
> +bool igt_get_non_joiner_mode(int drm_fd, igt_output_t *output, drmModeModeInfo *mode)
>  {
>  	drmModeConnector *connector;
>  	int max_dotclock;
> @@ -7077,11 +7078,12 @@ drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output)
>  		/* Check if mode requires joiner */
>  		if (!igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock) &&
>  		    !igt_ultrajoiner_possible(drm_fd, current_mode, max_dotclock)) {
> -			return current_mode;
> +			*mode = *current_mode;
> +			return true;
>  		}
>  	}
>  
> -	return NULL;
> +	return false;
>  }
>  
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 71ed4604e..d63836588 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1259,7 +1259,7 @@ bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock
>  bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>  			  int max_dotclock, drmModeModeInfo *mode);
>  bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
> -drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output);
> +bool igt_get_non_joiner_mode(int drm_fd, igt_output_t *output, drmModeModeInfo *mode);
>  bool is_joiner_mode(int drm_fd, igt_output_t *output);
>  bool igt_check_force_joiner_status(int drmfd, char *connector_name);
>  bool igt_check_bigjoiner_support(igt_display_t *display);

-- 
Jani Nikula, Intel
