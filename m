Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51097CA1013
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 10:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E0810E205;
	Mon,  8 Sep 2025 10:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJ5yir2f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DBB10E0D7;
 Mon,  8 Sep 2025 10:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757327390; x=1788863390;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QgKxobiaymWU1+/cLJZozQXKIf5SQnM8kemmFWvA+JQ=;
 b=IJ5yir2f6rJ0PC95CzcbxuNBnmO0ZSJnJnTMrBC+gNifnnKEnlBKOn32
 y8+C4iSBm0/AnEca1SJ1sCkoxZjRolKANXwxnPfK77TpGMHVQPanPE8jY
 GUywl+84+vJGqF56DaxMGWdCAlU3Ij88layLhwz7W0FpD4x+nPNLjmvxL
 wQusiaHiI6T6B+3dGo7d9VJ6B68f/7ULb4DAxZshcd/DBQtsXNATalOJJ
 xl3yTj4Kg0a+ZDtfZ9HqClcBk1QuyaTqJpzONl/0Ncp0sbMgzno5C+aOy
 1kT8saNVBE6Ri8/+bKi5b8YHaBpYkvKoWurEfTQmULSX5t9mHkAgOa+DU w==;
X-CSE-ConnectionGUID: fAgs5rIVR8K2rRa2vx7g7Q==
X-CSE-MsgGUID: TXVje2dETYqRQ/faX+jiDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="63406750"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="63406750"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:29:49 -0700
X-CSE-ConnectionGUID: oKkdgj85QLOxyCLwkl139Q==
X-CSE-MsgGUID: lU21VOY/QmKp0PZMPjXZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="173547941"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:29:48 -0700
Date: Mon, 8 Sep 2025 12:29:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 lib/drmtest: Refactor chipset to string
Message-ID: <20250908102932.f7zvnwcowxhu5bak@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250829153454.129913-1-kamil.konieczny@linux.intel.com>
 <175700703169.304667.2061728319029556449@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175700703169.304667.2061728319029556449@1538d3639d33>
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
On 2025-09-04 at 17:30:31 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/drmtest: Refactor chipset to string
> URL   : https://patchwork.freedesktop.org/series/153720/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17093_full -> IGTPW_13662_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13662_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13662_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/index.html
> 
> Participating hosts (11 -> 12)
> ------------------------------
> 
>   Additional (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13662_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-1-y:
>     - shard-rkl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17093/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-1-y.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13662/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-1-y.html
> 

Unrelated.

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17093_full and IGTPW_13662_full:
> 
> ### New IGT tests (18) ###
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.53] s
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-a-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.72] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.55] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.40] s
> 
>   * igt@kms_cursor_crc@cursor-random-256x256@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.85] s
> 
>   * igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.20] s
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x21@pipe-a-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.42] s
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x64@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.62] s
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.70] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.56] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.56] s
> 
>   * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.63] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.79] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.73] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.77] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-2-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.73] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-2-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.73] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-2-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.78] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13662_full that come from known issues:
> 
> ### IGT changes ###

...cut...

