Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621B0C25B4F
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 16:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E384410F07B;
	Mon,  6 May 2024 16:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHU2Ms/H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F65910F07B;
 Mon,  6 May 2024 16:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715014114; x=1746550114;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KUEFI5qyq3fZ8OfEQwKVBXkQGF7khpdWIoMRjhn7GZ4=;
 b=EHU2Ms/HCuuqwgdfJYG84+6hIDE4dJmLLC3hWXTzMQGQWXvvzYp1oYLV
 msYGKB7GLjj0wsd0HA/L0BuraiUtEM9hX2Bw4Gmix2zTA4I27WePaVb9U
 pVaRgiAPhZaGuZXkQkQyW3UHsFNlQ6LE7xxSTun3eeAqQorzwUKEDCs62
 hrQtWYF/n/ItmywZmaETuBijsh1v5+1iaJIynGJUJQUrT4r0sQRKBknP6
 Y8OyN9u8B26js3OmM5Bh/D8XvbWSkqFAOLvKDS4XVz0H3PKlne8UF0QjQ
 bdXdwhA+g4oKSnArM60/nXVZ6dIYdoUlfu8OPJ1SjyuQZbFrbl34fZmdP w==;
X-CSE-ConnectionGUID: mGeqdR2nTTG5W39AGOEDug==
X-CSE-MsgGUID: afFylvdtSp6fDCrXCNwVCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10932501"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10932501"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 09:48:33 -0700
X-CSE-ConnectionGUID: bT7LmhwvRwyu59bKHzzmkQ==
X-CSE-MsgGUID: ztEK2aPBT+OBGq/lAqWBCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="59081731"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 09:48:32 -0700
Date: Mon, 6 May 2024 18:48:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib=2Fintel=5Fc?=
 =?utf-8?B?dHg6?= Propagate error from __intel_ctx_xe_exec wait timeout
Message-ID: <20240506164828.drc2xe47kdtygk6w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
References: <20240506120827.5799-1-maarten.lankhorst@linux.intel.com>
 <171500039508.1939724.10998745899604035504@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171500039508.1939724.10998745899604035504@8e613ede5ea5>
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
On 2024-05-06 at 12:59:55 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_ctx: Propagate error from __intel_ctx_xe_exec wait timeout
> URL   : https://patchwork.freedesktop.org/series/133230/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7833_BAT -> XEIGTPW_11102_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11102_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11102_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (5 -> 0)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11102_BAT prevented too many machines from booting.
> 
>   Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 

Looks like some other problem, not a simple fix in one lib.

> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7833 -> IGTPW_11102
>   * Linux: xe-1238-ca96a1c62451ea534391d1eafe3a0b5691658c02 -> xe-1239-5a43da669cdb9b8df66e32a661b09cd9c52e35f2

Why is both igt and Xe driver changing?
imho it should be one or the other, not both.

Adding Ewelina to Cc.

Regards,
Kamil

> 
>   IGTPW_11102: 11102
>   IGT_7833: 6f89cac1b180e7cd7cbac535e65843595b2bb5bd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1238-ca96a1c62451ea534391d1eafe3a0b5691658c02: ca96a1c62451ea534391d1eafe3a0b5691658c02
>   xe-1239-5a43da669cdb9b8df66e32a661b09cd9c52e35f2: 5a43da669cdb9b8df66e32a661b09cd9c52e35f2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11102/index.html
