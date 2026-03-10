Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E2FEB1041
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C2410E28E;
	Tue, 10 Mar 2026 10:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEBibbz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C40510E28E
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773138022; x=1804674022;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IL1hP/G4/AOfUc/DvrsRLBa0a7FsBQlDgXJBP0VoDA4=;
 b=cEBibbz8t7gy9unM8UBaY5RsSYgAmlnL5gopnqMianKkIW3Zk6BmdObJ
 WE9u3JoVhP+2soxfX8Ph3WxeLlsO6udcbWRYexo1LtHBR5G0b4mZ95Te1
 xNlh7BNFmEQ7Dna+C6Hz1ozPH75+iENInSK6MjluA83Ms2uzFF/dRFeEw
 qIpZUgPUQm5TuySLX0mha9z7Au5zgVGSrFuuOZKET9yEPOtQ374xb6GaA
 Q0wqGlf5chWoAItANeBr0DCqEOUxNpHIWZgKGJP0je4UeyuEnlJjbUTy6
 T1V5uyA/QZY8MsuXnoYeFEInmEE+2fiEO3XN/rtAAKuiBeFMQr0Xl3zVm A==;
X-CSE-ConnectionGUID: 0MjvQ8pgSAeHDmayn6dVIg==
X-CSE-MsgGUID: k0J2DvQrRMGKLjFPB+kRXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85267773"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85267773"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:20:22 -0700
X-CSE-ConnectionGUID: KZaj0wXaS3aCuBmeC/43bQ==
X-CSE-MsgGUID: umNFZAw2QQOK+C4Y7ieC8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224525952"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.33])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:20:22 -0700
Date: Tue, 10 Mar 2026 12:20:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/10] tests: avoid using crtc->pipe where possible
Message-ID: <aa_wYugxXowLvlTI@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1773066012.git.jani.nikula@intel.com>
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

On Mon, Mar 09, 2026 at 04:21:34PM +0200, Jani Nikula wrote:
> Tests should generally avoid using crtc->pipe if possible. It's an Intel
> implementation detail, and crtc->crtc_index is the generic thing to
> use. Do some conversions to crtc_index use.
> 
> 
> Jani Nikula (10):
>   tests/kms_writeback: use igt_crtc_name()
>   tests/kms_colorop: use igt_crtc_name()
>   tests/kms_color_pipeline: use igt_crtc_name()
>   tests/kms_cursor_crc: use CRTC indexes instead of pipes for CRTC
>     tracking
>   tests/kms_cursor_edge_walk: use CRTC indexes instead of pipes for CRTC
>     tracking
>   tests/kms_pipe_crc_basic: use CRTC indexes instead of pipes for CRTC
>     tracking
>   tests/kms_plane_alpha_blend: use CRTC indexes instead of pipes for
>     CRTC tracking
>   tests/kms_vblank: use CRTC indexes instead of pipes for CRTC tracking
>   tests/kms_cursor_legacy: use CRTC indexes instead of pipes for CRTC
>     tracking
>   tests/kms_debugfs: use CRTC indexes instead of pipes for fb tracking

I'd just nuke the array from kms_debugfs.

But no big deal either way. Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  tests/kms_color_pipeline.c    |  2 +-
>  tests/kms_colorop.c           |  4 ++--
>  tests/kms_cursor_crc.c        | 16 ++++++++--------
>  tests/kms_cursor_edge_walk.c  | 14 +++++++-------
>  tests/kms_cursor_legacy.c     |  2 +-
>  tests/kms_debugfs.c           |  4 ++--
>  tests/kms_pipe_crc_basic.c    | 14 +++++++-------
>  tests/kms_plane_alpha_blend.c | 14 +++++++-------
>  tests/kms_vblank.c            | 20 ++++++++++----------
>  tests/kms_writeback.c         |  4 ++--
>  10 files changed, 47 insertions(+), 47 deletions(-)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
