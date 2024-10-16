Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4645D1AD30
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 09:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B32A10E6C0;
	Wed, 16 Oct 2024 09:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvYi+NEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0271F10E0C9;
 Wed, 16 Oct 2024 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729070107; x=1760606107;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kXOgRw73sBb7tVy7Qx/aDKZsTt49GJp0eXVX+76aeBI=;
 b=XvYi+NEvC/BpzxV9/ZpkYHn+wRL6/Ki+7nNydq2x+ENgDMgHGbFomneO
 xbdtC9tN5UuXhN0/BtXqf++PCsvNU0n07K1bzOOFxHgIpeqkhErRUXSIV
 UQdNol+JKHwiaGUerzfBG+sGk/A/WVi4dfCJmbpGn9Gq4xZo0D3hU+32O
 qko6ownGHVZr9bjxrP8Tjok9VuNyr+S4FqmAoEDOa6Q4pJ6MJse6s034x
 91M0/2fUtAEIYL8h7yfqg8mNuE5JO6N42FVEA8ANjtDOJR9lYMDX/WaQd
 +UbhSKEY/yETCjzk6v4uBPDy68TjhCFEaetgYEMZbS/ZxmrzV3KiJNdbM Q==;
X-CSE-ConnectionGUID: h7ImDL3mRh6tsEpO0gh7Hw==
X-CSE-MsgGUID: VJ9u6x+ATOOdZYI6JtRANA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27979999"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27979999"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:15:02 -0700
X-CSE-ConnectionGUID: vjk6aTdGT5+nOzLVptFkOQ==
X-CSE-MsgGUID: L8B7BVQNQvGC3xhm6Lp6mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="108950995"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 02:15:00 -0700
Date: Wed, 16 Oct 2024 11:14:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_exec_reset: Explicitly declare exec (rev3)
Message-ID: <20241016091440.f3s5l4gblmd3a2rn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241014220011.264642-1-jonathan.cavitt@intel.com>
 <172895064918.1267465.17192258119847254637@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172895064918.1267465.17192258119847254637@2413ebb6fbb6>
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
On 2024-10-15 at 00:04:09 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_reset: Explicitly declare exec (rev3)
> URL   : https://patchwork.freedesktop.org/series/139968/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15536_full -> IGTPW_11907_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11907_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11907_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11907/index.html
> 
> Participating hosts (10 -> 8)
> ------------------------------
> 
>   Missing    (2): shard-snb-0 shard-glk 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11907_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_softpin@noreloc:
>     - shard-mtlp:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15536/shard-mtlp-6/igt@gem_softpin@noreloc.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11907/shard-mtlp-7/igt@gem_softpin@noreloc.html
> 
>   * igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-1:
>     - shard-dg2:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15536/shard-dg2-4/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11907/shard-dg2-8/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>     - shard-snb:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15536/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11907/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-mtlp:         [PASS][7] -> [FAIL][8] +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15536/shard-mtlp-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11907/shard-mtlp-4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - {shard-tglu-1}:     NOTRUN -> [ABORT][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11907/shard-tglu-1/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_15536_full and IGTPW_11907_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@kms_atomic@plane-invalid-params@pipe-a-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.19] s
> 
>   * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.42] s
> 
>   

Above are unrelated to change in xe_exec_reset test.

Regards,
Kamil

> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11907_full that come from known issues:
> 
> 
...cut...
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11907/index.html
