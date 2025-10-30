Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B147DCCF9FC
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 13:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D7410E1EC;
	Thu, 30 Oct 2025 13:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USDtFYuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D29610E1EC
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761832788; x=1793368788;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1+03VWybWGeVQECDbZ9EBfO5HEyPa/zDKXuLLlHjiHw=;
 b=USDtFYuBymQiMy0rxK6nM1bjkY1QpBYBGOqRMe3ZTHgZDp7mzjs7SXAa
 eNJyQOmBfxCkv6eqmMwdED/j6P5CLt3+cqqyqM0PVxzkD7sNsxdI9nkeX
 Jm/QCwmsTVS4H8DOGOlsSZHyGyVcQRNhFHMCDieHW6Mt1dI2U7DeneRBE
 fYGzCMeuqbQZVXc23BcoVapXIY6ZJkY5VDMyVo4HO0V3XqgE7V3u3sPnd
 PK2A6pHtVxb10j7UQ3QCX0wnSIJpeij48vVd9Jo3ddTV2ey0j1kkcg62V
 UlS8+zF7qbBrKKoxwckiDItw73OzN54MhPbRp4iE25bPbT8byx557iqQa Q==;
X-CSE-ConnectionGUID: HkX/JznDSpmU2JecDRCGnA==
X-CSE-MsgGUID: t+u5wGJEQfil3tunnYPcTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66588609"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="66588609"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:59:47 -0700
X-CSE-ConnectionGUID: 9mneK1bUThuQRCOjReZclw==
X-CSE-MsgGUID: 2WhroI8mRUm9f2+9Ds9cGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="186302846"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 06:59:46 -0700
Date: Thu, 30 Oct 2025 14:59:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Mark Yakoub <markyakoub@google.com>
Subject: Re: [PATCH i-g-t v13 5/6] docs: Add platform-specific documentation
Message-ID: <20251030135927.ngdxi5zsfr2gnldb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Mark Yakoub <markyakoub@google.com>
References: <20251029141946.1165010-1-pawel.sikora@intel.com>
 <20251029141946.1165010-6-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029141946.1165010-6-pawel.sikora@intel.com>
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
On 2025-10-29 at 15:19:44 +0100, Pawel Sikora wrote:
> Add platforms.md with information about HW/SW to
> be used when running IGT tests/tools.
> 
> Add Intel-specific details with a placeholder
> for other vendors.
> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Mark Yakoub <markyakoub@google.com>
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/platforms.md | 80 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 docs/platforms.md
> 
> diff --git a/docs/platforms.md b/docs/platforms.md
> new file mode 100644
> index 000000000..e6882feec
> --- /dev/null
> +++ b/docs/platforms.md
> @@ -0,0 +1,80 @@
> +# :material-check-circle: Platforms
> +
> +## :material-chip: Hardware
> +
> +**IGT GPU Tools** is designed to validate few DRM drivers across a variety of Intel
> +and non-Intel platforms. While virtual environments help with development, real hardware
> +is recommended for full test coverage, performance metrics, and regression tracking.
> +
> +### :material-lightbulb-outline: General Guidelines
> +
> +- **Use modern GPUs** for maximum test compatibility.
> +- Prefer **dedicated test systems** for kernel and firmware flexibility.
> +- Ensure **reliable cooling** to avoid throttling during performance tests.
> +
> +### Intel
> +
> +| GPU Generation | Example Platform / CPU      | Notes                                        |
> +|-||-|
> +| Gen9           | Skylake (e.g., i5-6200U)    | Stable, well-supported baseline              |
> +| Gen11          | Ice Lake (e.g., i7-1065G7)  | Better display/media support                 |
> +| Gen12          | Tiger Lake / Alder Lake     | Used for both `i915` and early `Xe` testing  |
> +| DG2            | Intel Arc A-Series GPUs     | Required for `Xe` HPG-specific validation    |
> +| XeHP/XeHPC     | (If available)              | Specialized use by hardware teams/devs       |
> +
> +:material-information-outline: *Older GPUs (Gen7/Gen8) are still useful for regression
> +testing but may not support new test features.*
> +
> +### Non-Intel GPU Support
> +
> +Although IGT is Intel-focused, basic support exists for other platforms:
> +
> +- **AMD (AMDGPU):** Some display and KMS tests run; feature support may vary.
> +- **NVIDIA (nouveau):** Partial functionality; manual testing encouraged.
> +- **VirtIO-GPU / QEMU / GVT-g:** Useful for automation and limited pipeline testing.
> +- **ARM SoCs (e.g., Mali, Vivante):** Experimental – not all tests apply.
> +
> +:material-account-group-outline: Community contributions are welcome to expand non-Intel
> +support!
> +
> +## :material-script: Software
> +
> +### Intel
> +
> +#### :material-shield-account-outline: i915 vs Xe Drivers
> +
> +IGT supports two major Intel GPU drivers in the kernel:
> +
> +Here are some basic information, for more please visit an official
> +[Intel Graphics for Linux - Documentation](https://drm.pages.freedesktop.org/intel-docs/)
> +
> +#### :material-chip: `i915` Driver
> +
> +- Supports older Intel platforms (Gen9–Gen12).
> +- Mature, well-tested, and fully integrated into kernel and userspace stacks.
> +- Tests targeting `i915` must include proper documentation (using `igt_describe`) and
> +  follow test plan validation rules.
> +
> +#### :material-flash: `Xe` Driver
> +
> +- Next-generation Intel GPU driver for **DG2 (Arc)** and newer architectures.
> +- Designed to replace `i915` for future platforms.
> +- Modular, uses a new codebase and device model.
> +- Tests targeting `Xe` must follow the same documentation and validation practices but may
> +  focus on newer UAPI/ABI interactions.
> +
> +#### :material-alert-outline: Key Differences
> +
> +| Aspect           | i915                         | Xe                                    |
> +|||-|
> +| Target Platforms | Gen9–Gen12, some DG1         | DG2 (Arc), XeHP/HPG/HPC               |
> +| Kernel Interface | Legacy DRM, widely used      | New driver stack with modernized UAPI |
> +| Development      | Stable, long-maintained      | In active development                 |
> +| Test Requirements| Strict documentation rules   | Same, with new feature emphasis       |
> +
> +If you're unsure which driver your hardware uses, check:
> +
> +```bash
> +lspci -nn | grep VGA
> +dmesg | grep drm
> +```
> -- 
> 2.51.0
> 
