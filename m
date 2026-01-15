Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D377D4660D
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 18:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C0B10E04E;
	Thu, 15 Jan 2026 18:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tgxk7Rss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F59810E04E
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 18:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768502135; x=1800038135;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=KLm4DsNHcPS2k5gfHYcX1OP67/CLBOYGHk0asUlk5PY=;
 b=Tgxk7RssULJ39UzE6yP/0USOHAeNV0JTfTG+duuXkNw6/ocqPk0R9GEt
 beHIpmmphecSKsobL1MO7KGHMCHTJq6LPPhEkQIebNlS96tCHiC/ASAwi
 qoD1DqODzmunr2b1xwo79zQ97naBpzsGyvNTRNDMF9XEl3HFcXqVkQdNO
 GZPoUFxtFKfjUFzr+TlnIZ4taCNNE33lKTPZt7tkV7ugJbtfiv2nK5OD8
 qwX5LJeFD67TYZ5PKCtaKIm62JyCeSWigQZXKjVsxEVDTQd3jSf5pCArK
 /Pp7CTYr/zTJPVk6cvWBpAvXOfsDaq3snAdrGTRox4tOkSsbs8fVaV9dv g==;
X-CSE-ConnectionGUID: 3lkSyG3sQT6WYa3J6Q1W1Q==
X-CSE-MsgGUID: R+FVofdhSYa0/mZd5yUkgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73658570"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="73658570"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 10:35:34 -0800
X-CSE-ConnectionGUID: XtiMjqW8S9qH629zifqd9Q==
X-CSE-MsgGUID: Bkklp3HlQI+ZJIBOnqKn3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="209165793"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 10:35:33 -0800
Date: Thu, 15 Jan 2026 19:35:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 RFC: cut successful dmesg logs (rev2)
Message-ID: <20260115183519.2hanx6246coqkg4o@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
 <176848477253.156800.6797212834779864888@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176848477253.156800.6797212834779864888@a3b018990fe9>
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
On 2026-01-15 at 13:46:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: RFC: cut successful dmesg logs (rev2)
> URL   : https://patchwork.freedesktop.org/series/159973/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8701 -> IGTPW_14348
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14348 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14348, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14348/index.html
> 
> Participating hosts (42 -> 40)
> ------------------------------
> 
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14348:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-atsm-1:         [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8701/bat-atsm-1/igt@gem_lmem_swapping@parallel-random-engines.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14348/bat-atsm-1/igt@gem_lmem_swapping@parallel-random-engines.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14348 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-rpls-4:         [PASS][3] -> [DMESG-WARN][4] ([i915#13400])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8701/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14348/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg2-9:          [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8701/bat-dg2-9/igt@i915_selftest@live@workarounds.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14348/bat-dg2-9/igt@i915_selftest@live@workarounds.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [DMESG-FAIL][7] ([i915#12061]) -> [PASS][8] +1 other test pass
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8701/bat-mtlp-8/igt@i915_selftest@live.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14348/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-mtlp-9:         [DMESG-FAIL][9] ([i915#12061]) -> [PASS][10] +1 other test pass
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8701/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14348/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8701 -> IGTPW_14348
>   * Linux: CI_DRM_17819 -> CI_DRM_17821
> 
>   CI-20190529: 20190529
>   CI_DRM_17819: d5b0278e4bea2fb27de6d12b7f865a74072af677 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_17821: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14348: 14348
>   IGT_8701: 8701
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14348/index.html
