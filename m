Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA96DD44D54
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 12:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E3D10E1D8;
	Wed,  6 Nov 2024 12:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/6pX6j0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7FC10E1D8;
 Wed,  6 Nov 2024 12:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730897858; x=1762433858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Nzgy6VWWrfwQOr//HILUt1pIBP+YaIcOYswWfTxqS1w=;
 b=B/6pX6j0jJcO1Uq5IbdCrKhuV2JpGEV2aQhOUO3ahAJMi97mpRA46bqV
 TwVEqqn7AdM7nj/kgpUWN6yS3ILpjWQbL3c7hs3lgkGTeJR6Fb4QZehvm
 Uar71vTkoFuBkJOCj1KLaEAEEyUOsk014DOGgC8ZhU2WwQQIVvGge4UnJ
 0QphuhFNcufnqucLoFnao1zbWf1T9YxXcU9aZl051PAqgF7zqfezYwtB3
 TBtGvbfogdz7Q7BYfwDEe4Q+Qj6V9P5+d3mOi+BOM2R2iqXrHehu1oa6y
 gK0dTttNmxvGWKJ5AzwrawfOjx+/ByMPMeNNPzt5w3G/yFJF5Sdiv+Wkv A==;
X-CSE-ConnectionGUID: MS5UNd+jSfOYjoqvhchUgA==
X-CSE-MsgGUID: uyAEgWxlQwOe3HGi52DbhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30121019"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30121019"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 04:57:38 -0800
X-CSE-ConnectionGUID: IANOhEL9T8addhV4p/fqgw==
X-CSE-MsgGUID: hU0yc51XSviaQZzsxpbvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84071450"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 04:57:36 -0800
Date: Wed, 6 Nov 2024 13:57:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 test/intel/xe_sysfs: Restore sysfs params correctly (rev3)
Message-ID: <20241106125734.xeqylrf6fc6xvny6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241105201143.159491-1-jonathan.cavitt@intel.com>
 <173084262669.1414276.936554079963907729@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173084262669.1414276.936554079963907729@2413ebb6fbb6>
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
On 2024-11-05 at 21:37:06 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: test/intel/xe_sysfs: Restore sysfs params correctly (rev3)
> URL   : https://patchwork.freedesktop.org/series/140780/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8098 -> IGTPW_12041
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12041 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12041, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12041/index.html
> 
> Participating hosts (46 -> 44)
> ------------------------------
> 
>   Missing    (2): bat-arls-1 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12041:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_fence@basic-await@bcs0:
>     - bat-arlh-3:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-arlh-3/igt@gem_exec_fence@basic-await@bcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12041/bat-arlh-3/igt@gem_exec_fence@basic-await@bcs0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12041 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_fence@basic-await:
>     - bat-arlh-3:         [PASS][3] -> [FAIL][4] ([i915#12660])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-arlh-3/igt@gem_exec_fence@basic-await.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12041/bat-arlh-3/igt@gem_exec_fence@basic-await.html
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-6:         [PASS][5] -> [DMESG-WARN][6] ([i915#12133])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-6/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12041/bat-mtlp-6/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-mtlp-6:         [PASS][7] -> [DMESG-WARN][8] ([i915#11349] / [i915#12133])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-6/igt@i915_selftest@live@hangcheck.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12041/bat-mtlp-6/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - bat-dg2-13:         [PASS][9] -> [DMESG-WARN][10] ([i915#12253])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12041/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
> 

Unrelated to xe test change.

Regards,
Kamil

>   
> #### Possible fixes ####
> 
>   * igt@debugfs_test@sysfs:
>     - {bat-mtlp-9}:       [ABORT][11] -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-9/igt@debugfs_test@sysfs.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12041/bat-mtlp-9/igt@debugfs_test@sysfs.html
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [DMESG-WARN][13] ([i915#12133]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-8/igt@i915_selftest@live.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12041/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-mtlp-8:         [DMESG-WARN][15] ([i915#11349] / [i915#12133]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8098/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12041/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
>   [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
>   [i915#12660]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12660
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8098 -> IGTPW_12041
>   * Linux: CI_DRM_15636 -> CI_DRM_15637
> 
>   CI-20190529: 20190529
>   CI_DRM_15636: b925cb281e79b763990ed64267ef82a87ace5060 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15637: 1051f5a468c5531923b01ba67999e502ce47a6b0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12041: 12041
>   IGT_8098: 8098
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12041/index.html
