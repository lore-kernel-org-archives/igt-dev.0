Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75200C3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 09:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2362810E348;
	Mon, 12 May 2025 09:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWuhDFp6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5B710E348
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747042911; x=1778578911;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=p5MON91R90z6ZL30QYVFFFndN86WFtwMSz9BmY0l+0c=;
 b=nWuhDFp6Fg8hVFu0JjTDhJcKO8B4HqVZIHqss8gilIO6uQ9QcuFkX6mV
 gunOnlnJelQYGJQqwuXGQanBrCWm5UYOyXIsw2prHYBnfvRPPLWTcDsWV
 rrWb9JrE4yhcuYydp3vCQOJiiS4qNNoDGRESyjPmoNnjlfSiIJcxc9oMa
 Sun8WfpGq7gah1l+JpvpYqIcbBG3WJ9BNQdcy2xaQAUcDTSX15RBb++z3
 1Z6nimPwUBWyPFNPjplXUMg+2ZQNnG2MweFReMDpl4B70bki9Nlz2R62R
 Yv7IsYqnB9dbgbiPoywf5UPYdmKdi++WhVDbFCK10IFoA9o3GLd9UTbbO A==;
X-CSE-ConnectionGUID: OoLWu1whSDyvOjMR1pCXXg==
X-CSE-MsgGUID: +uyqd6XOScudn/3DGQ+wSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66237195"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="66237195"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 02:41:50 -0700
X-CSE-ConnectionGUID: 6SisOKx8SA+ajQcWNvwEcg==
X-CSE-MsgGUID: 56dXmeCvQLmFHU3O1r/IAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="174466542"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 02:41:49 -0700
Date: Mon, 12 May 2025 11:41:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_fo?=
 =?utf-8?Q?r?= intel-ci/xe.blocklist: remove device_reset@unbind-*-rebind
Message-ID: <20250512094133.evjgiqvhyfoj4fu6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250509132602.27205-1-kamil.konieczny@linux.intel.com>
 <174680741125.64857.15547852879389970193@c664b1dc75d1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174680741125.64857.15547852879389970193@c664b1dc75d1>
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

Hi igt-dev,
On 2025-05-09 at 16:16:51 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci/xe.blocklist: remove device_reset@unbind-*-rebind
> URL   : https://patchwork.freedesktop.org/series/148816/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16525_full -> IGTPW_13106_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13106_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13106_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13106/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13106_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_mmap_offset@clear:
>     - shard-mtlp:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16525/shard-mtlp-4/igt@gem_mmap_offset@clear.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13106/shard-mtlp-1/igt@gem_mmap_offset@clear.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
>     - shard-snb:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16525/shard-snb4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13106/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
> 

Unrelated to Xe blocklist change, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13106_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8411]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13106/shard-dg2-7/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#8411]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13106/shard-rkl-7/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#11078])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13106/shard-dg2-5/igt@device_reset@unbind-cold-reset-rebind.html
> 

Note that skip on DG2 here, this test requires special PCI card
for testing with success.

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8359 -> IGTPW_13106
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16525: b0db97d4270c697ade930cfefdb7aaef12cd80c9 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13106: 13106
>   IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13106/index.html
