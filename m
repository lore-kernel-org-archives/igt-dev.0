Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD197D43371
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 07:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B3610E32F;
	Fri, 12 Dec 2025 07:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnlxzDN9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD93510E32F
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765524995; x=1797060995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0OPWnCjCPplBVYfLVbC24JnqhrLqnbY2FAhMKQ8K2eE=;
 b=jnlxzDN9AF35Hel9hMKRRkJ0u3qePdIYczT8MDiRZPUEgtvq0m9cZeRA
 9QeIKVyHX+IfT2lf1JcoX7/z20CzrtYx9tSkawi6REFpeWpf2Ib5nNQ8v
 cKo+8XCpjUJ5U40MyrEpJMFhsiPDvJ+GFiaUt30/p4abbklVErZO43z0s
 MvceKM9JnZbycKr8lX/Hz1zeucMn83pm/gRUKCoU9G9iz/46OzyAa3mRr
 qirjGuYBr2YIfS35WKr9+IUEmXGkHcdkMdsm/kowUFX0IDof0QtmNTAJr
 XdqNK2r7kyJEoLUpFF7mOXLtnAfQgB63fhtU/fwxL5OpCxlE5i2rdAFEz w==;
X-CSE-ConnectionGUID: 0FLyVo4ISZ6kpenzIDFcUA==
X-CSE-MsgGUID: U1NlV4v9QDywMoDoozOD1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="90164628"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="90164628"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:36:35 -0800
X-CSE-ConnectionGUID: srmhIe9UTR2rg/cwqF0qOQ==
X-CSE-MsgGUID: rHjfy3RrRcae9cXbEU0K2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197069119"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.95])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:36:35 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/1] docs: fix intel-specific descriptions
Date: Fri, 12 Dec 2025 08:36:23 +0100
Message-ID: <20251212073623.337981-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251212073623.337981-1-pawel.sikora@intel.com>
References: <20251212073623.337981-1-pawel.sikora@intel.com>
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

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/faq.md       | 15 +++++++++++----
 docs/platforms.md | 23 ++++++++++++++---------
 2 files changed, 25 insertions(+), 13 deletions(-)

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
index e6882feec..ab7d49770 100644
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
 
@@ -27,12 +27,17 @@ testing but may not support new test features.*
 
 ### Non-Intel GPU Support
 
-Although IGT is Intel-focused, basic support exists for other platforms:
-
-- **AMD (AMDGPU):** Some display and KMS tests run; feature support may vary.
-- **NVIDIA (nouveau):** Partial functionality; manual testing encouraged.
-- **VirtIO-GPU / QEMU / GVT-g:** Useful for automation and limited pipeline testing.
-- **ARM SoCs (e.g., Mali, Vivante):** Experimental – not all tests apply.
+Basic support exists for other platforms:
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
 
 :material-account-group-outline: Community contributions are welcome to expand non-Intel
 support!
-- 
2.51.0

