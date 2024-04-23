Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EDBC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 19:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D6611363C;
	Tue, 23 Apr 2024 19:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOtzvVgW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF7411363C;
 Tue, 23 Apr 2024 19:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713902075; x=1745438075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l6jMRg5gAWopSpyD0uLZ3yy/neHE4zgG5SOYNHwIM2k=;
 b=IOtzvVgW+pdRfwA7pbSiG/ziUZ5Jo3iM+FrVjjEXbuZZPhBrrvbrKYjW
 AKyzSctsUPOVqtJT/L2fNZ4uuec83DWmu8UlsYotQkOWma+9WqXvX3qFM
 2H9CPCN2iF6B2rYN4iTmOqmThanEmE52sbaTuTjedJbK1Ctlrx0PMg2uM
 Max5zr/TBIthOaAqUdnb03ApAx5LnEDaq7jpiXI3v3Ckk5qY8P99wMeiq
 oX26cHZ4sIm1cnCrSfDc2W3Dn3Q/ASvK8NM/bv4afTsIL5jVwmPlJhx9J
 dotklYF+rmtIbDBwGhEVOjk7SJkKiafPrpPdAP3K1sb0EiVeSWC8jFITn w==;
X-CSE-ConnectionGUID: NqOGZh6fQduxSEeqCOQ7eg==
X-CSE-MsgGUID: ZD551Dv5S0iSxxZfT39EJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27023521"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="27023521"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 12:54:33 -0700
X-CSE-ConnectionGUID: 3sAaB1hmTBeCU5n8JAKZow==
X-CSE-MsgGUID: NtU7S3+4QbCAaVSvjL/cqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="55444634"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:54:32 -0700
Date: Tue, 23 Apr 2024 21:54:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Brian Welty <brian.welty@intel.com>,
	I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests=2Finte?=
 =?utf-8?B?bC94ZV9leGVjX2ZhdWx0X21vZGU6?= Fix misuse of __xe_wait_ufence
Message-ID: <20240423195429.i3hcub7acsrqoln5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Brian Welty <brian.welty@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240419185739.30993-1-brian.welty@intel.com>
 <171355522504.1536675.11655877043475282213@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171355522504.1536675.11655877043475282213@8e613ede5ea5>
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
On 2024-04-19 at 19:33:45 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_fault_mode: Fix misuse of __xe_wait_ufence
> URL   : https://patchwork.freedesktop.org/series/132659/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14616 -> IGTPW_11046
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11046 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11046, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11046/index.html
> 
> Participating hosts (34 -> 39)
> ------------------------------
> 
>   Additional (7): bat-kbl-2 bat-mtlp-6 bat-dg2-8 fi-apl-guc fi-elk-e7500 bat-dg2-11 bat-arls-3 
>   Missing    (2): fi-cfl-8109u fi-bsw-n3050 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11046:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_gttfill@basic:
>     - bat-arls-2:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14616/bat-arls-2/igt@gem_exec_gttfill@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11046/bat-arls-2/igt@gem_exec_gttfill@basic.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-adlm-1:         [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14616/bat-adlm-1/igt@i915_pm_rpm@module-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11046/bat-adlm-1/igt@i915_pm_rpm@module-reload.html
> 

Unrelated to Xe test, no need for respin (already merged).

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11046 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7814 -> IGTPW_11046
> 
>   CI-20190529: 20190529
>   CI_DRM_14616: 53dd7a2909139fb469db4423b79d8a2888a734c2 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11046: 0390be0ee9226e8e53fe6c267e25aea641ec81ff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7814: 7814
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11046/index.html
