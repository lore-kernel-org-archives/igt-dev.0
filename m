Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55607C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 10:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C2E1120F0;
	Fri, 26 Apr 2024 10:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6sEfDOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23CD10FD6D;
 Fri, 26 Apr 2024 10:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714127684; x=1745663684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vI1JSuYdshvES2Yav/U7coaE6MGKL1Z4ihAdfW9DuWQ=;
 b=D6sEfDOQeFFNKxOPP+tbNORgWxArtQ5H54OIyaRX45pRcIhZE6GM7juy
 6Hq62D0DHKWayRqAXDyChP1OboEU2lmXb3bn5ft+JOhcUS5qttdEueLYs
 4mpte6XcSNmkbsJnF0RcaulILg0xMpLHXwxfKlvnn9DgoaEJPBlDNsmxE
 Cmcxgrl3iizREU+qxiyBzYreAiUblAoVGVCtvJ1PLOJaqxIqkVlEOo5LP
 ctnvrcIkMU3cNtOr4VxHdTfYPCI4NXoaTFwhjttXIUqysCLIohmGISnvZ
 O41W3N58HnilKjclIDJgHKWqsUI9gdrA6omx6PZzvUttIqFiyv/BkoGRA A==;
X-CSE-ConnectionGUID: +oTKdhoJSQemUK3KgAKIiw==
X-CSE-MsgGUID: 7n5B69i6Q8KbbL0uIaUdPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="21263402"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="21263402"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 03:34:43 -0700
X-CSE-ConnectionGUID: l35HA5GRT9GAQFZFPACxrA==
X-CSE-MsgGUID: sNVXlaEaRWq0p7rr9n0UTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25466708"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 03:34:42 -0700
Date: Fri, 26 Apr 2024 12:34:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/device_reset: move later skips into subtests (rev3)
Message-ID: <20240426103439.jjlh6txztzcp6cwr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240425140544.41750-1-kamil.konieczny@linux.intel.com>
 <171412173966.1685485.14894033365265276022@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171412173966.1685485.14894033365265276022@8e613ede5ea5>
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
On 2024-04-26 at 08:55:39 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/device_reset: move later skips into subtests (rev3)
> URL   : https://patchwork.freedesktop.org/series/132040/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14654_full -> IGTPW_11071_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11071_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11071_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11071_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@fbdev@read:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/shard-dg2-6/igt@fbdev@read.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-dg2-5/igt@fbdev@read.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-dg1:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/shard-dg1-13/igt@gem_eio@in-flight-suspend.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-dg1-16/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_gttfill@all-engines:
>     - shard-dg2:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/shard-dg2-10/igt@gem_exec_gttfill@all-engines.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-dg2-1/igt@gem_exec_gttfill@all-engines.html
> 
>   * igt@i915_selftest@live@migrate:
>     - shard-dg1:          [PASS][7] -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/shard-dg1-15/igt@i915_selftest@live@migrate.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-dg1-13/igt@i915_selftest@live@migrate.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-vga1:
>     - shard-snb:          [PASS][9] -> [DMESG-WARN][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/shard-snb5/igt@kms_flip@flip-vs-suspend@b-vga1.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-snb5/igt@kms_flip@flip-vs-suspend@b-vga1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][11] +2 other tests fail
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-dg1-16/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-4.html
> 

Above are unrelated to change in device_reset test.

>   
> #### Warnings ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-tglu:         [SKIP][12] ([i915#7701]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/shard-tglu-5/igt@device_reset@cold-reset-bound.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-tglu-2/igt@device_reset@cold-reset-bound.html
>     - shard-mtlp:         [SKIP][14] ([i915#7701]) -> [SKIP][15] +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/shard-mtlp-5/igt@device_reset@cold-reset-bound.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-mtlp-3/igt@device_reset@cold-reset-bound.html
>     - shard-dg2:          [SKIP][16] ([i915#7701]) -> [SKIP][17] +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/shard-dg2-8/igt@device_reset@cold-reset-bound.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-dg2-5/igt@device_reset@cold-reset-bound.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-rkl:          [SKIP][18] ([i915#7701]) -> [SKIP][19] +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/shard-rkl-3/igt@device_reset@unbind-cold-reset-rebind.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html
>     - shard-dg1:          [SKIP][20] ([i915#7701]) -> [SKIP][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14654/shard-dg1-16/igt@device_reset@unbind-cold-reset-rebind.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-dg1-16/igt@device_reset@unbind-cold-reset-rebind.html
> 

And these seems also unrelated as there are more skips on similar machines.

Btw I send this again as I forgot to trim message to reasonable size.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11071_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@drm_fdinfo@busy-idle@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8414]) +7 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/shard-dg2-6/igt@drm_fdinfo@busy-idle@bcs0.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7824 -> IGTPW_11071
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14654: afe74c645ec61ebe1c406646725e8d869b0b3e9c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11071: 8b945b7442d79b8ef0234661d279be7197717fe5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7824: 7824
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11071/index.html
