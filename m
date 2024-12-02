Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3A7D4979C
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 05:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BA610E0E7;
	Mon,  2 Dec 2024 05:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Syy9v/sR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0AD10E0E7;
 Mon,  2 Dec 2024 05:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733115695; x=1764651695;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sVTq9SS+I1hBlTKg9KPD1m4LErgfeTFZa50i3W+Q4y4=;
 b=Syy9v/sRdQmeLeIbRRaLyGqhNv4sdW7eNAp8ML6m2xf/gpD9kVegVBF2
 4osILljrwh0C4Og39S1j+GoQc06i17wjfUQ62Vhq03+Ymcy8pB9pzjQHx
 mFqApM4LYZhVCYgmPSjA+6Lto1xuSxKNG8fLicqMW/2Wau4u6CSLGJZ83
 JJc+uR3WYrnrsQmIFThDjOiRjvJSF8QJfWew5P32Mi3mJRvmIfP62RHGM
 aF+0mcKfsVwcArlZpOzQ/BSJw38sEiiljMhRSUVvPC5uOlFPHArzAgZ1j
 Yq1Ptu6BM1Ft+Otr9FvncfxbG3akDEq56CQrTqBWKzFRc/HonZJL29skR w==;
X-CSE-ConnectionGUID: O9b2JLHhSo2Its8jww6lzw==
X-CSE-MsgGUID: JnDE8CVbQEy5KGfCwzgFCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="43752342"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="43752342"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2024 21:01:35 -0800
X-CSE-ConnectionGUID: IkjQDxbzQOmseQcViP2uSQ==
X-CSE-MsgGUID: wp7yUtPYSuKYzuidcFLMww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="97960117"
Received: from cjones-mobl.ger.corp.intel.com (HELO [10.213.199.113])
 ([10.213.199.113])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2024 21:01:34 -0800
Message-ID: <4580a4b8-2257-41c5-be46-c3201f75e720@linux.intel.com>
Date: Mon, 2 Dec 2024 06:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_igt-runner_?=
 =?UTF-8?Q?fact_checking_=28rev9=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173290118286.355975.3786252362572644125@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173290118286.355975.3786252362572644125@b555e5b46a47>
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

On 29.11.2024 18:26, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev9)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8130_full -> XEIGTPW_12219_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12219_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12219_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12219_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x128:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-128x128.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12219/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-128x128.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][3] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12219/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
>     - shard-bmg:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12219/shard-bmg-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-4-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5] +106 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12219/shard-dg2-436/igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-4-linear-to-4-rc-ccs-cc.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
>     - shard-bmg:          [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12219/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
> 
>   * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
>     - shard-dg2-set2:     [PASS][8] -> [INCOMPLETE][9] +1 other test incomplete
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12219/shard-dg2-435/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
> 
>   * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
>     - shard-lnl:          [PASS][10] -> [FAIL][11] +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-4/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12219/shard-lnl-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

These are unrelated to my change. Please fix and run again.

> 
>   
> #### Warnings ####
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
>     - shard-bmg:          [SKIP][12] ([Intel XE#1130]) -> [ABORT][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12219/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
> 

These are unrelated to my change. Please fix and run again.

Thank you,

Peter

[...]
