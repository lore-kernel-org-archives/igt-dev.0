Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E56C5B549
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 08:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3F810E9AF;
	Fri,  6 Jun 2025 08:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fba7EJVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905D910E9AF;
 Fri,  6 Jun 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749199062; x=1780735062;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=adFVsRpLL9aHupUuEYIxfyjGUQ49asTrxwtzDbvvymQ=;
 b=fba7EJVafpghLYTRIukWePMNi5yaYleYFzpaGv8U6wk9Nv3awJoocTk5
 9FFT9aTc0GYgCzqBNfnTtxG1ru7dOOloZxZZU1SwxdBng4b8GDSeHTXgx
 AK1SQf5JyVkvNLkxTgo4lBJgzZkunV4bKJF6G+NHClZ7hC9bPMReX4Zf8
 Zt5Qzkv6RXDAMISlGsSo+xYsZCsrwfC5LTxIW7onRVJTKl2TfwYpZj7Pw
 CV5ukFVcqTmMwL0mGfiq9S0jDYNLCZYp/bVfsJJRtRNj3Fos9UNu23BUV
 zGOWfBQcM1664VBOL/g20MK7b1AWYeAe+/Opv4AKSmSNpAG0lJBpHIwK5 Q==;
X-CSE-ConnectionGUID: uogzTL43T+eg9kk77RY5Fw==
X-CSE-MsgGUID: Y6974BF8TwaBS3OETkpM0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51223133"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="51223133"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 01:37:41 -0700
X-CSE-ConnectionGUID: NQ0BkcjERe6TJK5AG/DtRA==
X-CSE-MsgGUID: aqEwzyUsQTqaK0oLSoi8KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="146281733"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 01:37:40 -0700
Date: Fri, 6 Jun 2025 10:37:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 tests/intel/gem_eio: Fix SIGABRT in kms subtest
Message-ID: <20250606083723.genubfr5ti4bp7hs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250605184801.118619-1-kamil.konieczny@linux.intel.com>
 <174916199613.53927.12501505984605605673@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174916199613.53927.12501505984605605673@1538d3639d33>
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
On 2025-06-05 at 22:19:56 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_eio: Fix SIGABRT in kms subtest
> URL   : https://patchwork.freedesktop.org/series/149898/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16653_full -> IGTPW_13248_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13248_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13248_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13248/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13248_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_persistence@smoketest:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13248/shard-dg2-10/igt@gem_ctx_persistence@smoketest.html
>     - shard-dg1:          [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16653/shard-dg1-18/igt@gem_ctx_persistence@smoketest.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13248/shard-dg1-14/igt@gem_ctx_persistence@smoketest.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-glk:          [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16653/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13248/shard-glk1/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-rkl:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16653/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13248/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane@plane-panning-top-left@pipe-b:
>     - shard-mtlp:         [PASS][8] -> [FAIL][9] +2 other tests fail
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16653/shard-mtlp-1/igt@kms_plane@plane-panning-top-left@pipe-b.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13248/shard-mtlp-2/igt@kms_plane@plane-panning-top-left@pipe-b.html
> 

These are unrelated to change in gem_eio@kms

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_16653_full and IGTPW_13248_full:
> 
> ### New IGT tests (13) ###
> 
>   * igt@kms_big_fb@64x64-right-edge:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@basic-normal:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@busy:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@cursor-rapid-movement-128x42:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@cursor-vs-flip-legacy:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@dsc-fractional-bpp:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@plane-invalid-params-fence:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@psr2-cursor-plane-move-continuous-sf:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@reset-flags:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@reset-stress:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@unaligned-read:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_big_fb@wait-forked-hang:
>     - Statuses :
>     - Exec time: [None] s
> 

Also unrelated, not introduced with this patch.

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13248_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#6230])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13248/shard-tglu-4/igt@api_intel_bb@crc32.html

All these are unrelated. See below a comment for gem_eio.

...cut...

> 
>   * igt@gem_eio@kms:
>     - shard-tglu:         NOTRUN -> [DMESG-WARN][24] ([i915#13363])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13248/shard-tglu-9/igt@gem_eio@kms.html

This should be:
<3> [205.906890] i915 0000:00:02.0: [drm] *ERROR* Session state did not clear

Unrelated as in patch was changed only order of skips.

>     - shard-dg1:          NOTRUN -> [FAIL][25] ([i915#5784])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13248/shard-dg1-16/igt@gem_eio@kms.html

This one is:
(gem_eio:2257) CRITICAL: Failed assertion: med < limit && max < 5 * limit

Same here, not introduced with a patch.

Regards,
Kamil

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8397 -> IGTPW_13248
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16653: 832a676ed68901ea8c404d8602381cd8ca413e88 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13248: 5c317470d8e30d7088e7396f166984858100cece @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8397: 181d409e619a5eff49ede13f058343dbe8acb417 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13248/index.html
