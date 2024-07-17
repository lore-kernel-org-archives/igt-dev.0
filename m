Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7402EC3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDF510E0CE;
	Wed, 17 Jul 2024 14:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqPFBOup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2023010E0D6;
 Wed, 17 Jul 2024 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721224876; x=1752760876;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VNXuTyYqn+VMU2q3pKAIn8jTtvK0YiSylkfbqARhqp0=;
 b=mqPFBOupCqV0XpiJ//bjhqEeW5Pro1q+QIhtcFZ1ZSMpDSCeyuUlbBoU
 qBsx46s4bsMqB89eQzBopqo7t9aTdmISX9TIpPFZ6/onP2ELa098sibAg
 4q9cHsMhAiBX8hro4zesj93Zk295tGvl1eLNbMmwJCpBino7jHHwwbI5U
 ppA38lz+SQrPXziZEynQQbElGG9g07oEpQJHiTvW1hhWWLsZ8aGKX78tS
 FHOsNpzyzzoDXcBgu8x4wgmlzYaNdjE11lzULl9cblqL1k5HikNLpmr1m
 N01LOtoSJdJuFTPzyKC4/AoxxUDhFaYiYJghqPaCHe+X5E+2+d84luVjj g==;
X-CSE-ConnectionGUID: 1IbvwGRBTDu72EQjY911Zg==
X-CSE-MsgGUID: S2vLKGUmQVmPHzqC2MqVgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29340914"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29340914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:01:15 -0700
X-CSE-ConnectionGUID: NkQlDPtQQP6/MGQfNtszLQ==
X-CSE-MsgGUID: Dg0tHV/1TWG0pvMgPAL29w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="87867243"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:01:14 -0700
Date: Wed, 17 Jul 2024 16:01:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlQkFU?= =?utf-8?Q?=3A?= failure for Add
 gputop support for sysfs profiling knob
Message-ID: <20240717140111.47vb2lt4p2yif6dx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240716205756.2973341-1-adrian.larumbe@collabora.com>
 <172116576142.253626.17889451779081856971@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172116576142.253626.17889451779081856971@2413ebb6fbb6>
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
On 2024-07-16 at 21:36:01 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add gputop support for sysfs profiling knob
> URL   : https://patchwork.freedesktop.org/series/136161/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7927_BAT -> XEIGTPW_11414_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11414_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11414_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (5 -> 3)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11414_BAT prevented too many machines from booting.
> 
>   Additional (1): bat-lnl-1 
>   Missing    (3): bat-bmg-1 bat-pvc-2 bat-dg2-oem2 
> 

This is unrelated to change in tools/gputop.

Regards,
Kamil

> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11414_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-lnl-1:          NOTRUN -> [SKIP][1] ([Intel XE#1466])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-lnl-1:          NOTRUN -> [SKIP][2] ([Intel XE#599])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - bat-lnl-1:          NOTRUN -> [SKIP][3] ([Intel XE#352]) +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - bat-lnl-1:          NOTRUN -> [SKIP][4] ([Intel XE#1470])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - bat-lnl-1:          NOTRUN -> [SKIP][5] ([Intel XE#1091]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_evict@evict-threads-small:
>     - bat-lnl-1:          NOTRUN -> [SKIP][6] ([Intel XE#688]) +17 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@xe_evict@evict-threads-small.html
> 
>   * igt@xe_gt_freq@freq_range_idle:
>     - bat-lnl-1:          NOTRUN -> [SKIP][7] ([Intel XE#1462]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html
> 
>   * igt@xe_mmap@vram:
>     - bat-lnl-1:          NOTRUN -> [SKIP][8] ([Intel XE#1416])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@xe_mmap@vram.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-lnl-1:          NOTRUN -> [SKIP][9] ([Intel XE#1420])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelp:
>     - bat-lnl-1:          NOTRUN -> [SKIP][10] ([Intel XE#977])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - bat-lnl-1:          NOTRUN -> [SKIP][11] ([Intel XE#979])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm_residency@gt-c6-on-idle:
>     - bat-lnl-1:          NOTRUN -> [FAIL][12] ([Intel XE#1442])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html
> 
>   
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
>   [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7927 -> IGTPW_11414
>   * Linux: xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9 -> xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576
> 
>   IGTPW_11414: 11414
>   IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9: b6af83ceb593bc4e0d79acda73684462b13a15b9
>   xe-1615-297dce9fadb6008b164278f5d702b4d7ba402576: 297dce9fadb6008b164278f5d702b4d7ba402576
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11414/index.html
