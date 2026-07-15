Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FF3C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 07:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39F910EF21;
	Wed, 15 Jul 2026 07:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7Xe0SKX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6A210E0AD
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784101907; x=1815637907;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GO89ooHZIlvhKOhrNKnA4OHE0bVVr4gdQ6RXqsTXPtk=;
 b=f7Xe0SKX9BbmpVFD8Pb+j1HRP3YZ3xn41t3kyovcAM8x9QCltMiGKNiw
 rmy110p9vCBCCUkRBdwU5jWiuuCiAo5F0X+HVeqX7UuE2Tvm7x075SqGN
 WoPWhTRvoRRE0rU+llVpLZIriTDPoElg35ys7OLlXZg9fKUJJXyK0ILeT
 +BJJLIRgNOb4cmT39ohbJMycSULmjqwNmPSsOQAxe2Y+LvKH05CPjmm8w
 OBN2UPhbSSCVG4wk/eZSXXcEbWQL4RCfNnHFhSRwLQGkXjD3m9b7KIsOw
 Uiskn25Kp0QhfYfrkKj8GjcqXWvN7/mH6RhMPBzr3W9Qc1S73JRngPwh0 g==;
X-CSE-ConnectionGUID: jEM73KQ2Q4qUB0iBCiUQoQ==
X-CSE-MsgGUID: /WRuvRxuR1+xYxjv8OhU9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95332280"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95332280"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 00:51:46 -0700
X-CSE-ConnectionGUID: ZO2QjfZMQraJcQZO7Ar42w==
X-CSE-MsgGUID: 8j5baJq7RYOx0aT9WGMleQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="254355200"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 00:51:45 -0700
Date: Wed, 15 Jul 2026 09:51:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] CI: Update NVL, LNL and BMG Core Blocklist
Message-ID: <20260715075125.qvpyfntl66dghwbw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org
References: <20260715060724.2336612-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715060724.2336612-2-priyanka.dandamudi@intel.com>
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

Hi Priyanka,
On 2026-07-15 at 11:37:25 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Subject should have intel-ci: prefix but this could be fixed at merge,
no need for resend.

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Add xe_cw_post_sync@walker-post-sync as it is applicable from CRI and
> above.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel-ci/xe.bmg.core.blocklist.txt | 4 ++++
>  tests/intel-ci/xe.lnl.core.blocklist.txt | 4 ++++
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 4 ++++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
> index 628bc3d3b0..cd38d16f8b 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -7,6 +7,10 @@ igt@testdisplay
>  igt@xe_pat@display-vs-wb-transient
>  igt@fbdev@.*
>  ##################################################################
> +# Valid skip as test is applicable for Xe3p xpc and later platforms
> +##################################################################
> +igt@xe_cw_post_sync@walker-post-sync
> +##################################################################
>  # Expected Skip for xe2+ platforms
>  ##################################################################
>  igt@xe_pat@pat-index-xehpc
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> index 60bcefa562..f921ca3a4d 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -11,6 +11,10 @@ igt@testdisplay
>  igt@xe_pat@display-vs-wb-transient
>  igt@fbdev@.*
>  ##################################################################
> +# Valid skip as test is applicable for Xe3p xpc and later platforms
> +##################################################################
> +igt@xe_cw_post_sync@walker-post-sync
> +##################################################################
>  # Expected skip as platform has no vram support
>  ##################################################################
>  igt@xe_create@create-big-vram
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index ea47d3b857..ca1b9f9dff 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -40,6 +40,10 @@ igt@xe_pat@pat-index-xelpg
>  igt@xe_media_fill@media-fill
>  igt@xe_pat@pat-index-xe2
>  ##################################################################
> +# Valid skip as test is applicable for Xe3p xpc and later platforms
> +##################################################################
> +igt@xe_cw_post_sync@walker-post-sync
> +##################################################################
>  # Valid Skip: Tests requiring multiple CCS (Compute Command
>  # Streamers) engines — NVL exposes only a single CCS engine.
>  ##################################################################
> -- 
> 2.43.0
> 
