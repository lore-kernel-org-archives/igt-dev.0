Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766A4C54E60
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 12:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63EE112A48;
	Mon, 11 Mar 2024 12:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgGjaiTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F43D112A41;
 Mon, 11 Mar 2024 12:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710161451; x=1741697451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nru1RO4QLVFq5rmZ0x6m+IWRM8KBbkeRKfuqDL+fc80=;
 b=IgGjaiTOPNWA7wRBe0SB1J4yjWVz+ojQjNC2ObrZ9sqdb31bFoPw0vru
 XeWGLTU0UW7d/0AK+00Sd7UZj/tLZ0cn0U9nJrkmvnk5oIktxE71LVuD0
 E7uxPUmDGPKZ2dHCBy+4d9YDnrGKMxmWogIhzP8D0wcs4rPBAkB6FB7G5
 vDKghcuLSnU+34GmgmkO1VDOv1IBoZ+cMRZgNTmqUa+U8wrKQOt04zMKB
 xFF2Z6YOPsrDN4DPsCTL7iBtSQ2qL5jpXUafcemNdwaDKV62f0UPRgPMZ
 V1PfVi57BOJ2gcPzm1FxgH48BIZzEKrCg0CKJblFe7FP6xByOPLlOkj1i Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15382283"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15382283"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 05:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11594603"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:50:50 -0700
Date: Mon, 11 Mar 2024 13:50:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for Fix
 scripts/xls_to_doc.py
Message-ID: <20240311125046.7ayufj5afns5dhwf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
 <170989963405.612184.446976450908056040@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170989963405.612184.446976450908056040@8e613ede5ea5>
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
On 2024-03-08 at 12:07:14 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix scripts/xls_to_doc.py
> URL   : https://patchwork.freedesktop.org/series/130909/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14413 -> IGTPW_10796
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10796 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10796, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10796/index.html
> 
> Participating hosts (38 -> 40)
> ------------------------------
> 
>   Additional (3): bat-dg1-7 bat-kbl-2 bat-mtlp-8 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10796:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14413/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10796/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@i915_selftest@live@active:
>     - bat-atsm-1:         [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14413/bat-atsm-1/igt@i915_selftest@live@active.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10796/bat-atsm-1/igt@i915_selftest@live@active.html
> 
>   * igt@i915_selftest@live@guc:
>     - bat-arls-3:         NOTRUN -> [DMESG-WARN][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10796/bat-arls-3/igt@i915_selftest@live@guc.html
> 

These are unrelated to scripts change,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10796 that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7749 -> IGTPW_10796
> 
>   CI-20190529: 20190529
>   CI_DRM_14413: 024301d28b0b2cf492ffdb3ce688044cd9923f38 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10796: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10796/index.html
>   IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10796/index.html
