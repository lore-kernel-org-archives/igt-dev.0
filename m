Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB394C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 12:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515FA10E1E4;
	Mon, 11 Mar 2024 12:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IESb4yi8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586A510E10A;
 Mon, 11 Mar 2024 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710161909; x=1741697909;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NxS4rloD01wfBWL6pH6aiQ9/7OCr7fWq8BE4aNcUwnY=;
 b=IESb4yi8LpMKK1E20JIXJ6eJK9N0xCueC/KRXcS4dXkltO5DsysbjuGh
 Tad/D0ai1+aUmQWgjCsO370HqAR7Z++xi4VvCfBgF7nHANYDetpYHC7Xz
 4Ofnkoyc68tvyiIiyiHnym3z6D296znhvKTkSApSeHFNSU1m9tuPVW1X9
 XLnhC+bdRMW3JINNLFI3i51lAkzQMwTvvXhrld+nvmQz3PHf70AHoMIRD
 RERNjr22tv/WKl+o6s3sXDtMJyU8EQhei2W10OLvC7NPK4phKd9EATQ6q
 JpMUjrBj7d3peCVDy7ODxHCgal5nfv/A9Bq6lcAQ+mv5pRsbnKMMsrb9U w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15550124"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15550124"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 05:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15653422"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:58:27 -0700
Date: Mon, 11 Mar 2024 13:58:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel-ci/xe: Block pc8-residency tests on XE
Message-ID: <20240311125824.c3h6h4e4r6g22xcz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240311044115.3665980-1-bhanuprakash.modem@intel.com>
 <171013609245.663129.11688182200105500883@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171013609245.663129.11688182200105500883@8e613ede5ea5>
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
On 2024-03-11 at 05:48:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel-ci/xe: Block pc8-residency tests on XE
> URL   : https://patchwork.freedesktop.org/series/130962/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14418 -> IGTPW_10800
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10800 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10800, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10800/index.html
> 
> Participating hosts (31 -> 30)
> ------------------------------
> 
>   Additional (1): bat-dg1-7 
>   Missing    (2): fi-cfl-8109u fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10800:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-1:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14418/bat-arls-1/igt@i915_selftest@live@workarounds.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10800/bat-arls-1/igt@i915_selftest@live@workarounds.html
> 

This is unrelated to change in ci blocklist,

Regards,
Kamil

> 

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7751 -> IGTPW_10800
> 
>   CI-20190529: 20190529
>   CI_DRM_14418: 2c2957bb1a0058ea85ca21d62762aa54e28aff54 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10800: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10800/index.html
>   IGT_7751: 86173d01d4d3644237f781dc5f9890bd26c988de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@kms_big_joiner@2x-modeset
> +igt@kms_big_joiner@basic
> +igt@kms_big_joiner@invalid-modeset
> -igt@kms_big_joiner@basic-bigjoiner
> -igt@kms_big_joiner@basic-force-joiner
> -igt@kms_big_joiner@invalid-modeset-bigjoiner
> -igt@kms_big_joiner@invalid-modeset-force-joiner
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10800/index.html
