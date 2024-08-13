Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A55AC52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 07:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DECE10E2CA;
	Tue, 13 Aug 2024 07:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJMFh/Bx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B6510E2CA
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723532952; x=1755068952;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=gn6Wxx0yatlLf1rlwk1mUOKrJSe9RsiaLON9zB1LLIQ=;
 b=gJMFh/Bx5YvygfAVz5A0oidm/9bLCQb/h0bmAarqeC/70W9ll1HZ+aOK
 brCqYug3pwSMqV+4PgIKg/oiOIAAaA9pOVWWL56r+WBhrcg+m8AGwhr0K
 Kwyu5HV1jdCRS0n71IUB9t+AF6FEoO1wW82cEgWKgnJN72Otxe49njH8V
 t3TTL4DRhUqNX+eOYWG7NlXCLjlrlhJRCm8W4e2KDh5AULHsKm9xreOQK
 z5SEzLSPQy+zn/rcmKuV8E6brK/n764KHDfQgGknIuix2dlXPWsZfcRCX
 LkLKqXA+L9zow0Zs7TmvvZuJjubuS4Ih4nXLa3qvWOTQraVeCTIC+0jk3 g==;
X-CSE-ConnectionGUID: KyuMY/EtQwCP3PfK76D3PA==
X-CSE-MsgGUID: tBDx7EF+T0uzhpeMWmEnZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32353653"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="32353653"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 00:09:11 -0700
X-CSE-ConnectionGUID: aUTshKoMR526RfiGiLoc4w==
X-CSE-MsgGUID: 9NpaRJ5QQXehtaRTG0JLXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="59137417"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.96.225])
 ([10.245.96.225])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 00:09:11 -0700
Message-ID: <62a73db6-b0dc-4c87-b05b-fe840ab332fb@linux.intel.com>
Date: Tue, 13 Aug 2024 09:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel/xe?=
 =?UTF-8?Q?=5Fhuc=5Fcopy=3A_Enhance_HuC_status_check_for_VF_mode?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20240812180812.1310155-1-marcin.bernatowicz@linux.intel.com>
 <172349042223.595846.2925743004229000282@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <172349042223.595846.2925743004229000282@2413ebb6fbb6>
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



On 8/12/2024 9:20 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel/xe_huc_copy: Enhance HuC status check for VF mode
> *URL:*	https://patchwork.freedesktop.org/series/137198/ 
> <https://patchwork.freedesktop.org/series/137198/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_7966_BAT -> XEIGTPW_11559_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_11559_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11559_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
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
> XEIGTPW_11559_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
>       o bat-pvc-2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html>
> 

Not related to the change. This change is isolated to the xe_huc_copy 
and does not impact other tests. The issue addressed by this patch is 
demonstrated in the xe_huc_copy results below (SKIP -> PASS).

Regards,
marcin

> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_11559_BAT that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>       o bat-lnl-1: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1 other test fail
> 
> 
>         Possible fixes
> 
>   * igt@xe_huc_copy@huc_copy:
>       o bat-adlp-vf: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/bat-adlp-vf/igt@xe_huc_copy@huc_copy.html> (Intel XE#2466 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2466>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/bat-adlp-vf/igt@xe_huc_copy@huc_copy.html>
> 
> 
>     Build changes
> 
>   * IGT: IGT_7966 -> IGTPW_11559
>   * Linux: xe-1747-a95e3e46063ddcea598b2ac865173debffba13fe ->
>     xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093
> 
> IGTPW_11559: 11559
> IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1747-a95e3e46063ddcea598b2ac865173debffba13fe: 
> a95e3e46063ddcea598b2ac865173debffba13fe
> xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093: 
> 4f95bd933f4dacd22752bf8d6e548e8cc445d093
> 
