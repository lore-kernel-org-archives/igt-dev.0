Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944ACD43371
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 07:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2874D10E32F;
	Fri, 12 Dec 2025 07:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wc6hiIjA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2020610E32F
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765524877; x=1797060877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PO19br7pZPt250sXtGF3lv9C3ptq4mXrKAhJFMUQJ1c=;
 b=Wc6hiIjA8wV2AEZ2un9cbeRN7BtFwOj63jMXklU3lxLf+ts8kVZSHuqm
 oDSfJd5faeGEwVDW5oFPKZkurhB42/Q5o/umq1J2MdUWyVJF+YwYrXEs3
 jKwtfABrBf3d0UCGlIxUxGGrr6Qq6pCNTHYIPnFeMa1FyGHXwxy5BfTyJ
 TNEP45SnNq1SldE+F6em+q7oEWTZA7BCmRD2bzVNSaBgeXwmvM0Ic6zLf
 39G+mzLc0dIqOTX1ozk7ScdOiYiCQxF7/RHeOYPga2tYboVZj3TxmDJWp
 PyLtm6vYWocRlv4riGrFecm8eePcXprlz4TKWAQM3NsqOeYH2tlyALKcK A==;
X-CSE-ConnectionGUID: Ln1AcihSRZOySBfrg4HTVQ==
X-CSE-MsgGUID: SFpcXJMsTtSTTuIjTFi+yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78136878"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78136878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:34:37 -0800
X-CSE-ConnectionGUID: PyPoZWKCS6qmLHB2Si4PiA==
X-CSE-MsgGUID: Nq6hZApQSQCt5Ark4BGXww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="227658972"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.95])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 23:34:36 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/1] docs: fix intel-specific descriptions
Date: Fri, 12 Dec 2025 08:34:22 +0100
Message-ID: <20251212073423.337861-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251212073423.337861-1-pawel.sikora@intel.com>
References: <20251212073423.337861-1-pawel.sikora@intel.com>
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

