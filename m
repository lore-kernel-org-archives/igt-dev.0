Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A206D44164
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 10:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFE110E57B;
	Fri, 12 Dec 2025 10:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUMpMc/F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479CC10E57B
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765536319; x=1797072319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PO19br7pZPt250sXtGF3lv9C3ptq4mXrKAhJFMUQJ1c=;
 b=SUMpMc/FPv8lFyBzZO7F8LRPVByzhhlKlxeofG7PlUUfSqGFS/BaFpFL
 Jv3KT489lu/XD7yAuK4bNGLCao7cQ27CFtlZDUaDvA5DslOyp+2EJ8dMm
 1Zh9aRZeJSQ1dZC7g+YAh4R6cpGioDOw3qWwq3lCUnhrgCY3R5q3+ymmn
 s4rgjwvFyyXCWV9bNnkdhoNQW7drN+FFlZmJbSoJVIAg1AHBb+br4gDzY
 +/JU23b/Iq1jsYTg6C6Ph874dPU/lQ1jOW1p5zuf8yeR/4thCR4JRJYGt
 /LFj4386RD1ron/ucNukOeyqwy+auMzksiU05BMhxWcRxu1K6wM6ne21m w==;
X-CSE-ConnectionGUID: Kar9O5fpSemTkOGkQScTlg==
X-CSE-MsgGUID: M0FHj7FBT1mk8Ey1GoH6Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78237409"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78237409"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 02:45:19 -0800
X-CSE-ConnectionGUID: 7uTFtzbIT62KezjLTFRJGA==
X-CSE-MsgGUID: zp0DqAEHSe+22fTJSUmGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196135997"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.95])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 02:45:17 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 1/1] docs: fix intel-specific descriptions
Date: Fri, 12 Dec 2025 11:45:03 +0100
Message-ID: <20251212104505.342095-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251212104505.342095-1-pawel.sikora@intel.com>
References: <20251212104505.342095-1-pawel.sikora@intel.com>
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

