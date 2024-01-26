Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A7FC47422
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jan 2024 10:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE9310EF76;
	Fri, 26 Jan 2024 10:06:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A0810EAE8;
 Fri, 26 Jan 2024 10:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706263609; x=1737799609;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P8JcpyoVVo1GVTTbcI7kIKoectS+ZFO31ZeEonSLLRQ=;
 b=TdjJVtjuOPctv3x4JI/2EtRH8LhRkE2UkPJG44sxT0cuRMn4al2YsILl
 m7RAoTHtOZo73ZEUghcU5BqcMXJM4kXx4OEyNes+lUvrkZKr2ceOtpD+2
 33j90hKf4+kvUOFILFp5z/OqeIOY5XtViIGBk7xJO/0XCoJMKmjvapT3I
 sAYNROuZOQDFU5lEp4Pp6qHtLMubZ8QBFe0wo5ULfspkYjWqG9W8ITLwd
 8sqBT8wPoxhov6S4IZv8gQRuLqY3Lp+fI/XlJ5egHokHHue7F63uaYXl6
 HerC2b+PpTPnHtnuwLinqfqF7twsp63rmUk/YVM9SzHZtNMUeEKEG0BN3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9094196"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9094196"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 02:06:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2551208"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 02:06:47 -0800
Date: Fri, 26 Jan 2024 11:06:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_start?=
 =?utf-8?Q?ing_wit?= =?utf-8?Q?h?= [i-g-t,v2,1/7] lib/xe/ioctl: introduce
 xe_bb_size() helper
Message-ID: <20240126100644.s553ogfd6goj3ro4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240125105646.313561-1-matthew.auld@intel.com>
 <170618299370.710554.6014321552285966973@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170618299370.710554.6014321552285966973@5338d5abeb45>
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
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-25 at 11:43:13 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,v2,1/7] lib/xe/ioctl: introduce xe_bb_size() helper
> URL   : https://patchwork.freedesktop.org/series/129158/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7692 -> IGTPW_10588
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10588 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10588, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html
> 
> Participating hosts (37 -> 35)
> ------------------------------
> 
>   Missing    (2): bat-rpls-2 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10588:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
>     - bat-dg2-8:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
> 

Unrelated to change in Xe libs/tests

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10588 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [PASS][3] -> [ABORT][4] ([i915#7911])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-skl-guc:         [PASS][5] -> [DMESG-FAIL][6] ([i915#10112])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7692/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10112]: https://gitlab.freedesktop.org/drm/intel/issues/10112
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7692 -> IGTPW_10588
> 
>   CI-20190529: 20190529
>   CI_DRM_14178: cad255f28ccca6529104b9497a8d7302ae7eb88a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10588: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html
>   IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10588/index.html
