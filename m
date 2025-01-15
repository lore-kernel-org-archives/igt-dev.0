Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99247C02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 15:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFE010E508;
	Wed, 15 Jan 2025 15:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFv0uuem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302BC10E715;
 Wed, 15 Jan 2025 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736953897; x=1768489897;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ANa2llfpFeCyYBukk8m51isQYnexmttYWm61g8YW/5E=;
 b=bFv0uuemN4TdolyF3QodLB/MQYoA6h57pfbLFww7frmd0/DRVEjwbC7G
 gfpAF55EJ6szOdWtK6keKl7CW03PcK3uVHop6H7g6IMOg4hJrfm/HDWoe
 7otTY6bmmZJz/CSAP6aWjjGDxIYKrIx6vj1G+s2tyl0gFWEITmXbBPJIO
 k9AVWtRzJUXmbyzKKzrLHEZv4AX/ZJNPbiCbc/ZeWonRECxoSTXKqgucc
 sGIPRr3sM4dnNHQgKqy+duJk0YHGGTF7rlizVh6yrIR23kaQ5/vqzM0Q4
 WIKwejH/MJ9u5Dj70QYvnyJ3b7H5bwo3e1+5z9r2/emTYKkBtzZAx18HT A==;
X-CSE-ConnectionGUID: EYjhm46nRlaoOpQj7VTCRA==
X-CSE-MsgGUID: zGJW9eaJR52pbZIrxBhBFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37522319"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="37522319"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:11:37 -0800
X-CSE-ConnectionGUID: +m8z4QGeQLKa7eDcxRn84g==
X-CSE-MsgGUID: Bd3ibIKlQ3qOqBU8fL350w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109796118"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.179])
 ([10.245.244.179])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:11:35 -0800
Message-ID: <b816b433-a213-487e-8e93-7d98172327cb@intel.com>
Date: Wed, 15 Jan 2025 15:11:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Initial_PTL?=
 =?UTF-8?Q?_support_=28rev6=29?=
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Clint Taylor <clinton.a.taylor@intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <173663061097.2602953.10099674755140442503@b555e5b46a47>
 <20250115114147.myzcubzcp5inqlvh@kamilkon-desk.igk.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250115114147.myzcubzcp5inqlvh@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 15/01/2025 11:41, Kamil Konieczny wrote:
> Hi igt-dev,
> On 2025-01-11 at 21:23:30 -0000, Patchwork wrote:
> 
> could anyone from KMS team confirm that below kms regressions
> are not related? Thanks!
> 
> Adding J-P and Jani to Cc.
> Cc: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Jani Saarinen <jani.saarinen@intel.com>
> 
> As for xe_mmap - imho this SKIP is not related to this series.
> Tejas could you confirm? Thanks!

This is currently expected until KMD side lands. Once it lands it should 
only skip on igpu. So not related to this series.

> 
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> Regards,
> Kamil
> 
>> == Series Details ==
>>
>> Series: Initial PTL support (rev6)
>> URL   : https://patchwork.freedesktop.org/series/141325/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from XEIGT_8183_full -> XEIGTPW_12418_full
>> ====================================================
>>
>> Summary
>> -------
>>
>>    **FAILURE**
>>
>>    Serious unknown changes coming with XEIGTPW_12418_full absolutely need to be
>>    verified manually.
>>    
>>    If you think the reported changes have nothing to do with the changes
>>    introduced in XEIGTPW_12418_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>    to document this new failure mode, which will reduce false positives in CI.
>>
>>    
>>
>> Participating hosts (4 -> 4)
>> ------------------------------
>>
>>    No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>    Here are the unknown changes that may have been introduced in XEIGTPW_12418_full:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>    * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-6:
>>      - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-6.html
>>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-6.html
>>
>>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>>      - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
>>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
>>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
>>
>>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:
>>      - shard-dg2-set2:     NOTRUN -> [ABORT][5] +1 other test abort
>>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html
>>
>>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2:
>>      - shard-dg2-set2:     NOTRUN -> [FAIL][6] +3 other tests fail
>>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2.html
>>
>>    * igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-3:
>>      - shard-bmg:          [PASS][7] -> [INCOMPLETE][8] +3 other tests incomplete
>>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-bmg-4/igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-3.html
>>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-bmg-8/igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-3.html
>>
>>    * igt@kms_psr@psr2-suspend@edp-1:
>>      - shard-lnl:          [PASS][9] -> [FAIL][10] +1 other test fail
>>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-lnl-2/igt@kms_psr@psr2-suspend@edp-1.html
>>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-lnl-2/igt@kms_psr@psr2-suspend@edp-1.html
>>
>>    * igt@xe_mmap@pci-membarrier:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][11]
>>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-dg2-433/igt@xe_mmap@pci-membarrier.html
>>
>>    
>> Known issues
>> ------------
>>
>>    Here are the changes found in XEIGTPW_12418_full that come from known issues:
>>
>> ### IGT changes ###
>>
>> #### Issues hit ####
> 
> ...cut...
> 
>>    [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>>
>>
>> Build changes
>> -------------
>>
>>    * IGT: IGT_8183 -> IGTPW_12418
>>
>>    IGTPW_12418: 23052ace3ac04fd0203b573736255ba4919c63d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>    IGT_8183: b2dbc6f22815128c0dd5c737504f42e1f1a6ad62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>    xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b: 14e0c4a8247c9514dc57b2231602fb6d9455802b
>>
>> == Logs ==
>>
>> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/index.html

