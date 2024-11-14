Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51540D68B18
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 13:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF0C10E2AC;
	Thu, 14 Nov 2024 13:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2PNd/v/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6380710E092;
 Thu, 14 Nov 2024 13:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731592362; x=1763128362;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=aB+9CVNLW1PvweWc3SBbLe5IeKwiVLQzsNblqqGjc90=;
 b=F2PNd/v/ZAqCcrY4fLBeS5+1B3zOyNJq4iUkA48SnCRaSUFFvILd1aXX
 z/RG7EX0MScucw22Zb0IDO5bHWSNrzwoAXFxRH/3KjdLwZ8PcG3DrZf4w
 P4+tTzoa+Ir9Pu2UvAnROdPymrdMGwF0iBuqUbyOZxCZwk9uFY63tQICF
 evFHa3r/VTBS89NyAwlPZVwwifm5h9MnO67dwDFsthvgO9lBOXd1wZSFu
 gkXXqlp7Si9tnzzwgmf6I9wlBnB+1ZQshAV8iM7YBn/uG7bXpsvLymo2x
 lr4FT8fVPUFisEP8Brz887FVYIy6dkcOXiJi4PR2IAL3ytXLjTxSOe0eR w==;
X-CSE-ConnectionGUID: iCZHmACMSJWFhoyIOVR9mA==
X-CSE-MsgGUID: H9AKuqaDR2iYu2JhYteR3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="49053276"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="49053276"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:52:42 -0800
X-CSE-ConnectionGUID: Am5dHsz3SzOD6jY8Z8i7/g==
X-CSE-MsgGUID: 41wU34LfSzKVF2W8R55JRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88107181"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.84.149])
 ([10.245.84.149])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:52:41 -0800
Message-ID: <cdd46f35-2f88-4a5b-9734-c8efbf9444f0@linux.intel.com>
Date: Thu, 14 Nov 2024 14:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel-ci/?=
 =?UTF-8?Q?xe-fast-feedback=3A_Add_SR-IOV_FLR_test?=
To: igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20241106182503.203956-1-jakub1.kolakowski@intel.com>
 <173092218627.1418616.10266718130063274643@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <173092218627.1418616.10266718130063274643@2413ebb6fbb6>
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



On 11/6/2024 8:43 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel-ci/xe-fast-feedback: Add SR-IOV FLR test
> *URL:*	https://patchwork.freedesktop.org/series/141020/ <https:// 
> patchwork.freedesktop.org/series/141020/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8099_BAT -> XEIGTPW_12052_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_12052_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12052_BAT, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (9 -> 9)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12052_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>       o bat-adlp-vf: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-
>         clear.html>

Expected SKIP, test is for PF run not VF.

>       o bat-pvc-2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/bat-pvc-2/igt@xe_sriov_flr@flr-vf1-clear.html>
> 
Expected SKIP, no SR-IOV on PVC.

--
marcin
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_12052_BAT that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o bat-adlp-7: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/bat-
>         adlp-7/igt@kms_frontbuffer_tracking@basic.html> (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>   *
> 
>     igt@xe_evict@evict-beng-small:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/bat-adlp-7/igt@xe_evict@evict-beng-
>         small.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/261> / Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +15 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/bat-adlp-7/igt@xe_exec_fault_mode@twice-
>         userptr-invalidate-prefetch.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32 other
>         tests skip
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> 
>       o bat-dg2-oem2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8099/bat-dg2-oem2/
>         igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/bat-dg2-
>         oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> (Intel
>         XE#2874 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2874>) +1 other test incomplete
>   *
> 
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>       o bat-adlp-7: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/bat-adlp-7/
>         igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_sriov_flr@flr-vf1-clear:
> 
>       o bat-bmg-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-
>         clear.html> (Intel XE#3342 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3342>)
>       o bat-lnl-2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-
>         clear.html> (Intel XE#3342 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3342>)
>       o bat-dg2-oem2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-
>         clear.html> (Intel XE#3342 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3342>)
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-
>         clear.html> (Intel XE#3342 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3342>)
>       o bat-bmg-2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12052/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-
>         clear.html> (Intel XE#3342 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3342>)
> 
> 
>         Possible fixes
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>       o bat-adlp-7: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8099/bat-adlp-7/
>         igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> (Intel XE#2874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/bat-
>         adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> +1 other
>         test pass
> 
> 
>     Build changes
> 
>   * IGT: IGT_8099 -> IGTPW_12052
>   * Linux: xe-2170-2b31f47649daecf2da6611c70072dfbe4914c22a ->
>     xe-2179-438ef86a725b59a171dba81fc258bb23a0ff536c
> 
> IGTPW_12052: a5e29ba28ed9b77e17e7682dde14ad815df4fa73 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2170-2b31f47649daecf2da6611c70072dfbe4914c22a: 
> 2b31f47649daecf2da6611c70072dfbe4914c22a
> xe-2179-438ef86a725b59a171dba81fc258bb23a0ff536c: 
> 438ef86a725b59a171dba81fc258bb23a0ff536c
> 

