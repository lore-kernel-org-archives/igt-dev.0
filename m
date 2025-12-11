Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE975D41D5A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 15:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EB810E2D1;
	Thu, 11 Dec 2025 15:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFmWbemu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F4110E2D1
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765467959; x=1797003959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PzNtMa0DCphoVsqlNe2R8z14YLLCqJZBqy2OaCpNYUY=;
 b=fFmWbemuFXKc1X2zIfoc8Tk6RGfK3eYEYItsJrzS4aVjdN+R0Rtc11p8
 HQwChLRBNJYlZ1x91J4SEalk2rh4/OV4v9lOCSvgAM3trmkCqHjcsVvQR
 Z9JPSalzL1kCXXI3o4r3SlIkCY04GUGhZmLdGm9NnceWHxP2dglDjGgDO
 TOR+W4ct7R/Jv8SZ7HeYIum7ubOYjVR23ovs+tQyWeS50fCaTTeRPU0CR
 U1Fz10YftioFMUrtOl5g/UeSlqx7Yh046Oa1zphTOE709M94qmOsZeRpo
 lGrzzutjFqIYOK7UfRaOgkrP3mZVR0nFZ7fOL14GUcKIttctktDuLY9/1 Q==;
X-CSE-ConnectionGUID: 1CHxUv5hQ2KdyfdnzbjAKA==
X-CSE-MsgGUID: wENpiRn4SySwv4VhEyZGLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="90101017"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="90101017"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 07:45:59 -0800
X-CSE-ConnectionGUID: zuVFuKOqRLGkRoZPB6KdyA==
X-CSE-MsgGUID: bR6VH4knR0K2WiNDXue6Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196730039"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 07:45:58 -0800
Date: Thu, 11 Dec 2025 16:45:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 1/1] docs: fix intel-specific descriptions
Message-ID: <20251211154538.r73hz4egltobv3zm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251211151903.323890-1-pawel.sikora@intel.com>
 <20251211151903.323890-2-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211151903.323890-2-pawel.sikora@intel.com>
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

Hi Pawel,
On 2025-12-11 at 16:19:02 +0100, Pawel Sikora wrote:
> While it is true that the main focus of IGT was on Intel GPUs,
> this is no longer the case and the documentation should reflect
> this change and present the current state where no specific
> platform is the center of interest.
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> ---
>  docs/faq.md       | 14 ++++++++++----
>  docs/platforms.md | 20 ++++++++++++--------
>  2 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/faq.md b/docs/faq.md
> index 48e754c56..239d57012 100644
> --- a/docs/faq.md
> +++ b/docs/faq.md
> @@ -6,8 +6,9 @@ This FAQ covers common questions about using, building, and contributing to
>  ### What is IGT GPU Tools?
>  
>  IGT GPU Tools is a collection of low-level tests and utilities used to validate and
> -debug Linux DRM (Direct Rendering Manager) graphics drivers. It focuses primarily on
> -Intel GPUs but supports other platforms in varying degrees.
> +debug Linux DRM (Direct Rendering Manager) graphics drivers. It focuses primarily
> +on display testing. It supports GPU-specific testing for Intel and AMD.
> +Other platforms are supported in varying degrees.
>  
>  ### How do I build IGT?
>  
> @@ -52,11 +53,16 @@ or decode state.
>  
>  ### What platforms are supported?
>  
> -IGT primarily targets Intel GPUs (Gen9+), but partial support exists for:
> +IGT primarily targets platforms:/
>  

As you removed Intel from above line, imho please add it here:

 - Intel (i915 and xe)

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  - AMD (amdgpu)
>  - NVIDIA (nouveau)
> -- Virtual GPUs (e.g., virtio-gpu in QEMU/KVM/AVD)
> +- Broadcom (v3d and vc4)
> +- Qualcomm (msm)
> +- Arm (Panfrost)
> +- Panthor
> +- Virtual GPUs (e.g., virtio_gpu in QEMU/KVM/AVD or vmwgfx)
> +- Virtual display (vkms)
>  
>  Hardware coverage may vary by test.
>  
> diff --git a/docs/platforms.md b/docs/platforms.md
> index e6882feec..b788a92c1 100644
> --- a/docs/platforms.md
> +++ b/docs/platforms.md
> @@ -2,9 +2,9 @@
>  
>  ## :material-chip: Hardware
>  
> -**IGT GPU Tools** is designed to validate few DRM drivers across a variety of Intel
> -and non-Intel platforms. While virtual environments help with development, real hardware
> -is recommended for full test coverage, performance metrics, and regression tracking.
> +**IGT GPU Tools** is designed to validate few DRM drivers across a variety of platforms.
> +While virtual environments help with development, real hardware is recommended for full
> +test coverage, performance metrics, and regression tracking.
>  
>  ### :material-lightbulb-outline: General Guidelines
>  
> @@ -27,12 +27,16 @@ testing but may not support new test features.*
>  
>  ### Non-Intel GPU Support
>  
> -Although IGT is Intel-focused, basic support exists for other platforms:
> +Basic support exists for other platforms:
>  
> -- **AMD (AMDGPU):** Some display and KMS tests run; feature support may vary.
> -- **NVIDIA (nouveau):** Partial functionality; manual testing encouraged.
> -- **VirtIO-GPU / QEMU / GVT-g:** Useful for automation and limited pipeline testing.
> -- **ARM SoCs (e.g., Mali, Vivante):** Experimental – not all tests apply.
> +- AMD (amdgpu)
> +- NVIDIA (nouveau)
> +- Broadcom (v3d and vc4)
> +- Qualcomm (msm)
> +- Arm (Panfrost)
> +- Panthor
> +- Virtual GPUs (e.g., virtio_gpu in QEMU/KVM/AVD or vmwgfx)
> +- Virtual display (vkms)
>  
>  :material-account-group-outline: Community contributions are welcome to expand non-Intel
>  support!
> -- 
> 2.51.0
> 
