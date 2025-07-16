Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F6CC83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 20:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A73B10E3BD;
	Wed, 16 Jul 2025 20:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNVRKbzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB6410E3BD;
 Wed, 16 Jul 2025 20:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752697288; x=1784233288;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Iz3/raAYqQ2B1jSqNM667uctA7lkHqVUlqIoqhFFmnY=;
 b=MNVRKbzzuIZ0+QhBsyy07tHI1ubAYrtPaAM0OMSARA1o78ICz4R3HuUN
 NyGEzKYBUDK7h5poKOOuKoV+bfE9hVOkThhtrkhKh6EYxqizXhqT42Kp3
 snDyS0Rvhts0q7fQHT5PXAimog14njya4cH8Y5hyf8aK7rV1T7MuwhsQS
 GSS7w3gxr6ZhnxT+bQ7T9i1mZVp2HrLydd2P7yKDeFbmrWdL9OOIJ+V/m
 O4PlJQMNV2wRi9pWgqMK6Eiv9cXA3AVBMIXCtBk2HbIz+2MhHEbNzyPFi
 dyqm3NpgK24LnNulmZTcvakIGCqoi5DCPE+qeIROZZOLnpQ/Wtv3yPE32 w==;
X-CSE-ConnectionGUID: 9lskOXxjSv2n4rbnoNSy+A==
X-CSE-MsgGUID: iwylV79HThK5ZTPCSlYcyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54896610"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="54896610"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:21:27 -0700
X-CSE-ConnectionGUID: BBN/A2RoQS+wgSjHYvEJgw==
X-CSE-MsgGUID: EztpR2qCQqOcFesWeJERKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="157006887"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:21:26 -0700
Message-ID: <feb1eb77-3426-4773-b5e6-a775f6d8c04d@linux.intel.com>
Date: Wed, 16 Jul 2025 22:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_post-?=
 =?UTF-8?Q?kmod-unbind_igt=5Fhook?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250715133722.32559-1-peter.senna@linux.intel.com>
 <175268461541.167482.17950571243637892673@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <175268461541.167482.17950571243637892673@1538d3639d33>
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

Dear i915,

On 7/16/2025 6:50 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: Add post-kmod-unbind igt_hook
> URL   : https://patchwork.freedesktop.org/series/151642/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8460_full -> IGTPW_13474_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13474_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13474_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13474/index.html
> 
> Participating hosts (12 -> 11)
> ------------------------------
> 
>   Missing    (1): shard-glk10 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13474_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@plain-flip-fb-recreate:
>     - shard-rkl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8460/shard-rkl-8/igt@kms_flip@plain-flip-fb-recreate.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13474/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
>     - shard-rkl:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13474/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html
> 

Unralted, please fix and rerun.

Thank you!
