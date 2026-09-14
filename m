Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DF7C88E50
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 07:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F3310E539;
	Mon, 14 Sep 2026 07:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOnMeHFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C7A10E539
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 07:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789370336; x=1820906336;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bkTE5ygCOO0OIFxot1BDRLBRrN5oDO0t5P2eRWU6r8w=;
 b=WOnMeHFS9vNVNWmYb/7JBex4idOOwohW5BEWHNiPbdG5UOCDmEfUkc6h
 kDGgBSZHHXxwiDjRYSKITCBuKiON6WYo0oQNporH/TMH8hXCmGlKeo0xX
 Ksd0LVLrVHvwVxypGLrOE/ufV/69+o618g56bJbg7KqqlW09HanuzoLZu
 UHuFETfuEth5/LxWY3ZbLdrMhdjq6AKTYDqTsZ9506f32FQalxwBx1RTv
 r7kz7fczYyfVTgDr2dP8VqiYmvPw/s3RHFGvtFHPbFDrZijbkQ+Xs/u7H
 GZ5uhDjFkqcfzwA9vizIX988+A0QR4IVOTYAUCFUFXZ9IWAXcJxg15DYs g==;
X-CSE-ConnectionGUID: L0GLRBz4SHOKqbyP7Y0SNg==
X-CSE-MsgGUID: SwOEJEwNRYCkc0F2zq1ldg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="101238669"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="101238669"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 00:18:55 -0700
X-CSE-ConnectionGUID: FQMV+CLERgiTpwAAr65YFQ==
X-CSE-MsgGUID: 0/kbEuS/Q+WPkAktTeyrSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="269936010"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 00:18:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t,v3 3/9] lib/dsc: Add
 igt_get_dsc_sink_compressed_bpp()
In-Reply-To: <20260911210709.943683-4-swati2.sharma@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260911210709.943683-1-swati2.sharma@intel.com>
 <20260911210709.943683-4-swati2.sharma@intel.com>
Date: Mon, 14 Sep 2026 10:18:50 +0300
Message-ID: <951082a33bffb29ba662a47946d9da6f036530a2@intel.com>
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

On Sat, 12 Sep 2026, Swati Sharma <swati2.sharma@intel.com> wrote:
> Add a helper to read the active pipe's compressed BPP from
> `i915_display_info` debugfs.
>
> v2: Rebase
>
> Assisted-by: GitHub Copilot
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_dsc.c | 38 ++++++++++++++++++++++++++++++++++++++
>  lib/igt_dsc.h |  1 +

This is i915 specific, should it be somewhere else than
lib/igt_dsc.[ch]?

>  2 files changed, 39 insertions(+)
>
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
> index a1d98500a..0f938284e 100644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -378,3 +378,41 @@ int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name)
>  
>  	return max_slice_count;
>  }
> +
> +/**
> + * igt_get_dsc_sink_compressed_bpp:
> + * @drmfd: A drm file descriptor
> + * @pipe: display pipe
> + *
> + * Returns: The dsc sink compressed bpp.
> + */
> +float igt_get_dsc_sink_compressed_bpp(int drmfd, enum pipe pipe)

Please don't use pipe for this. Please base as much as possible on CRTC
and igt_crtc_t.

> +{
> +	char buf[8192];
> +	char dest[20];
> +	char *start_loc1, *start_loc2;
> +	int dir, res;
> +	float comp_bpp = 0;
> +
> +	snprintf(dest, sizeof(dest), ":pipe %s", kmstest_pipe_name(pipe));
> +
> +	igt_require_intel(drmfd);
> +
> +	dir = igt_debugfs_dir(drmfd);
> +	igt_assert_lte(0, dir);
> +
> +	res = igt_debugfs_simple_read(dir, "i915_display_info", buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	start_loc1 = strstr(buf, dest);
> +	igt_require_f(start_loc1, "Pipe %s not found in i915_display_info\n",
> +		      kmstest_pipe_name(pipe));
> +
> +	start_loc2 = strstr(start_loc1, "dsc-dss: compressed-bpp:");
> +	igt_assert(start_loc2);
> +	igt_assert_eq(sscanf(start_loc2, "dsc-dss: compressed-bpp:%f", &comp_bpp), 1);
> +	igt_assert(comp_bpp > 0);
> +
> +	return comp_bpp;
> +}
> diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
> index 0ba06d8c5..f895af7f3 100644
> --- a/lib/igt_dsc.h
> +++ b/lib/igt_dsc.h
> @@ -31,5 +31,6 @@ bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name);
>  int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name);
>  int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name);
>  int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name);
> +float igt_get_dsc_sink_compressed_bpp(int drmfd, enum pipe pipe);
>  
>  #endif

-- 
Jani Nikula, Intel
