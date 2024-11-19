Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7EFD591CC
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 06:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A15810E5B9;
	Tue, 19 Nov 2024 06:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uu69izpy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D659810E5B9;
 Tue, 19 Nov 2024 06:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731996939; x=1763532939;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=10hbD4QcVvlC4AxIhOPN1HByHqRZpCEqYMTJ/2IYeHo=;
 b=Uu69izpy6um9l83O34FOzyIlcl9y6KxlKqF62/KHhc6PZ8HAeEiFkfuE
 ChzemPWEgrOB2yQvxpB6oC5xbQ7jf46rGpZz4yOj+IeJay5oZ8ZAfJ00Y
 2kEO+H/IXS8X7buUMXbnF/e4Ke+qXSYYKEidXu30JalyybZyFbXnLvuCr
 LGwXV01RZUop6wxdWx/9qk6S4g29b/OUj7P2G83yJDTMFJpeDXjCJUt8o
 bvsuQON7i6sLSxGzkTa92/6mlo1u+/k144buHvxdENkkccr158cNu0yFh
 ghzHYEKV2JPFgdrl4lz8hhdJ4rgEhkzCziyxp367BVLmKWQTzf+7iaGmB A==;
X-CSE-ConnectionGUID: CFB+LvTqQ6CojLzDlaK0tw==
X-CSE-MsgGUID: ulWIg2uLRKOxlUEtkmn1Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32128113"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32128113"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:15:39 -0800
X-CSE-ConnectionGUID: qWSF2UZ5QJmEJxu1Lme/pg==
X-CSE-MsgGUID: OPvbXHQpRoSen2zs+SpB8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89863067"
Received: from jjwhelan-mobl3.ger.corp.intel.com (HELO [10.213.197.40])
 ([10.213.197.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:15:38 -0800
Message-ID: <0af76426-1855-4b27-90de-6e87641460c6@linux.intel.com>
Date: Tue, 19 Nov 2024 07:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_igt-runner_fac?=
 =?UTF-8?Q?t_checking_=28rev6=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173199290747.184311.14116373153357551630@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173199290747.184311.14116373153357551630@b555e5b46a47>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 19.11.2024 06:08, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev6)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8115_full -> XEIGTPW_12121_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12121_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12121_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12121_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +6 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-bmg:          [PASS][5] -> [DMESG-FAIL][6] +24 other tests dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][7] -> [DMESG-FAIL][8] +6 other tests dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
>     - shard-lnl:          [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][11] +13 other tests dmesg-warn
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
> 
>   * igt@kms_sequence@queue-busy@pipe-c-dp-2:
>     - shard-bmg:          [PASS][12] -> [DMESG-WARN][13] +146 other tests dmesg-warn
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-3/igt@kms_sequence@queue-busy@pipe-c-dp-2.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-1/igt@kms_sequence@queue-busy@pipe-c-dp-2.html
> 
>   * igt@kms_setmode@basic:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][14] +7 other tests dmesg-fail
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-1/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [FAIL][15] +4 other tests fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-1/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
> 
>   * igt@xe_create@create-invalid-size:
>     - shard-dg2-set2:     [PASS][16] -> [DMESG-WARN][17] +7 other tests dmesg-warn
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-433/igt@xe_create@create-invalid-size.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-dg2-434/igt@xe_create@create-invalid-size.html
> 
>   * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][18] +35 other tests dmesg-warn
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-1/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:
>     - shard-bmg:          [PASS][19] -> [FAIL][20] +1 other test fail
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-4/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html

These are not related to my change.


>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][21] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
>     - shard-bmg:          [DMESG-FAIL][23] -> [DMESG-WARN][24] +1 other test dmesg-warn
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [FAIL][25] ([Intel XE#2882]) -> [DMESG-FAIL][26]
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [FAIL][27] ([Intel XE#2333]) -> [DMESG-FAIL][28] +8 other tests dmesg-fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-rte:
>     - shard-bmg:          [FAIL][29] ([Intel XE#2333]) -> [INCOMPLETE][30]
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-bmg:          [FAIL][31] ([Intel XE#1430]) -> [DMESG-FAIL][32]
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg2-set2:     [SKIP][33] ([Intel XE#2446]) -> [DMESG-WARN][34]
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [SKIP][35] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][36]
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
>     - shard-bmg:          [DMESG-FAIL][37] ([Intel XE#3467]) -> [DMESG-FAIL][38]
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
> 
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-dg2-set2:     [SKIP][39] ([Intel XE#1130]) -> [DMESG-WARN][40] +3 other tests dmesg-warn
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12121/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-unbind-all.html

These are not related to my change.

Thank you,

Peter

[...]
