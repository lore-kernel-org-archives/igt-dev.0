Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC64C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 10:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C23210E267;
	Wed, 19 Feb 2025 10:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjynGpY7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFE910E267
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739961715; x=1771497715;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xk/Eowx4xU9DH+LiErwbXJlviyuceAI4kRvdm7/YHZY=;
 b=VjynGpY7V8mjU7Rx5Md37zdhd5dH2XkgMAFr4SYJJ/8MBwcFk2HTo0Bh
 /mNGpFx0diy2i8j0N8mH1SKh8JXFB0syeM7ULozRAywetSOsGXo7KlFuY
 ZSeFqzg3kaqNEKrhAqnW1cZ/FcSbtF5Bd1J3RYQeIKSBHDGGsJVrJzdoA
 5J8EcR0QUnr7ge+AQeeGpp4oegi3SVUBFMlWM3S5anAZD6IdiXo7dd4n5
 FiX6Eb+96nTgWOk2WzamBFgKnTbdogA7Nh4IlwADL4RiA7E5ddK7pPYO9
 7hlYOTWzXXwnrIbK/2z/1PRAl0PKMhRzJ71k+Ei7lxjrJJYXRKStPKmSR A==;
X-CSE-ConnectionGUID: FBLAKq1GRK2jM+/fb46z2g==
X-CSE-MsgGUID: DFBNROhaQ36GkT/Inl0cRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44607424"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="44607424"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:41:54 -0800
X-CSE-ConnectionGUID: Qg10PZhkQjmuvidAU8AaVw==
X-CSE-MsgGUID: IasdX+kKRlGaezYSObqmRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119616501"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 02:41:52 -0800
Date: Wed, 19 Feb 2025 11:41:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] lib/amd: add memleak functions
Message-ID: <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250218114341.122653-1-vitaly.prosyak@amd.com>
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

Hi Vitaly,
On 2025-02-18 at 06:43:41 -0500, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> refactor memory leak functions and add
> them to the library for reuse across different tests.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alexander Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_mem_leak.c   | 112 ++++++++++++++++++++++++++++++++++++
>  lib/amdgpu/amd_mem_leak.h   |  17 ++++++
>  lib/meson.build             |   1 +
>  tests/amdgpu/amd_mem_leak.c |  88 ++--------------------------
>
[...cut...]

Why moving to library when there is only one user?

Regards,
Kamil

