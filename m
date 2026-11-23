Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F2A606A31F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ef1cdrLz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB9E10EBB8;
	Mon, 23 Nov 2026 10:20:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D0E10EBB8;
 Mon, 23 Nov 2026 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795429178; x=1826965178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=22BRmkEB1u0hWkGJWCBhqyDi9C19lA7CfLKcM5I3P5o=;
 b=ef1cdrLzRd6TBz2otvjCjAe+GZ4nEW4bnn2fA/dEodjAgmD+FJlFEW/Z
 +i4SU5tWZ106U80W6MFhALlzHAy9gJXQOuxB87Ld5cLo+gPZUjKlDusNM
 5lDHWQN26L4Qux15isoGlH34Ai3bzL8tnB5MtbL8xUhq2IVR7Rz+nPCOP
 jQTzsI+zLDiszhK3IPjFmitVRpxtVSzlb0jsbFF1fhDrzD1IkEw9e9whL
 1XoFttWk9WnYadTV7BULCTFFzYJvyuA00v/8KxgAnx94h8Ldszq9W7uOQ
 kBkUM2uQELFq/OKB+k6n4bym05nvctjkultRouUGeidGKQrf3dsqW+6O1 Q==;
X-CSE-ConnectionGUID: VsKYgiXlQem2gyakr0En4g==
X-CSE-MsgGUID: Jkw2OJJXSl2rjFqF14XdUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4068471"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4068471"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:19:38 -0800
X-CSE-ConnectionGUID: zou6qHyeSGWvLTlh4/c53Q==
X-CSE-MsgGUID: Q6iGl93WQoajgUDFPdIGYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11818090"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:19:37 -0800
Date: Mon, 23 Nov 2026 11:19:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZv?= =?utf-8?Q?r?=
 tests/core_sysfs: Fix logic for EIO and other fixes (rev2)
Message-ID: <kcfpc5mvavzztn33cfsnkorbx2d47fygpecnbqbezykbrar23d@xo33rkyxezix>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
 <179521369144.62454.11808615798138294727@9ac1b63fe3ea>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179521369144.62454.11808615798138294727@9ac1b63fe3ea>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi igt-dev,
On 2026-11-20 at 22:28:11 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_sysfs: Fix logic for EIO and other fixes (rev2)
> URL   : https://patchwork.freedesktop.org/series/179132/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9201 -> IGTPW_16193
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_16193 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_16193, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16193/index.html
> 
> Participating hosts (40 -> 39)
> ------------------------------
> 
>   Missing    (1): bat-dg2-13 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_16193:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - fi-cfl-guc:         [PASS][1] -> [SKIP][2] +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9201/fi-cfl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16193/fi-cfl-guc/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - fi-cfl-guc:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9201/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16193/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html
> 

Unrelated, no need to run full as this change was tested in BAT.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_16193 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@vgem_basic@unload:
>     - bat-rpls-4:         [PASS][5] -> [DMESG-WARN][6] ([i915#13400])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9201/bat-rpls-4/igt@vgem_basic@unload.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16193/bat-rpls-4/igt@vgem_basic@unload.html
> 
>   
> #### possible fixes ####
> 
>   * igt@i915_selftest@live:
>     - bat-arlh-3:         [incomplete][7] ([i915#16547]) -> [pass][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/igt_9201/bat-arlh-3/igt@i915_selftest@live.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/igtpw_16193/bat-arlh-3/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@active:
>     - bat-arlh-3:         [incomplete][9] -> [pass][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/igt_9201/bat-arlh-3/igt@i915_selftest@live@active.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/igtpw_16193/bat-arlh-3/igt@i915_selftest@live@active.html
> 
>   
>   [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
>   [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547
> 
> 
> build changes
> -------------
> 
>   * ci: ci-20190529 -> none
>   * igt: igt_9201 -> igtpw_16193
>   * linux: ci_drm_19574 -> ci_drm_19575
> 
>   ci-20190529: 20190529
>   ci_drm_19574: 90b50d97b3af2f55a75116f1ec76e0cf62914418 @ git://anongit.freedesktop.org/gfx-ci/linux
>   ci_drm_19575: d706b8b5a4276d637251224ed2d5ff30a982fa0a @ git://anongit.freedesktop.org/gfx-ci/linux
>   igtpw_16193: 16193
>   igt_9201: 9201
> 
> == logs ==
> 
> for more details see: https://intel-gfx-ci.01.org/tree/drm-tip/igtpw_16193/index.html
