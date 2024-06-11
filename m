Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3302C27C75
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 15:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C16710E6A5;
	Tue, 11 Jun 2024 15:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDoIZO44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6647410E68E;
 Tue, 11 Jun 2024 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718120274; x=1749656274;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=47hy5qRfSY1DPB8kHk9EmVWsqrdcwETXYRBvTFde6nA=;
 b=fDoIZO444ZaRKEFltoUBWwYN/J2y+vurvb16rSNBk3ulYONE4QokWOY8
 1aM57aW8BhYDD2yDdL9UJDzVUw5MliYsLpECOqNbXSKWQU5OrsgdYp0Xf
 5WHxnBzCyb8IohuadS2Teca6dW7AkqwIFidWLjF7PzSyeGNO1HIWEvrlU
 uQyfxH3Ax5H4JH4Xa9SHy6hdo/DX5MEU8KZJHbmYbgiFjOlkOd1D+s4ry
 L8sln4fMcEJJJBS1Hm+4eCBzs7yajtspzH70cI/Sf3ksNxrpCrOum6i5+
 cjvY+hOOGF1Ggg1J30biNNCW7eknN8LaYTaOw4BmXbIwvrsbpiYZs1rID g==;
X-CSE-ConnectionGUID: tc0SnPL9T4a6f+LxPeo5xw==
X-CSE-MsgGUID: 0yrHLWz6RAmIytiFK4VXoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37359570"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="37359570"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 08:37:53 -0700
X-CSE-ConnectionGUID: grx7SdJiR3eDlaUh+pudNQ==
X-CSE-MsgGUID: qzLFWECgTjiZdhH3MUwtZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44601970"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 08:37:52 -0700
Date: Tue, 11 Jun 2024 17:37:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tools/intel_vbt_decode: Decode almost everything
Message-ID: <20240611153749.66eewqot6675xzww@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
 <171784984158.29417.11756312139976352731@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171784984158.29417.11756312139976352731@a6498e030952>
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
On 2024-06-08 at 12:30:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/intel_vbt_decode: Decode almost everything
> URL   : https://patchwork.freedesktop.org/series/134615/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7880_full -> XEIGTPW_11236_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with XEIGTPW_11236_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11236_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 2)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11236_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][1] ([Intel XE#1201] / [Intel XE#362]) -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11236/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [DMESG-WARN][3] ([Intel XE#1214]) -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-dg2-463/igt@xe_module_load@reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11236/shard-dg2-463/igt@xe_module_load@reload.html
> 

Unrelated to tools change.

Regards,
Kamil

>   

...cut...

> -------------
> 
>   * IGT: IGT_7880 -> IGTPW_11236
>   * Linux: xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c -> xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037
> 
>   IGTPW_11236: 6309c25f8a30cd92824443a9421a3515c6c2d223 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c: cb97aa28be4f4b914c751ed27bae7782e027826c
>   xe-1428-2bea08bd31298d60d416b2a6ed346bb53dd28037: 2bea08bd31298d60d416b2a6ed346bb53dd28037
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11236/index.html
