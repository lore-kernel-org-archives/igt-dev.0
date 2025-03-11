Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBACFC28B2E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 08:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAC310E530;
	Tue, 11 Mar 2025 08:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JK8dUf+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E120610E530
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 08:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741682961; x=1773218961;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ALDo69bF+aqlDylZORwqoq6SVsQY1AG54Pt8AigUOr4=;
 b=JK8dUf+pK+oAycQW0dtWrb4cjyhYEzpjBim1gauNMzViX9cIXj6O7GjR
 TIJ7UIQIIAqyOI908JjW797RZrj8jtcHC6dnuTc2t+/c+Qbr8/k2erQg8
 aPEPrJ/yIZ4MG/zE2iR0S23EVHFxQyZKGJkmd88mG0p48tJXJxrTjxW32
 2S/qS7w3w0qKoXJKJfFfioa1WQI6Hn5m++SzZEp/q/vCE4W56t6QnD74d
 aiFlJVrMkczAu7XFSwWXDycZHYzhrWz9QR5JjKNkgGPuEO9kIF2wgGrYw
 PTwyFOhJWdnHIiqil6EoYzqNw4yKrJeISEtragU703xq2JoT9ljlzjhdb g==;
X-CSE-ConnectionGUID: WuNZQ+vBTc2tnizudiYyxg==
X-CSE-MsgGUID: v30hUHkgQw2NgHJiR6LJZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42741446"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42741446"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:49:20 -0700
X-CSE-ConnectionGUID: L6Zsp+PSQVSuGQy2MbSI+w==
X-CSE-MsgGUID: XLwxVCvgRmKsVUokqwobTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120178618"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:49:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com, Leo Li
 <sunpeng.li@amd.com>, Uma Shankar <uma.shankar@intel.com>, Ramanaidu
 Naladala <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_sysfs: Update DRM debug severity
 handling to use bitmask for verbosity control
In-Reply-To: <20250310171539.273699-2-pranay.samala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250310171539.273699-1-pranay.samala@intel.com>
 <20250310171539.273699-2-pranay.samala@intel.com>
Date: Tue, 11 Mar 2025 10:49:14 +0200
Message-ID: <87ikoggdf9.fsf@intel.com>
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

On Mon, 10 Mar 2025, Pranay Samala <pranay.samala@intel.com> wrote:
> This approach ensures precise control by modifying
> specific bits in the DRM debug mask.
>
> Updated the DRM debug severity logic to use bitwise
> operations to unset unwanted bits in the debug mask.
> The function now only sets the bits that are passed,
> allowing for more granular control over the logging output.

Please don't call it "severity" when drm debug is about "category".

You can't say one category is more "severe" than another.

>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
>
> Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_sysfs.c | 54 ++++++++++++++++++++++++++-----------------------
>  lib/igt_sysfs.h | 19 ++++++++++++++---
>  2 files changed, 45 insertions(+), 28 deletions(-)
>
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 2e4c2ee63..2a3cb68e4 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -443,69 +443,71 @@ int igt_sysfs_drm_module_params_open(void)
>  	return open(path, O_RDONLY);
>  }
>  
> -static int log_level = -1;
> +static int log_severity = -1;
>  
>  /**
> - * igt_drm_debug_level_get:
> + * igt_drm_debug_severity_get:
>   *
> - * This reads the current debug log level of the machine on
> + * This reads the current debug log severity of the machine on
>   * which the test is currently executing.
>   *
>   * Returns:
> - * The current log level, or -1 on error.
> + * The current log severity, or -1 on error.
>   */
> -int igt_drm_debug_level_get(int dir)
> +int igt_drm_debug_severity_get(int dir)
>  {
>  	char buf[20];
>  
> -	if (log_level >= 0)
> -		return log_level;
> +	if (log_severity >= 0)
> +		return log_severity;
>  
> -	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
> +	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf)) < 0)
>  		return -1;
>  
>  	return atoi(buf);
>  }
>  
>  /**
> - * igt_drm_debug_level_reset:
> + * igt_drm_debug_severity_reset:
>   *
> - * This modifies the current debug log level of the machine
> + * This modifies the current debug log severity of the machine
>   * to the default value post-test.
>   *
>   */
> -void igt_drm_debug_level_reset(void)
> +void igt_drm_debug_severity_reset(void)
>  {
>  	char buf[20];
>  	int dir;
>  
> -	if (log_level < 0)
> +	if (log_severity < 0)
>  		return;
>  
>  	dir = igt_sysfs_drm_module_params_open();
>  	if (dir < 0)
>  		return;
>  
> -	igt_debug("Resetting DRM debug level to %d\n", log_level);
> -	snprintf(buf, sizeof(buf), "%d", log_level);
> +	igt_debug("Resetting DRM debug severity to 0x%x\n", log_severity);
> +	snprintf(buf, sizeof(buf), "%d", log_severity);
>  	igt_assert(igt_sysfs_set(dir, "debug", buf));
>  
>  	close(dir);
>  }
>  
> -static void igt_drm_debug_level_reset_exit_handler(int sig)
> +static void igt_drm_debug_severity_reset_exit_handler(int sig)
>  {
> -	igt_drm_debug_level_reset();
> +	igt_drm_debug_severity_reset();
>  }
>  
>  /**
> - * igt_drm_debug_level_update:
> - * @debug_level: new debug level to set
> + * igt_drm_debug_severity_update:
> + * @debug_severity: new debug severity to set
>   *
> - * This modifies the current drm debug log level to the new value.
> + * This modifies the current drm debug log severity to the new value.
>   */
> -void igt_drm_debug_level_update(unsigned int new_log_level)
> +
> +void igt_drm_debug_severity_update(enum drm_debug_category category_to_set)

This should accept a mask instead of a single category, and the function
and parameter naming should reflect that.

>  {
> +	unsigned int new_log_severity;
>  	char buf[20];
>  	int dir;
>  
> @@ -513,14 +515,16 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
>  	if (dir < 0)
>  		return;
>  
> -	log_level = igt_drm_debug_level_get(dir);
> -	if (log_level < 0) {
> +	log_severity = igt_drm_debug_severity_get(dir);
> +	if (log_severity < 0) {
>  		close(dir);
>  		return;
>  	}

This doesn't seem to handle nested updates. The reset will put this back
to the previous value, not the original value.

>  
> -	igt_debug("Setting DRM debug level to %d\n", new_log_level);
> -	snprintf(buf, sizeof(buf), "%d", new_log_level);
> +	new_log_severity = category_to_set;
> +
> +	igt_debug("Setting DRM debug severity to 0x%x\n", new_log_severity);
> +	snprintf(buf, sizeof(buf), "%d", new_log_severity);
>  	igt_assert(igt_sysfs_set(dir, "debug", buf));
>  
>  	close(dir);
> @@ -529,7 +533,7 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
>  	 * TODO: Check whether multiple exit handlers will get installed,
>  	 * if we call this api multiple times
>  	 */
> -	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);
> +	igt_install_exit_handler(igt_drm_debug_severity_reset_exit_handler);
>  }
>  
>  /**
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 86345f3d1..c2e15320d 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -143,9 +143,22 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
>  void bind_fbcon(bool enable);
>  void fbcon_blink_enable(bool enable);
>  
> -void igt_drm_debug_level_update(unsigned int new_log_level);
> -void igt_drm_debug_level_reset(void);
> -int igt_drm_debug_level_get(int dir);
> +enum drm_debug_category {
> +	DRM_UT_CORE      = 1 << 0,
> +	DRM_UT_DRIVER    = 1 << 1,
> +	DRM_UT_KMS       = 1 << 2,
> +	DRM_UT_PRIME     = 1 << 3,
> +	DRM_UT_ATOMIC    = 1 << 4,
> +	DRM_UT_VBL       = 1 << 5,
> +	DRM_UT_STATE     = 1 << 6,
> +	DRM_UT_LEASE     = 1 << 7,
> +	DRM_UT_DP        = 1 << 8,
> +	DRM_UT_DRMRES    = 1 << 9,
> +};
> +
> +void igt_drm_debug_severity_update(enum drm_debug_category category_to_set);
> +void igt_drm_debug_severity_reset(void);
> +int igt_drm_debug_severity_get(int dir);
>  int igt_sysfs_drm_module_params_open(void);
>  
>  /**

-- 
Jani Nikula, Intel
