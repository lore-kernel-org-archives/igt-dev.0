Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0D606A32E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mj6srTrX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82CC10FB18;
	Wed, 25 Nov 2026 10:43:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C64810FB0E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 10:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795603365; x=1827139365;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hHZtmBIF71mrJDCB1GaK+t6FC5WTsRbZc5W0v7ohUzw=;
 b=Mj6srTrXbalQ+pi03zC0iAQIkomq/XipcLwgx3XZ88jviKrZ2XEd++H+
 iBIOVqjW+yc19HvFWHTwlRx1T40qcXd+LIZTX9xpzqEbVkMfBz/28iz7S
 QxmW5QkdRweMw6bOm1YJ+kVWQoc767OeigtP7LG+lKWoGuB6D91B7RFst
 MsmXMOjSBb2xuNpyw/OS2Q614S5LrvYAagrLu09ChG3EZuyT2Lhsplt7R
 +oYITqhi5lGD4sR1VRzWAZSQQ+JYQj1QJxEPR1Guy/oCn4bVbalJTi9MM
 pvIWgNuaV0KA/NrbsPVmbonKfxbp8p1oaOkvdNbO4M3SlQ5bGczxFqaI4 Q==;
X-CSE-ConnectionGUID: zQq8Tm/4QZOPjZUWajJjWA==
X-CSE-MsgGUID: X5qcbrH8S8Sq/BX5GGWiBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4365719"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4365719"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 02:42:44 -0800
X-CSE-ConnectionGUID: qWVjyoQ4T5GD+KLtejM2EA==
X-CSE-MsgGUID: bzvyJcOgSgWSJERYMP2Pjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11962119"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 02:42:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
Cc: jeevan.b@intel.com, sowmiya.s@intel.com, ankit.k.nautiyal@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] lib/igt_kms: Add max uncompressed dotclock
 limit for non-joiner mode selection
In-Reply-To: <20261125102352.1905996-2-karthik.b.s@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261125102352.1905996-1-karthik.b.s@intel.com>
 <20261125102352.1905996-2-karthik.b.s@intel.com>
Date: Wed, 25 Nov 2026 12:42:40 +0200
Message-ID: <e88a6659109163b48e9f60fa66a6214e27506ba4@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026, Karthik B S <karthik.b.s@intel.com> wrote:
> From display 30 the kernel limits the single pipe pixel rate without
> DSC to the maximum validated frequency, which is below the max dotclock
> derived from CDCLK and reported in debugfs (see
> intel_max_uncompressed_dotclock()). Above this limit an uncompressed
> mode can't be driven by a single pipe.
>
> intel_boundary_non_joiner_mode_found() only checks against the max
> dotclock, so on a sink without DSC support it can select a boundary
> mode which the kernel drives with joiner.
>
> Add intel_get_max_uncompressed_dotclock() mirroring the kernel limits
> and use it in intel_boundary_non_joiner_mode_found(), so that the
> selected boundary mode stays on a single pipe irrespective of DSC
> support in the sink.
>
> v2: Use macros for the limits, rename max_clock to
>     max_uncompressed_dotclock (Sowmiya)
>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Side note, IMO *all* joiner stuff should be abstracted out from
igt_kms.[ch]. This is supposed to be generic and common stuff for
everyone, and having loads of Intel specific joiner code in there is
sending the wrong message.

BR,
Jani.

> ---
>  lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++--
>  lib/igt_kms.h |  3 +++
>  2 files changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 789da08b3..9c4c9b8ff 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7223,6 +7223,32 @@ int igt_get_current_cdclk(int fd)
>  	return read_and_parse_cdclk_debugfs(fd, "Current CD clock frequency:");
>  }
>  
> +/**
> + * intel_get_max_uncompressed_dotclock:
> + * @drm_fd: drm file descriptor
> + * @max_dotclock: Max pixel clock frequency
> + *
> + * Get the maximum pixel clock a single pipe supports without DSC. This
> + * mirrors the kernel's intel_max_uncompressed_dotclock(): above this
> + * limit an uncompressed mode can't be driven by a single pipe, so only
> + * modes below it are guaranteed to use a single pipe irrespective of
> + * DSC support in the sink.
> + *
> + * Returns: The maximum uncompressed pixel clock for a single pipe.
> + */
> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock)
> +{
> +	int dev_id = intel_get_drm_devid(drm_fd);
> +	int limit = max_dotclock;
> +
> +	if (IS_WILDCATLAKE(dev_id))
> +		limit = MAX_UNCOMPRESSED_DOTCLOCK_WCL;
> +	else if (intel_display_ver(dev_id) >= 30)
> +		limit = MAX_UNCOMPRESSED_DOTCLOCK_DISPLAY_30;
> +
> +	return min(max_dotclock, limit);
> +}
> +
>  /**
>   * intel_get_max_pipe_hdisplay:
>   * @drm_fd: drm file descriptor
> @@ -7356,7 +7382,9 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   * @mode: libdrm mode to be filled
>   *
>   * Check if connector supports a mode at the platform's maximum single-pipe
> - * hdisplay boundary.
> + * hdisplay boundary. The mode clock must be below the uncompressed single
> + * pipe limit, so that the kernel doesn't fall back to joiner when the sink
> + * doesn't support DSC.
>   *
>   * Returns: True if a valid non-joiner mode at the boundary is found,
>   * false otherwise.
> @@ -7365,12 +7393,13 @@ bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connecto
>  					  int max_dotclock, drmModeModeInfo *mode)
>  {
>  	int max_hdisplay = intel_get_max_pipe_hdisplay(drm_fd);
> +	int max_uncompressed_dotclock = intel_get_max_uncompressed_dotclock(drm_fd, max_dotclock);
>  
>  	for (int i = 0; i < connector->count_modes; i++) {
>  		drmModeModeInfo *current_mode = &connector->modes[i];
>  
>  		if (current_mode->hdisplay == max_hdisplay &&
> -		    current_mode->clock < max_dotclock &&
> +		    current_mode->clock < max_uncompressed_dotclock &&
>  		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
>  			*mode = *current_mode;
>  			return true;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index dfcb91e02..29a4e96fc 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -154,6 +154,8 @@ const char *kmstest_dsc_output_format_str(int output_format);
>  void kmstest_dump_mode(drmModeModeInfo *mode);
>  #define HDISPLAY_6K_PER_PIPE 6144
>  #define HDISPLAY_5K_PER_PIPE 5120
> +#define MAX_UNCOMPRESSED_DOTCLOCK_DISPLAY_30 1350000
> +#define MAX_UNCOMPRESSED_DOTCLOCK_WCL 937500
>  
>  enum hardware_pipe __intel_get_pipe_from_crtc_index(int fd, int crtc_index);
>  int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
> @@ -1381,6 +1383,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>  bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
>  			    igt_output_t *output, int bpc);
>  int igt_get_max_dotclock(int fd);
> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock);
>  int intel_get_max_pipe_hdisplay(int drm_fd);
>  int igt_get_max_cdclk(int fd);
>  int igt_get_current_cdclk(int fd);

-- 
Jani Nikula, Intel
