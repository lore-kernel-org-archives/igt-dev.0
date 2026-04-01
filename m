Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1469D3517A
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F45910F05E;
	Wed,  1 Apr 2026 11:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsksDTPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767B410F00A
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775044057; x=1806580057;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eV6pe4fFSsHXa9okbUheJfAYVkL8LCzHJr6WvFDNC54=;
 b=VsksDTPwbCw4gjezwru2kKXFQVSAilZssDaUPdgO5rVrO8giUk7okRcn
 csqbXK18Juz0tKR2a6LaVTOcAXXMB4PapzYI05s7tEVC/qk/V7+RQQWMD
 JRNBXs7vHcOGY5B6tf3mroowVML9xYWzDATwz7ybXNaW6kb5DGgM1WvwT
 HTjuE2MruJouy/BOCcaZ/gvkPSb3YkmRs44wiyO5yTyIRPkkj5isGTRKj
 kYZTIJXMSyX5s5J34wjE9GwEtZgKgz72OnVSAdVC2C+d17LIe70w8SgyK
 4czvwPmHSibnWWCjFNm/Lx2dBAdUKsKfqmNYzp0qsoT34IoR/Oa3hSkkB g==;
X-CSE-ConnectionGUID: pIASpeN6RQOPC6xUhP3zfQ==
X-CSE-MsgGUID: Kq4DXHV9Rn2ufqXsnJO+gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78670458"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78670458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:47:36 -0700
X-CSE-ConnectionGUID: o/yXaq/hQxGp5RyN8nw6Dw==
X-CSE-MsgGUID: gqk6MnIURhKp765kjTPqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228265168"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:47:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t 4/6] lib/igt_kms: Export get_max_pipe_hdisplay as
 public helper
In-Reply-To: <20260401115542.1074290-5-kunal1.joshi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260401115542.1074290-1-kunal1.joshi@intel.com>
 <20260401115542.1074290-5-kunal1.joshi@intel.com>
Date: Wed, 01 Apr 2026 14:47:31 +0300
Message-ID: <ce85b64f62910b4c1d571eaf65ff4b9ab090bacd@intel.com>
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

On Wed, 01 Apr 2026, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> Rename the static get_max_pipe_hdisplay to igt_get_max_pipe_hdisplay
> and export it as a public API. This function returns the maximum
> hdisplay a single pipe can drive. Tests like basic-max-non-joiner
> need this value to distinguish outputs that can reach the single-pipe
> boundary from those that cannot
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 8 ++++----
>  lib/igt_kms.h | 1 +
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index dbd419a9b..961538932 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6907,12 +6907,12 @@ int igt_get_current_cdclk(int fd)
>  }
>  
>  /**
> - * get_max_hdisplay:
> + * igt_get_max_pipe_hdisplay:
>   * @drm_fd: drm file descriptor
>   *
>   * Returns: The maximum hdisplay supported per pipe.
>   */
> -static int get_max_pipe_hdisplay(int drm_fd)
> +int igt_get_max_pipe_hdisplay(int drm_fd)

This is purely about Intel limitations, isn't it? The name is misleading
for anything else.

BR,
Jani.

>  {
>  	int dev_id = intel_get_drm_devid(drm_fd);
>  
> @@ -6933,7 +6933,7 @@ static int get_max_pipe_hdisplay(int drm_fd)
>   */
>  bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
>  {
> -	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
> +	return (mode->hdisplay > igt_get_max_pipe_hdisplay(drm_fd) ||
>  		mode->clock > max_dotclock);
>  }
>  
> @@ -7047,7 +7047,7 @@ bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
>   */
>  bool igt_ultrajoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
>  {
> -	return (mode->hdisplay > 2 * get_max_pipe_hdisplay(drm_fd) ||
> +	return (mode->hdisplay > 2 * igt_get_max_pipe_hdisplay(drm_fd) ||
>  		mode->clock > 2 * max_dotclock);
>  }
>  
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index f994d91d3..2b5196c90 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1236,6 +1236,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>  bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
>  			    igt_output_t *output, int bpc);
>  int igt_get_max_dotclock(int fd);
> +int igt_get_max_pipe_hdisplay(int drm_fd);
>  int igt_get_max_cdclk(int fd);
>  int igt_get_current_cdclk(int fd);
>  bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);

-- 
Jani Nikula, Intel
