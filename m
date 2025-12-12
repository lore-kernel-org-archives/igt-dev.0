Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E53D4417C
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 11:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025D710E5A6;
	Fri, 12 Dec 2025 11:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pa/jLQ7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B074C10E5A6
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765537394; x=1797073394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/YaeuwOstxMrp7GIwitxtNtvmQ+P4mb4A7oxOmYDtqo=;
 b=Pa/jLQ7ffQzIwG6Fl24OliW7Gk+Vx1U6vMwIpF4Jr81c5bPWe0DfO8qr
 Mls0Q3nKH8OKnXpHnEGGE7ksz1K9OvP9v4CA1UcWXIDY2+YjpyVgz6ucP
 K5gZhulewJ4rDcpbtnMtq1qC5DUoDvPrDJBu47cxvXJkQf+1xKmLL20sO
 5JkgS5G0UD80KoHsPWgyGVklSb0q9t86oSnMg3LUGLaFD1tlaKAeWID8b
 hCE3+2XABPtNZOCoMXcJlNdDUSe0MfUjy/T4+nxBHs1wKyZH6CGv0o2Up
 v1az1iFRRh0uRLhMwMRL3ToizSes1/iFMkGi8DBvlzisK3xx46BvS9rfl A==;
X-CSE-ConnectionGUID: jB0Z9gipTtWKe/cSGhBiOg==
X-CSE-MsgGUID: zQ+7muvDRkeGM9q0F0G4eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78905077"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78905077"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:03:14 -0800
X-CSE-ConnectionGUID: tR1UAs1HQsqYQTjMoms75A==
X-CSE-MsgGUID: 9IVaWShGSbO9kcOR1VHA6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196662377"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.95])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:03:12 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 1/1] docs: fix intel-specific descriptions
Date: Fri, 12 Dec 2025 12:03:00 +0100
Message-ID: <20251212110301.342433-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251212110301.342433-1-pawel.sikora@intel.com>
References: <20251212110301.342433-1-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

While it is true that the main focus of IGT was on Intel GPUs,
this is no longer the case and the documentation should reflect
this change and present the current state where no specific
platform is the center of interest.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/faq.md       | 15 +++++++++++----
 docs/platforms.md | 34 ++++++++++++++++++++--------------
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/docs/faq.md b/docs/faq.md
index 48e754c56..b139c8443 100644
--- a/docs/faq.md
+++ b/docs/faq.md
@@ -6,8 +6,9 @@ This FAQ covers common questions about using, building, and contributing to
 ### What is IGT GPU Tools?
 
 IGT GPU Tools is a collection of low-level tests and utilities used to validate and
-debug Linux DRM (Direct Rendering Manager) graphics drivers. It focuses primarily on
-Intel GPUs but supports other platforms in varying degrees.
+debug Linux DRM (Direct Rendering Manager) graphics drivers. It focuses primarily
+on display testing. It supports GPU-specific testing for Intel and AMD.
+Other platforms are supported in varying degrees.
 
 ### How do I build IGT?
 
@@ -52,11 +53,17 @@ or decode state.
 
 ### What platforms are supported?
 
-IGT primarily targets Intel GPUs (Gen9+), but partial support exists for:
+IGT primarily targets platforms:
 
+- Intel (i915 and xe)
 - AMD (amdgpu)
 - NVIDIA (nouveau)
-- Virtual GPUs (e.g., virtio-gpu in QEMU/KVM/AVD)
+- Broadcom (v3d and vc4)
+- Qualcomm (msm)
+- Arm (Panfrost)
+- Panthor
+- Virtual GPUs (e.g., virtio_gpu in QEMU/KVM/AVD or vmwgfx)
+- Virtual display (vkms)
 
 Hardware coverage may vary by test.
 
diff --git a/docs/platforms.md b/docs/platforms.md
index e6882feec..214f53c1d 100644
--- a/docs/platforms.md
+++ b/docs/platforms.md
@@ -2,9 +2,9 @@
 
 ## :material-chip: Hardware
 
-**IGT GPU Tools** is designed to validate few DRM drivers across a variety of Intel
-and non-Intel platforms. While virtual environments help with development, real hardware
-is recommended for full test coverage, performance metrics, and regression tracking.
+**IGT GPU Tools** is designed to validate few DRM drivers across a variety of platforms.
+While virtual environments help with development, real hardware is recommended for full
+test coverage, performance metrics, and regression tracking.
 
 ### :material-lightbulb-outline: General Guidelines
 
@@ -12,7 +12,21 @@ is recommended for full test coverage, performance metrics, and regression track
 - Prefer **dedicated test systems** for kernel and firmware flexibility.
 - Ensure **reliable cooling** to avoid throttling during performance tests.
 
-### Intel
+### Supported GPUs
+
+Support exists for the following platforms:
+
+- Intel (i915 and xe)
+- AMD (amdgpu)
+- NVIDIA (nouveau)
+- Broadcom (v3d and vc4)
+- Qualcomm (msm)
+- Arm (Panfrost)
+- Panthor
+- Virtual GPUs (e.g., virtio_gpu in QEMU/KVM/AVD or vmwgfx)
+- Virtual display (vkms)
+
+#### Intel
 
 | GPU Generation | Example Platform / CPU      | Notes                                        |
 |-||-|
@@ -25,14 +39,6 @@ is recommended for full test coverage, performance metrics, and regression track
 :material-information-outline: *Older GPUs (Gen7/Gen8) are still useful for regression
 testing but may not support new test features.*
 
-### Non-Intel GPU Support
-
-Although IGT is Intel-focused, basic support exists for other platforms:
-
-- **AMD (AMDGPU):** Some display and KMS tests run; feature support may vary.
-- **NVIDIA (nouveau):** Partial functionality; manual testing encouraged.
-- **VirtIO-GPU / QEMU / GVT-g:** Useful for automation and limited pipeline testing.
-- **ARM SoCs (e.g., Mali, Vivante):** Experimental – not all tests apply.
 
 :material-account-group-outline: Community contributions are welcome to expand non-Intel
 support!
@@ -48,14 +54,14 @@ IGT supports two major Intel GPU drivers in the kernel:
 Here are some basic information, for more please visit an official
 [Intel Graphics for Linux - Documentation](https://drm.pages.freedesktop.org/intel-docs/)
 
-#### :material-chip: `i915` Driver
+##### :material-chip: `i915` Driver
 
 - Supports older Intel platforms (Gen9–Gen12).
 - Mature, well-tested, and fully integrated into kernel and userspace stacks.
 - Tests targeting `i915` must include proper documentation (using `igt_describe`) and
   follow test plan validation rules.
 
-#### :material-flash: `Xe` Driver
+##### :material-flash: `Xe` Driver
 
 - Next-generation Intel GPU driver for **DG2 (Arc)** and newer architectures.
 - Designed to replace `i915` for future platforms.
-- 
2.51.0

