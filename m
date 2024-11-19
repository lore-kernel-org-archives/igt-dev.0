Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7903FD4921C
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337AE10E0A5;
	Tue, 19 Nov 2024 05:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGL3s3w2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092BC10E06A;
 Tue, 19 Nov 2024 05:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994321; x=1763530321;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lK7+w5yxdNOrEcMVhmymh9CIJP3d6zWpr7yIQ9cWtEY=;
 b=kGL3s3w2yODAvoZDXUny6JcSkqCMmMapElfJEQM3fkUxOyE7O7B2Az3J
 WlImwabiGKR3kbPRCm5fQApBn3d+sFW0FxEPtFsXbdg9up1zZwDSwoPZ9
 aLVxeY0vl6A2/UFpVJ/88uAlRM1c1SmhaVZGmTFUWiPExSw2R+Qkqtu/9
 J6/ytDt8Z38QaBsp0QfR9k8ploP4zIr83gfPYahANTB9LWM3F8rLc18TD
 cv7wbOrBW5TaGDt8f8/xyOPINMLwgHSjoIvQZClioqM/N5vMAl/yR5gY/
 O73kvdjlQDUOUb7Nw58qCiAGZ90iNgN+yi+VO7LRb4S4saB9MlEpP17v3 g==;
X-CSE-ConnectionGUID: 5hgO1YtzT5OB2RgxN4P9fA==
X-CSE-MsgGUID: svusV68RSayxPPro7/lmNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42493746"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="42493746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:32:00 -0800
X-CSE-ConnectionGUID: W90na2O6SMqiaFXoNG7M7w==
X-CSE-MsgGUID: hbAVoqfvTcW0m54CKIBHlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94500729"
Received: from jjwhelan-mobl3.ger.corp.intel.com (HELO [10.213.197.40])
 ([10.213.197.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:31:59 -0800
Message-ID: <28b2de39-3244-41df-932a-00bd0a06b634@linux.intel.com>
Date: Tue, 19 Nov 2024 06:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_igt-runner_f?=
 =?UTF-8?Q?act_checking_=28rev6=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173196362570.22654.18177883321174735886@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173196362570.22654.18177883321174735886@b555e5b46a47>
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

On 18.11.2024 22:00, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev6)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8115 -> IGTPW_12121
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12121 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12121, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12121/index.html
> 
> Participating hosts (46 -> 45)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12121:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-adls-6:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12121/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>     - bat-rpls-4:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12121/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

These are unrelated to my change.
