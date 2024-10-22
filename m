Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A54D1CDC5
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 09:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEDE10E632;
	Tue, 22 Oct 2024 09:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amxOCi66";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F3910E305;
 Tue, 22 Oct 2024 09:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729588768; x=1761124768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3/QnrNlWu/A6oqXvQrQljmsn0nu3CU3TQ3H6JOUKpQU=;
 b=amxOCi66ujaeVmMALrsSUUD4HRjRen2Uxet0Rth2CXsFLP4BLePEzZNZ
 u3CNcyWJLyiUR1A5kSAg2JqL4Qhl9+YJfVyTIT3yid+6EhYxdRRRkmNVV
 JmY3HGwmgAR3c5e8zatRYzzPSHr+KnN/AResDsIseiQV078TdbFIeEEkJ
 Ejse6c2tKcmLK8BoKRV4qcjQbCRAbdcWsybJA8RMk96o4HelCZxaug1po
 eL2OUt4ezb0eH3MXM1mkNCiiMFFpUFkLdtHRE/z7aphtFZxudzxI8bdGp
 X1XA0BIQpvm4X0HXyvOeKtoMZ7tWPVN62txaygxhpV6dj4JMCRYH7vPY5 w==;
X-CSE-ConnectionGUID: 7xCHoU82QPSGTvgJxZoUbg==
X-CSE-MsgGUID: QKIzLrXEQHCawe/HnkzpIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="33037809"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="33037809"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 02:19:28 -0700
X-CSE-ConnectionGUID: Hp2AQPrsRR6m4CghYO7ivw==
X-CSE-MsgGUID: nbQqYHVgS56TXcX1JCZo0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="117232284"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 02:19:27 -0700
Date: Tue, 22 Oct 2024 11:19:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 lib/xe/oa: Don't skip if freq sysfs are not present (rev2)
Message-ID: <20241022091908.kblndshqxdpq3pqp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241021214225.1101453-1-ashutosh.dixit@intel.com>
 <172957405955.1308045.7693517488286049341@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172957405955.1308045.7693517488286049341@2413ebb6fbb6>
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
On 2024-10-22 at 05:14:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/oa: Don't skip if freq sysfs are not present (rev2)
> URL   : https://patchwork.freedesktop.org/series/140269/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15574_full -> IGTPW_11947_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11947_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11947_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11947/index.html
> 
> Participating hosts (8 -> 7)
> ------------------------------
> 
>   Missing    (1): shard-glk 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11947_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@parallel-random:
>     - shard-dg2:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15574/shard-dg2-10/igt@gem_lmem_swapping@parallel-random.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11947/shard-dg2-2/igt@gem_lmem_swapping@parallel-random.html
> 

This is unrelated to xe test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11947_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:

...cut...

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11947/index.html
