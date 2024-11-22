Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8938FE65D34
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438FD10EAF5;
	Fri, 22 Nov 2024 08:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUCTE1sG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FD610EAED;
 Fri, 22 Nov 2024 08:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732264026; x=1763800026;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ll9nkKZ+/5BQ1ipW7lUGP+XeQmW4sufPwC5tXyaezss=;
 b=nUCTE1sGHfAMCr1gAJcpDFoM++Ta0JTr71NRQ++MvXsdgY9ZJNhk1P77
 LMCk1Y3ubuK7+9Lt3Q1XrT3y5JP97UfqFW4VK49xU0Xi4HpYRHLMbRN8v
 OR+o7n5/eTH6T4nabUt9lstiEggxtBYWQ7MQIC/THDQTwfR6AX4IQDGga
 Yh34l+9hsMZTBFwNPqlhioQIXsX3Hy5bZJ3/8l3xq1Ptujg6qKtBqZVAI
 ccL6KiwJ7g3qyMUxTNdrZInilIPiDbr+Y0DGZvaZ0v4BfO53YoeACVJ9k
 wQd0IDqpk7QGOwpo+5gOxotKXTi7WSbEa3/j4GVdWdr2JY5mqBvV8p2lz g==;
X-CSE-ConnectionGUID: 4TUDoiMCSXuDVjYL/EvISA==
X-CSE-MsgGUID: 3gr24aCdQ2yCGuDo6QOXZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43058162"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="43058162"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:27:05 -0800
X-CSE-ConnectionGUID: fvprrs+jQ3Cg0KRqJivlVA==
X-CSE-MsgGUID: PYW6+F2XRnOnzfDZ8iLt8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="91301698"
Received: from nadesanm-mobl.ger.corp.intel.com (HELO [10.213.197.183])
 ([10.213.197.183])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:27:05 -0800
Message-ID: <e8335b09-f7c8-4de0-8f49-134c1ff0a5e6@linux.intel.com>
Date: Fri, 22 Nov 2024 09:27:02 +0100
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

Thank you!
