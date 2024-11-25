Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF36D3B7E1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 07:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360D910E05A;
	Mon, 25 Nov 2024 07:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUYfcS3t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA37E10E05A;
 Mon, 25 Nov 2024 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732518910; x=1764054910;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wUfrsSPnQqxLjcF8icCKzZhk9kn+VaDIBVr8NecgKAg=;
 b=SUYfcS3t94PM33vSsIb9OMEaxBQQN3FIQVHDHFPo2E1IU58Ix/b9lcAA
 xjVcHJuFfanZkdlxUen1xXTvErzlHSWQuD7WIS/EcpYK+Z+W1egjjww7U
 qzRP2Wr+MJcPXch5NCttmubwiXb8GgLzJqyOAWn0HOdXVPE0rSqK9+boM
 47C32UfYgEo/xAbtKAOgVHogdZ0dm0P2fJdfBDTOz0hYKSzJ4/zavWMII
 m6fj8a9aBZwByYobTRE4EMap4lepXPQqWzknuR67q6Dy7QkIfYWa3eFfs
 radE0vphjrgXgyF64JofRqu24ujM/sdJRdXRzQ7doEeFTWJnpxW3cqb78 Q==;
X-CSE-ConnectionGUID: MU/lbaO4TZGeTR8qfiMeFg==
X-CSE-MsgGUID: z57YBJoSSs6tzuyVo0G8yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43266242"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="43266242"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:15:09 -0800
X-CSE-ConnectionGUID: BY37Fc+MSKeR4bDG9izWHQ==
X-CSE-MsgGUID: KmHFck4dT/aU9BDvP9+/cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="122131276"
Received: from jankamin-mobl2.ger.corp.intel.com (HELO [10.213.198.33])
 ([10.213.198.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:15:09 -0800
Message-ID: <dc5e57ae-778d-4528-9fa0-6d5c11e967d5@linux.intel.com>
Date: Mon, 25 Nov 2024 08:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_igt-runner_?=
 =?UTF-8?Q?fact_checking_=28rev8=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173226306005.1628198.15482143446403084714@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173226306005.1628198.15482143446403084714@b555e5b46a47>
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

Can you confirm you received my reply to this email on Friday?

On 22.11.2024 09:11, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev8)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8121_full -> XEIGTPW_12163_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12163_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12163_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12163_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-lnl-6/igt@kms_big_fb@4-tiled-addfb.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12163/shard-lnl-1/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_color@ctm-max:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +4 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@kms_color@ctm-max.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12163/shard-bmg-1/igt@kms_color@ctm-max.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12163/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>     - shard-bmg:          NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12163/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

These are unrelated to my change. Please fix and re-run.

> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - shard-bmg:          [INCOMPLETE][8] ([Intel XE#3468]) -> [INCOMPLETE][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@core_hotunplug@unbind-rebind.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12163/shard-bmg-2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
>     - shard-bmg:          [DMESG-WARN][10] ([Intel XE#3371] / [Intel XE#3515]) -> [DMESG-WARN][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12163/shard-bmg-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
>     - shard-bmg:          [DMESG-FAIL][12] ([Intel XE#3467] / [Intel XE#3468]) -> [FAIL][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12163/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
> 
>   * igt@xe_module_load@reload:
>     - shard-bmg:          [DMESG-WARN][14] ([Intel XE#3467]) -> [DMESG-WARN][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-bmg-8/igt@xe_module_load@reload.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12163/shard-bmg-6/igt@xe_module_load@reload.html
> 
>   * igt@xe_oa@syncs-userptr-wait-cfg:
>     - shard-dg2-set2:     [SKIP][16] ([Intel XE#1130]) -> [SKIP][17] +7 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8121/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12163/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html

These are unrelated to my change. Please fix and re-run.

[...]

Thank you,

Peter
