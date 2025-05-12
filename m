Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2BCC3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 10:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244EE10E3B4;
	Mon, 12 May 2025 10:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrPh/V+X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CF810E39C;
 Mon, 12 May 2025 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747046268; x=1778582268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jnZ9yBDAtwselp0IfI01Zb41UTeTKOlV2XfX5kRHllY=;
 b=ZrPh/V+X6NvK6z3BJGKDxJyffJakfeOFkASCpERGKZMZUfZFPFCG8J3N
 mSgcIBk1Wnqhu6gDPygzeNgEwVBI9TzKRm8CXtfDgwW3Z3sHHaEobXKK4
 zxj6i2T7JSpHJ8rnSk/n/e0OYMvqLg5mh0Qxgf1nkXtwL855FfhncfFOe
 dgMlUbnLlb4y4y1GZbTsSPlNl5/VClwXkuIUf5FuI7KBiJhBpuFEiR31V
 gglNc9c13DjWWsccWLwZGxDFJHF4VHrLabPKPkmf6wIFQt5NAkN+Og0KO
 vzJb1F/QL6pBkpIjCo8rvEOzVvFDvKX+dE7rGZRK65e0m0lsOp5ddiI4N w==;
X-CSE-ConnectionGUID: eW/5RjmiRpG2c1mEWhsI/A==
X-CSE-MsgGUID: t+0+lpqnSzmQwQ8BM16cXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48736489"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48736489"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:34:05 -0700
X-CSE-ConnectionGUID: eVXEmgkARfKv6OZvqvSXwQ==
X-CSE-MsgGUID: GNQzwBwuSxGrKW+Srtrz7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="174475723"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:34:04 -0700
Date: Mon, 12 May 2025 12:34:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm8=?= =?utf-8?Q?r?=
 intel-ci/xe.blocklist: remove device_reset@unbind-*-rebind
Message-ID: <20250512103401.qhmny5bkmvpjh7jo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250509132602.27205-1-kamil.konieczny@linux.intel.com>
 <174684781652.65801.2909272465302698143@c664b1dc75d1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174684781652.65801.2909272465302698143@c664b1dc75d1>
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
On 2025-05-10 at 03:30:16 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci/xe.blocklist: remove device_reset@unbind-*-rebind
> URL   : https://patchwork.freedesktop.org/series/148816/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8359_FULL -> XEIGTPW_13106_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13106_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13106_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13106_FULL:

I do not see here any info about two success runs on BMG and LNL,
these can be found in here:

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shards-all.html?testfilter=device_reset

> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][1] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-bmg-5/igt@device_reset@unbind-cold-reset-rebind.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-dg2-436/igt@device_reset@unbind-cold-reset-rebind.html
> 

These are expected skips, 'cold-reset' requires special PCI cards,
I will resend improved version of this soon.

Rest of fails are unrelated.

Regards,
Kamil


>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-bmg:          [PASS][3] -> [SKIP][4] +27 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-bmg-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_properties@get_properties-sanity-non-atomic:
>     - shard-bmg:          [PASS][5] -> [FAIL][6] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-3/igt@kms_properties@get_properties-sanity-non-atomic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-bmg-4/igt@kms_properties@get_properties-sanity-non-atomic.html
>     - shard-dg2-set2:     NOTRUN -> [FAIL][7] +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-dg2-463/igt@kms_properties@get_properties-sanity-non-atomic.html
> 
>   * igt@kms_vblank@wait-forked-hang:
>     - shard-lnl:          [PASS][8] -> [SKIP][9] +54 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-7/igt@kms_vblank@wait-forked-hang.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@kms_vblank@wait-forked-hang.html
> 
>   * igt@xe_exec_queue_property@timeslice_duration_us-property-min-max:
>     - shard-lnl:          NOTRUN -> [SKIP][10] +5 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][11] -> [FAIL][12] +2 other tests fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-lnl:          [SKIP][13] ([Intel XE#3157]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
>     - shard-bmg:          [SKIP][15] ([Intel XE#2252]) -> [SKIP][16] +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-1/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-bmg-6/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
>     - shard-lnl:          [SKIP][17] ([Intel XE#373]) -> [SKIP][18] +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-bmg:          [SKIP][19] ([Intel XE#2291]) -> [SKIP][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>     - shard-lnl:          [SKIP][21] ([Intel XE#309]) -> [SKIP][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-lnl:          [SKIP][23] ([Intel XE#1421]) -> [SKIP][24]
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-2/igt@kms_flip@2x-plain-flip-ts-check.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
>     - shard-lnl:          [FAIL][25] ([Intel XE#4689]) -> [SKIP][26]
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-lnl:          [SKIP][27] ([Intel XE#1127]) -> [SKIP][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@xe_eudebug@basic-vm-access-parameters-faultable:
>     - shard-bmg:          [SKIP][29] ([Intel XE#4837]) -> [SKIP][30]
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-8/igt@xe_eudebug@basic-vm-access-parameters-faultable.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-bmg-6/igt@xe_eudebug@basic-vm-access-parameters-faultable.html
>     - shard-lnl:          [SKIP][31] ([Intel XE#4837]) -> [SKIP][32]
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-2/igt@xe_eudebug@basic-vm-access-parameters-faultable.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@xe_eudebug@basic-vm-access-parameters-faultable.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
>     - shard-lnl:          [SKIP][33] ([Intel XE#1392]) -> [SKIP][34] +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
> 
>   * igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:
>     - shard-lnl:          [SKIP][35] ([Intel XE#4943]) -> [SKIP][36] +4 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-5/igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge:
>     - shard-bmg:          [SKIP][37] ([Intel XE#4943]) -> [SKIP][38] +4 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-lnl:          [SKIP][39] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][40]
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_exec_system_allocator@once-large-malloc-fork-read}:
>     - shard-bmg:          [PASS][41] -> [INCOMPLETE][42]
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-5/igt@xe_exec_system_allocator@once-large-malloc-fork-read.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/shard-bmg-1/igt@xe_exec_system_allocator@once-large-malloc-fork-read.html

...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8359 -> IGTPW_13106
>   * Linux: xe-3051-2862c51f227a36e59ee4a9bb90b690c9855a6246 -> xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9
> 
>   IGTPW_13106: 13106
>   IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3051-2862c51f227a36e59ee4a9bb90b690c9855a6246: 2862c51f227a36e59ee4a9bb90b690c9855a6246
>   xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13106/index.html
