Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE8B10ED655
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 10:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4CB10EC8D;
	Fri, 27 Mar 2026 10:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfefXutd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A2A10EC8D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 10:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774608061; x=1806144061;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=owpw7IQfjBogsvgrVGpLMFYwn93+y2PPVYs1vW2Dc30=;
 b=jfefXutdbE8S5sv1SYutqrZFSotsiYfrAsIosyoMVLbe4tjgT+u6a/JU
 xb6a08MbWlFIOIS5+Hr2cYyMPBhNIUIHMDXtx61N5wcknkfuGBgtd/eZG
 5cpNyHr4Ip2LDBhaL9X880WWo9pWVFLpeB+aV9Ly819KUfcyn9x00MF8q
 ASB8s7GMxPcEhOyHw6FcgxXkoPqQWuOLttUFTWwP80pwmurXBj920cPE6
 Jn2xQwPW0p8dgNtR73IyoTZTGLJKNCpJhHzwFchyQuutWEnE/mzA2TazU
 zRNMcBxCbEjVh2SvMhYqu+kxCY/P7kxg9jRAkK6aKHBMbMpOKjSeMiLG5 Q==;
X-CSE-ConnectionGUID: 4iQEtgy9RvqL2AmFiY/SIg==
X-CSE-MsgGUID: LqrQVZgyRimAawKFdgD1BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86755400"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="86755400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:41:00 -0700
X-CSE-ConnectionGUID: wLK7fowsQVyPSFUJmQ/CvA==
X-CSE-MsgGUID: CEIsAR9MTriUjpPweO08Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="225530558"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:40:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v4] tests/kms_content_protection: Optimize
 framebuffer management
In-Reply-To: <20260327035405.3151190-1-jason-jh.lin@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260327035405.3151190-1-jason-jh.lin@mediatek.com>
Date: Fri, 27 Mar 2026 12:40:51 +0200
Message-ID: <9500f111b76bdfd7dfe77dfb5d70b7d525cfa0f5@intel.com>
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

On Fri, 27 Mar 2026, Jason-JH Lin <jason-jh.lin@mediatek.com> wrote:
> Refactor framebuffer management to improve reusability:
> - Create framebuffers once per CRTC at test initialization via
>   create_fbs() and reuse them across all subtests
> - Centralize cleanup in remove_fbs() called at test fixture end
> - Use per-CRTC framebuffer array (data.fbs[IGT_MAX_PIPES]) indexed
>   by crtc->crtc_index instead of single global framebuffers
>
> Each framebuffer is created with the actual resolution of the first
> output that can connect to that CRTC, avoiding buffer size mismatch
> issues (e.g., 3504x2190 panel incorrectly using 3840x2160 buffer).
>
> For MST tests, multiple outputs share bandwidth and may require mode
> override to fit within bandwidth constraints. When mode override
> changes the resolution, properly detach planes before removing the
> existing framebuffers, then recreate them with the new dimensions.

Feels like there's a bunch of changes grouped together in one commit
that should probably be split up.

For example, passing the crtc around is a change. Adding the fb cleanup
is another. Adding multiple fbs is another.

The point is, if a bisected regression landed here, would you be able to
immediately tell what the problem is?

> Suggested-by: Karthik B.S <karthik.b.s@intel.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_content_protection.c | 190 ++++++++++++++++++++++++---------
>  1 file changed, 142 insertions(+), 48 deletions(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index caf3d7a56ae4..8b131277ffea 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c

> @@ -258,7 +263,15 @@ commit_display_and_wait_for_flip(enum igt_commit_style commit_style)
>  	}
>  }
>  
> -static void modeset_with_fb(igt_output_t *output,
> +static igt_crtc_t *output_get_driving_crtc_assert(igt_output_t *output)
> +{
> +	igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
> +
> +	igt_assert(crtc);
> +	return crtc;
> +}

I'm personally not fond of abstracting/hiding asserts like this. Do you
even need it really? It's a test logic issue if you hit this.

> +
> +static void modeset_with_fb(igt_output_t *output, igt_crtc_t *crtc,
>  			    enum igt_commit_style commit_style)
>  {
>  	igt_display_t *display = &data.display;
> @@ -268,18 +281,19 @@ static void modeset_with_fb(igt_output_t *output,


> @@ -1180,9 +1264,18 @@ static const struct {
>  int igt_main()
>  {
>  	igt_fixture() {
> +		igt_crtc_t *crtc;
> +
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_display_require_output(&data.display);
> +
> +		/* Ensure all CRTCs can be indexed within our framebuffer array */
> +		for_each_crtc(&data.display, crtc)
> +			igt_assert_f(crtc->crtc_index < IGT_MAX_PIPES,
> +				     "crtc_index %u exceeds IGT_MAX_PIPES %u\n",
> +				     crtc->crtc_index, IGT_MAX_PIPES);

This is handled by igt_display_require(), and is completely unnecessary
here.

BR,
Jani.


> +
>  		create_fbs();
>  	}
>  
> @@ -1241,6 +1334,7 @@ int igt_main()

-- 
Jani Nikula, Intel
