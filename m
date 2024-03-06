Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1053C54E49
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 09:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF5510E3C0;
	Wed,  6 Mar 2024 09:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqSZyWKG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2316A10E3C0;
 Wed,  6 Mar 2024 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709717676; x=1741253676;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+AjSDuibOwOB2+tJCGQ6ypF1q34HkD/ot17jLGXrQMM=;
 b=mqSZyWKG5FiOugx+DApCMIbf8C5ToVmn+6iozHLV7RJUCxmrm5AbHexz
 9xHMlB2lrYGJYih9HzyxQOh+xRD97z5oOtY2vsboYmNQ5o+BQ+ePv5rZK
 18AmMRtwbLTQ78XE3ZPcGWUGw98VljZ8boka5pdUQ4PlOPZ6wtrUwQHRm
 b42XuYBF1bh/ZyA/SlFwauwfQnfKLgiUP3d7bXRQohpR9yu3E4xhUHOC3
 hTXcarJa2BZEfan+RTLPiHTZNp64EUU694lfyDPHw2aJEgJENe1WEfRl1
 2B4ezvpbQsv0kScXrliwBJumDngJ080OmAoSCfaCtfbRpZEB4rUwcVLsS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4183251"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4183251"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 01:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9673068"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 01:34:33 -0800
Date: Wed, 6 Mar 2024 10:34:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 amdgpu/tests: Fix vce enc test failure
Message-ID: <20240306093430.dno5hpfhf5kmuatf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240304211632.184249-1-vitaly.prosyak@amd.com>
 <170959150068.503981.12867655979269711715@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170959150068.503981.12867655979269711715@8e613ede5ea5>
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
On 2024-03-04 at 22:31:40 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: amdgpu/tests: Fix vce enc test failure
> URL   : https://patchwork.freedesktop.org/series/130694/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14382 -> IGTPW_10774
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10774 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10774, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10774/index.html
> 
> Participating hosts (41 -> 39)
> ------------------------------
> 
>   Additional (1): bat-kbl-2 
>   Missing    (3): fi-cfl-8109u fi-snb-2520m bat-arls-3 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10774:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-dg2-8:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/bat-dg2-8/igt@i915_selftest@live@workarounds.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10774/bat-dg2-8/igt@i915_selftest@live@workarounds.html
> 
>   * igt@runner@aborted:
>     - bat-arls-2:         NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10774/bat-arls-2/igt@runner@aborted.html
> 

These are unrelated to amdgpu, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10774 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][4] ([i915#9318])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10774/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7745 -> IGTPW_10774
> 
>   CI-20190529: 20190529
>   CI_DRM_14382: e8bc216572501440efb20e112bb5aa60599f1863 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10774: 10774
>   IGT_7745: 838ad56bf511c1caf56851c661fb5828c0440e3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10774/index.html
