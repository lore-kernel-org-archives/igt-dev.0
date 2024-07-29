Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357C9C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 12:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEF910E3B0;
	Mon, 29 Jul 2024 12:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvxMHCxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C611F10E3AD;
 Mon, 29 Jul 2024 12:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722255784; x=1753791784;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qxKAbeeLpJtACp3gda+vLR3Rntrh1FWKT6UtTb6ESAs=;
 b=hvxMHCxsvRxe5k3QLdO7WhMTGbeTh+2LOQGeCY6hZeBzXxmWQEjwVyga
 eRI30ebC78m5HrkIu3mkEn/m0XeiL18Tk6hFKmuRw150bSsks3wyaLSFs
 DlUYJpklS+jI0MH/y25xda7mpwkgxTgKXR0eOE9/8qIImcFqkMt5V91vo
 05b5pS3adzGu5g7mm9zVsOdm3PRvUTw6AeOZC7ucZevw+8Ktx3DBXmrvZ
 5vVAzNLYpbIDiB/ZbOLxOzfJ+u73RXd+O2CEmbhECBc+9oDrxtGhCTYGB
 6oiJSbfDijIE6We6ycXkpIis4h99x//J1tx3UqyYxFVvoM+/nYFVpcQ6i g==;
X-CSE-ConnectionGUID: GDuCEvhuRQaBqk6MY/9S/Q==
X-CSE-MsgGUID: RaTiqjxRQQGwYHroR5BF/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19849374"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="19849374"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 05:23:04 -0700
X-CSE-ConnectionGUID: gvVfJ7+YThWZfqm7Lon7mw==
X-CSE-MsgGUID: B/hysbGNTL2gh4QHXqPjzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="54549142"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 05:23:02 -0700
Date: Mon, 29 Jul 2024 14:22:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/device_reset: Wait for device nodes to re-appear
Message-ID: <20240729122259.m6zejjrb52g7asjs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240726084022.356654-4-janusz.krzysztofik@linux.intel.com>
 <172205525366.387735.13048854510792008122@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172205525366.387735.13048854510792008122@2413ebb6fbb6>
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
On 2024-07-27 at 04:40:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/device_reset: Wait for device nodes to re-appear
> URL   : https://patchwork.freedesktop.org/series/136559/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7939_full -> IGTPW_11475_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11475_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11475_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11475/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11475_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:
>     - shard-dg1:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7939/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11475/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_vblank@wait-forked-busy-hang@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11475/shard-dg2-4/igt@kms_vblank@wait-forked-busy-hang@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vblank@wait-forked-busy-hang@pipe-d-hdmi-a-4:
>     - shard-dg1:          [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7939/shard-dg1-16/igt@kms_vblank@wait-forked-busy-hang@pipe-d-hdmi-a-4.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11475/shard-dg1-15/igt@kms_vblank@wait-forked-busy-hang@pipe-d-hdmi-a-4.html
> 

These are unrelated to device_reset and core_hotunplug,
no need for respin as I plan to merge it soon.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11475_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8411])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11475/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7939 -> IGTPW_11475
> 
>   CI-20190529: 20190529
>   CI_DRM_15136: edd84625d093bb52bfb1c0c6feb12cff308d81b7 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11475: 11475
>   IGT_7939: 7939
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11475/index.html
