Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C63BC61CE7
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 15:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA5510EAF0;
	Fri,  6 Jun 2025 15:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAqbUa1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC46010EAF0;
 Fri,  6 Jun 2025 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749225203; x=1780761203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hIb0PX1pPV0dilirt07KbnVHGdlEAtlQBC2SBlzwJ3Q=;
 b=IAqbUa1wj3OKEiCBq9pJ6SUyJqoFtGfoUaPvjfFBSWm3ChIi0mvqKXJ9
 8LiL/QbKHVfqNBFzUzsd67EcOffTjAAHcVVukiZSYmpUwbItEz66VsZIC
 B415J/g0SqJ/MKnS0LZASFD1EbtYKGhU8bRKTPLu0GK7ph3XEmFB9EbIw
 idn12VYviqj7Oeo3mnD2dH99o/f3ZDl6ZgKONZDpFpsPaSqk3ObQ0Oh5R
 Hy1MiqLXb4kFCyc8Y7BrtPvcVCGQtXOQmcgGfgk1N08CzjSKZvdqtfQEw
 czPwoR7jQy7rfq76vV3rHjISet1vdP7N4Nh/jxZoDSMYF2vfCYR+QuEwZ g==;
X-CSE-ConnectionGUID: W8KmFO5kSd2Y171wN//bDQ==
X-CSE-MsgGUID: lZvhPdWbRDiiIOW2yNrc4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51083341"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51083341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:53:23 -0700
X-CSE-ConnectionGUID: x3erLqTfQxezJQ34rr83LA==
X-CSE-MsgGUID: axbqsKfWSPe5/wT+h7OTPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="176735802"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:44:55 -0700
Date: Fri, 6 Jun 2025 17:44:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Extend IGT to support Android (rev15)
Message-ID: <20250606154439.fngee47su6vscbp6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
 <174907585498.49780.17416480448021363440@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174907585498.49780.17416480448021363440@1538d3639d33>
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
On 2025-06-04 at 22:24:14 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Extend IGT to support Android (rev15)
> URL   : https://patchwork.freedesktop.org/series/148432/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8396_full -> IGTPW_13244_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13244_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13244_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13244_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-dg2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/shard-dg2-11/igt@gem_exec_suspend@basic-s0@smem.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/shard-dg2-11/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
>     - shard-rkl:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/shard-rkl-8/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/shard-rkl-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html
> 
>   * igt@kms_plane_lowres@tiling-none:
>     - shard-dg2:          [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/shard-dg2-2/igt@kms_plane_lowres@tiling-none.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/shard-dg2-10/igt@kms_plane_lowres@tiling-none.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-d-dp-3:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/shard-dg2-10/igt@kms_plane_lowres@tiling-none@pipe-d-dp-3.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:
>     - shard-rkl:          [PASS][8] -> [SKIP][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8396/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html
> 

Unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13244_full that come from known issues:
> 
> 
...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8396 -> IGTPW_13244
> 
>   CI-20190529: 20190529
>   CI_DRM_16645: 573b98ac3ff9ff95c3316789e97980277e4ffe2b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13244: 522d6bb8e1da9cc508103a5930e22949921ece2d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8396: 8396
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13244/index.html
