Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0F8C3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 07:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB0910E7A7;
	Fri, 23 May 2025 07:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POtNFowQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D0810E766;
 Fri, 23 May 2025 07:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747986832; x=1779522832;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tRpF85Bv6oaOvjYIXInrGbIsZERQFu7mPEMoLsKTEtk=;
 b=POtNFowQ5VMcSVwxoyB7R6mOo/PZff4eBOq0XSZkZKJxIAsSsH2FchxY
 vytcY6S5iERi4ElcKroRjwJA6BXySlR4/3aReZdwmM196dWKobi4oxpSE
 u0JXFg0D3855yw95t9LM8+aVJfWtvyX/M4LfB3qNcq046JUI32ejvqKLC
 eru9W6AldaVf84FNy/klf1UnSccCyKXbo4/l7W7TVX63TD4RI20dS4IGu
 xn57x2ghty0F2S9HzXrCJ6ZM1mwiVDUZb8mC7otoRoHlbHIAUS0jgt+FT
 2KXb5qKgTQD+0yUahKZa69+xIzc585bGZx+e8LLUdfXFQ89KQW3E0f3Sh A==;
X-CSE-ConnectionGUID: 25yQVLdAST6f5uk58hXDcw==
X-CSE-MsgGUID: OttRXOYZTYSuVva2M1Fnkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60291072"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="60291072"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 00:53:52 -0700
X-CSE-ConnectionGUID: 7sTHthsZQreRsJcsEsjwhA==
X-CSE-MsgGUID: 0ToFFVPAR1+4V8+Lv1lhPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141452073"
Received: from mdvorski-mobl1.ccr.corp.intel.com (HELO [10.245.81.194])
 ([10.245.81.194])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 00:53:50 -0700
Message-ID: <8099065e-f9d3-40fb-b46d-5d2174e46930@linux.intel.com>
Date: Fri, 23 May 2025 09:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Replace_i?=
 =?UTF-8?Q?ntel=5Fsysfs=5Fdebugfs_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250522110126.628720-1-peter.senna@linux.intel.com>
 <174793586182.14856.1031754515169725717@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174793586182.14856.1031754515169725717@1538d3639d33>
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

On 5/22/2025 7:44 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: Replace intel_sysfs_debugfs (rev2)
> URL   : https://patchwork.freedesktop.org/series/149023/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8375_full -> IGTPW_13170_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13170_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13170_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13170_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@kms:
>     - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/shard-snb5/igt@gem_eio@kms.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/shard-snb6/igt@gem_eio@kms.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-tglu:         [INCOMPLETE][4] ([i915#4817] / [i915#7443]) -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8375/shard-tglu-5/igt@i915_suspend@basic-s3-without-i915.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13170/shard-tglu-4/igt@i915_suspend@basic-s3-without-i915.html
> 

These are unrelated to my change. Please fix.

Thank you,

Peter
