Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D0AF9EDC0
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 12:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D11F10E0B5;
	Wed, 22 Apr 2026 12:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XopJNVgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098D410E2A4;
 Wed, 22 Apr 2026 12:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776860637; x=1808396637;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P5bCyi9+mSTKb2dIOoTifJPVeP5BHVa4aw8HIYWP+5Y=;
 b=XopJNVgxdCbxs1zHkd8fXjrjsONh4BaqZ4AeB/4TMOe2/KYqJP1o1KZH
 uglmkvrdBQIkDuG9KyO4/1kQZseL5WRPsNpJqNCKq/IlR7jDTpV0jo820
 Xcac2s6Yn4mFjpGf+FoxD9VRz8G7T4aRM4bf57EtdHK6MGm78ku2mayia
 I0PaDclyVKv9kBJhNNbltg7eBSaGOQvcXtGBDW/zy+VTRQKHQWGaSMI4/
 BDz7YtknBCpSX2DWEKyqYEerjO+DwUVL+Apj2D/MMw7FMX1ZKOpVmGati
 7mOk66ZE8RDNnfJ8BdUXY7Ejzi94Dy6SSnGnawZ0ufyjXygqqbwdbohMu A==;
X-CSE-ConnectionGUID: /RwXXlyLQQKUyTc1hhI6Vw==
X-CSE-MsgGUID: HTc2v0nvRYePXzMqoEDyig==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77723554"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="77723554"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 05:23:57 -0700
X-CSE-ConnectionGUID: zeoail7jRu+fpPwFbVuXzw==
X-CSE-MsgGUID: /IzX4mdPTgy6zgQ0EJMtFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="228004752"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 05:23:55 -0700
Date: Wed, 22 Apr 2026 14:23:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 Various fixes for prime_udl test (rev2)
Message-ID: <20260422122340.jlcpvt3vhy5mawse@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
 <177683426183.484499.3918565275009553850@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177683426183.484499.3918565275009553850@a3b018990fe9>
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
On 2026-04-22 at 05:04:21 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Various fixes for prime_udl test (rev2)
> URL   : https://patchwork.freedesktop.org/series/159052/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8865_FULL -> XEIGTPW_15028_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15028_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15028_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15028_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][1] +3 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15028/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 

Unrelated.

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15028_FULL that come from known issues:
> 
...cut...
