Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176B5C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 12:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D6B112A3D;
	Mon, 11 Mar 2024 12:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0FltDy+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1FE11256D;
 Mon, 11 Mar 2024 12:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710161354; x=1741697354;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZLnghKENTLrdFeuiZovtxhH5fTp4UThN2zDCmdVA9hw=;
 b=Z0FltDy+sV4ci1Ece7N6wQBSxfF5UrUJiiM5buyWXJ0JZjhm2v1mLHPK
 XMSIxsTBKrIXy0rh9Fhuk15GDl4lCEKdQO7XQk5djTPeGb6ieYs54bbyo
 /zS8Is/IDx1i4An83HEstCcckG9dZNbeBEsSeOsa3Yz1T2XEADKXM8go/
 qYVAU6dOkKfkT4+8ME/nc8Oot/bC+gY38Vq5xiEkD14SfXW7WgJ7lvTZ7
 HrE9MfQ+K7MRyBrKNgs9F4kyFYZu3+wT72jJvjf7e3bw4fU4syaTFvCyh
 cbm8rmmiBWAQjt+yK4YJ249mX+9M/zowmb7n+dwRA0VXkbXt4NWiHYzyl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15382139"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15382139"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 05:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11593997"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:49:12 -0700
Date: Mon, 11 Mar 2024 13:49:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/igt_kmod: Allow to load kunit from alias (rev5)
Message-ID: <20240311124909.mocos2rlwwikrdkq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240308193149.2220807-1-lucas.demarchi@intel.com>
 <170992951669.629227.11497147097957472341@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170992951669.629227.11497147097957472341@8e613ede5ea5>
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
On 2024-03-08 at 20:25:16 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kmod: Allow to load kunit from alias (rev5)
> URL   : https://patchwork.freedesktop.org/series/130282/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14416 -> IGTPW_10797
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10797 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10797, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10797/index.html
> 
> Participating hosts (39 -> 35)
> ------------------------------
> 
>   Additional (1): bat-dg1-7 
>   Missing    (5): bat-kbl-2 fi-apl-guc fi-snb-2520m fi-glk-j4005 bat-jsl-1 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10797:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@vma:
>     - bat-dg2-9:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10797/bat-dg2-9/igt@i915_selftest@live@vma.html
> 

This is unrelated,

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-2:
>     - {bat-rpls-3}:       [PASS][2] -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14416/bat-rpls-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-2.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10797/bat-rpls-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-2.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10797 that come from known issues:
> 
> ### IGT changes ###
> 
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7751 -> IGTPW_10797
> 
>   CI-20190529: 20190529
>   CI_DRM_14416: 3fde6df89bac97416ce1c82b14237a1a67ce3285 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10797: 10797
>   IGT_7751: 86173d01d4d3644237f781dc5f9890bd26c988de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10797/index.html
