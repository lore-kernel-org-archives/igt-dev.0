Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6292CD4921F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 12:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED4F10E348;
	Fri, 12 Dec 2025 12:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOMgKhzl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2C410E347
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765542396; x=1797078396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Wceiimm3Gq4sjANsh8ghRRypeZ3XTM1GnGhm1dmrzhg=;
 b=VOMgKhzlHCuioSjZtleA48XJ1ejE/ERqG6HvxNwL3h31Gb6XGNwOk5l8
 EyTqN5Y9e4ENzg2JWeqf3PM6VMlORmhxqv3l8JAnaaZBjRH1LsDsV8nkl
 2X/o9cTFMfnhiO67+BG0m/7VtvbOrfPSqWzi/9r5nk0gxL6IVv/XsYbGW
 XQSeYg0VrH+yc73ZND40o7owscDo92+JkWoUfBToIIVRu/bTQs4i+NOlo
 82RjkWT1fNNxMQnceUcUiDXkG/wQ6sFPvp0dz7Lsn9fE3aSa7cLBZWdSw
 q9j4e6ec5oxRC5jPzTmx9wQi0N7q8Qn9r5tkt+sLteMjqPgdAT5k18QOl Q==;
X-CSE-ConnectionGUID: WY+m1HTEQo+Tg5HcwjhZKg==
X-CSE-MsgGUID: 7rn0Rl9ASp+l5V5eF7iMaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78916167"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78916167"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 04:26:36 -0800
X-CSE-ConnectionGUID: y9s4eC7ZR0CcN+FqWQEBWQ==
X-CSE-MsgGUID: w87N78nWSZin+/mudrR++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196982056"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:26:35 -0800
Date: Fri, 12 Dec 2025 13:26:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v4 1/1] docs: fix intel-specific descriptions
Message-ID: <20251212122618.hnrwb7stj4f5ya6c@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251212110301.342433-1-pawel.sikora@intel.com>
 <20251212110301.342433-2-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251212110301.342433-2-pawel.sikora@intel.com>
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
On 2025-12-12 at 12:03:00 +0100, Pawel Sikora wrote:
> While it is true that the main focus of IGT was on Intel GPUs,
> this is no longer the case and the documentation should reflect
> this change and present the current state where no specific
> platform is the center of interest.
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  docs/faq.md       | 15 +++++++++++----
>  docs/platforms.md | 34 ++++++++++++++++++++--------------
>  2 files changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/docs/faq.md b/docs/faq.md
> index 48e754c56..b139c8443 100644
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
> @@ -52,11 +53,17 @@ or decode state.
>  
>  ### What platforms are supported?
>  
> -IGT primarily targets Intel GPUs (Gen9+), but partial support exists for:
> +IGT primarily targets platforms:
>  
> +- Intel (i915 and xe)
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
> index e6882feec..214f53c1d 100644
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
> @@ -12,7 +12,21 @@ is recommended for full test coverage, performance metrics, and regression track
>  - Prefer **dedicated test systems** for kernel and firmware flexibility.
>  - Ensure **reliable cooling** to avoid throttling during performance tests.
>  
> -### Intel
> +### Supported GPUs
> +
> +Support exists for the following platforms:
> +
> +- Intel (i915 and xe)
> +- AMD (amdgpu)
> +- NVIDIA (nouveau)
> +- Broadcom (v3d and vc4)
> +- Qualcomm (msm)
> +- Arm (Panfrost)
> +- Panthor
> +- Virtual GPUs (e.g., virtio_gpu in QEMU/KVM/AVD or vmwgfx)
> +- Virtual display (vkms)
> +
> +#### Intel
>  
>  | GPU Generation | Example Platform / CPU      | Notes                                        |
>  |-||-|
> @@ -25,14 +39,6 @@ is recommended for full test coverage, performance metrics, and regression track
>  :material-information-outline: *Older GPUs (Gen7/Gen8) are still useful for regression
>  testing but may not support new test features.*
>  
> -### Non-Intel GPU Support
> -
> -Although IGT is Intel-focused, basic support exists for other platforms:
> -
> -- **AMD (AMDGPU):** Some display and KMS tests run; feature support may vary.
> -- **NVIDIA (nouveau):** Partial functionality; manual testing encouraged.
> -- **VirtIO-GPU / QEMU / GVT-g:** Useful for automation and limited pipeline testing.
> -- **ARM SoCs (e.g., Mali, Vivante):** Experimental – not all tests apply.
>  
>  :material-account-group-outline: Community contributions are welcome to expand non-Intel
>  support!
> @@ -48,14 +54,14 @@ IGT supports two major Intel GPU drivers in the kernel:
>  Here are some basic information, for more please visit an official
>  [Intel Graphics for Linux - Documentation](https://drm.pages.freedesktop.org/intel-docs/)
>  
> -#### :material-chip: `i915` Driver
> +##### :material-chip: `i915` Driver
>  
>  - Supports older Intel platforms (Gen9–Gen12).
>  - Mature, well-tested, and fully integrated into kernel and userspace stacks.
>  - Tests targeting `i915` must include proper documentation (using `igt_describe`) and
>    follow test plan validation rules.
>  
> -#### :material-flash: `Xe` Driver
> +##### :material-flash: `Xe` Driver
>  
>  - Next-generation Intel GPU driver for **DG2 (Arc)** and newer architectures.
>  - Designed to replace `i915` for future platforms.
> -- 
> 2.51.0
> 
