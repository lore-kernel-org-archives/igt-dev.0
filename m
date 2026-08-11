Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103D0C5CFEB
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 16:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB4410E33D;
	Tue, 11 Aug 2026 16:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgAmfbAP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03E510E33D
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786466285; x=1818002285;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=T43tjJMPEP87ICH9wq17FoOUN2s8W8crGgzzXbBrANM=;
 b=cgAmfbAPmtze5b9BdgLPlN6wI+UILBI5wnOAE3urmE0Ww+PycEjteaeE
 cTFeK9EOshkPhjvo3LuihOChPOqdcn4nV++bICejkfK7Pr218y368ZHId
 bMwTwVsuuiJu1RnXW44sf0OySeF36TXTSq4eZIjkveVo8oDsFEp3oLjAk
 KEqF1riPyHIQF5Dk6sth/BgJVBPa9/DAFPIqfy9krIGA/Kpmx85/KAlZG
 0SZfVVcFOmwbExS48TWeloXSebWyVVMuWGcdgA+3FfRd6jSptKHNqcBSA
 giwh/1fSstW2n5GR1JMkbfePdC4fWPF5Jh5fJ61chR+sHEnEqXkb3pxbS Q==;
X-CSE-ConnectionGUID: J3dP1kC+QMWmrhfXjrCpbA==
X-CSE-MsgGUID: /imFuZqzTlec2w6WqEIdhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97662630"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="97662630"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 09:38:04 -0700
X-CSE-ConnectionGUID: Zq4C+m43T7GJgwBhKFNvbA==
X-CSE-MsgGUID: eSgSu+6cT76tZRJk4/Htlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="268541240"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.254])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 09:38:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon
 Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH i-g-t v3 1/6] lib/igt_kms: clear colorop-changed flag
 after commit
In-Reply-To: <20260811143558.141813-2-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-2-mwen@igalia.com>
Date: Tue, 11 Aug 2026 19:37:57 +0300
Message-ID: <ba7f8fba1de393dd4ec165804d9a01694ac3f156@intel.com>
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

On Tue, 11 Aug 2026, Melissa Wen <mwen@igalia.com> wrote:
> Don't request colorop updates if there is no change in the atomic
> commit. It fixes atomic rejection after test skips that was caused by
> incorrect attempts of changing inactive colorop properties, since
> userspace can update only current active colorops or colorops that will
> be activated or deactivated in the same commit. Active colorop means a
> colorop that is in the chain of an active color pipeline, i.e.  the
> pipeline in plane COLOR_PIPELINE property.
>
> Assisted-by: Claude:claude-opus-4-7
> Tested-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  lib/igt_kms.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 42cc7c3bd..1e3cea781 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4862,6 +4862,7 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
>  {
>  	int i;
>  	igt_crtc_t *crtc;
> +	igt_colorop_t *colorop;
>  
>  	for_each_crtc(display, crtc) {
>  		igt_plane_t *plane;
> @@ -4891,6 +4892,20 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
>  				int fd;
>  				plane->changed = 0;
>  
> +				/* clear changed flags on every colorop in the assigned chain
> +				 * so already-committed property values aren't re-emitted on
> +				 * the next commit.
> +				 */
> +				colorop = plane->assigned_color_pipeline;
> +				while (colorop) {
> +					int next_val;
> +
> +					colorop->changed = 0;
> +					next_val = igt_colorop_get_prop(display, colorop,
> +									IGT_COLOROP_NEXT);
> +					colorop = igt_find_colorop(display, next_val);
> +				}

Seems like it would be useful to have iterator macros for going through
pipelines/colorops.

BR,
Jani.

> +
>  				fd = plane->values[IGT_PLANE_IN_FENCE_FD];
>  				if (fd != -1)
>  					close(fd);

-- 
Jani Nikula, Intel
