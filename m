Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957CBCD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 07:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CCD10E03B;
	Fri, 15 May 2026 07:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgN4qvRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F8010F44C
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778831593; x=1810367593;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZLUck2VLUyeJGKfxnDP6Kdf3s4x2K8WFsNP2TO0OHSM=;
 b=OgN4qvRl8L3kIqrR+D5UscTHvjnoKZ738GbhWcLCxWPLiZKpqkYvWTvm
 pPQttcV2w6pArsnGQy2KXizbheXiK9iIq33aC+Z4INllt1u45NE1fy7IK
 5S6sK0Vic9XpVhwWMP6Utl1nM3MXENkZpjv+ysJ9uWbUCRvyW5ZIZejIh
 bhBuWLgRJAZpNmCxS3BkOAeHop2a7sBk5gxzq9E0auvigxje+5chiAqUw
 a3E50dSJG+Df5xpJvguOdGkXL96DfH6qc217H5PL1DJ6ugBaOySrHTbJJ
 Qqg49DhCa93GzbCFJstFb6GH8YrZqQUFbCT2D6Xpi87QLJM7IyXLBc67Y g==;
X-CSE-ConnectionGUID: bD19fYv7QFyXdAN+LJ4XZg==
X-CSE-MsgGUID: zIcCbqe3S2uWfC2JIkeAIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97213631"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="97213631"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:53:13 -0700
X-CSE-ConnectionGUID: Vk8yPVhHQpyElDam2w+rqA==
X-CSE-MsgGUID: eiPnA4MDRqCKme9AK0d/kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="268968461"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:53:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jason-jh.lin@mediatek.com,
 karthik.b.s@intel.com, fshao@chromium.org, navaremanasi@google.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
In-Reply-To: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
Date: Fri, 15 May 2026 10:53:06 +0300
Message-ID: <f8de8e9810d620359f2d5375d83f2a6d1a30ce97@intel.com>
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

On Thu, 14 May 2026, Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com> wrote:
> Reverts below commits
>
> b4036b1a0 tests/kms_content_protection: Add FB cleanup for MST tests
> 8d7c2453d tests/kms_content_protection: Pass crtc parameter and use per-CRTC FBs
> 925b14d43 tests/kms_content_protection: Add per-CRTC framebuffer infrastructure
>
> The per-CRTC fb introduced in the commits caused regression especially
> when the eDP panel is connected with 2 4k Panels connected through a
> DP-MST hub with "-ENOSPC" and all the content protection tests are
> failing.
>
> The MST subtests are skipping when subtests are executed with "--r
> dp-mst*" , as the MST changes introduced did not clean up properly
> across subtests.
>
> The create_fbs() now iterated through all crtcs and eDP (2k) claims the first
> crtc before the larger output and fb is created with smaller size. Later when DP-4 maps to
> the smae CRTC (it has differnt fb dimensions now 2k fb than the mode
> required) , the kernel rejects the commits  with ENOSPC because of
> invalid coordinates.

The cover letter won't be committed to git.

The commit messages for the reverts themselves need the explanation for
posterity.

You can't have empty commit messages that just have the "This reverts
commit ..."

BR,
Jani.

>
> Santhosh Reddy Guddati (3):
>   Revert "tests/kms_content_protection: Add per-CRTC framebuffer
>     infrastructure"
>   Revert "tests/kms_content_protection: Pass crtc parameter and use
>     per-CRTC FBs"
>   Revert "tests/kms_content_protection: Add FB cleanup for MST tests"
>
>  tests/kms_content_protection.c | 168 +++++++++------------------------
>  1 file changed, 47 insertions(+), 121 deletions(-)

-- 
Jani Nikula, Intel
