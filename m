Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734DDD41D50
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 15:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C9110E81D;
	Thu, 11 Dec 2025 15:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjxQCxUp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8152D10E81D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765466355; x=1797002355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wacoLC5DMp02t4+T4MFewkpk8QNqzTE2GiAumkliVh8=;
 b=WjxQCxUpst9ngds2nuCTXRUtBDVfFh1YCk7FhCCuRn00M2Vp2/233ecC
 F3pBz/kgjBjnxce9ncu+yaF0bgfPeL5pqqlASMnP9QfHDeeHH/OtggEjc
 ZbfRgS2CPn+Ea5+2IpRtb7fiknKX6SZw0zRpdYSCH3ImPUd54siF9tY8f
 2bait73tgLlWliE8JpCYIwJrxs+QXgdMig+OhxoL2PjbSzi0TK/qumPHN
 H3nQXvdhdxbGmt+BBQ9o/MDSATF6Jv/LOP4batoSj5Y6dgeWu8fOUwcme
 W5AlHCaLMHGQHFAtHWX+EpIFEljRRc1wUpK8SOS7K1qcasKZbjfCgwkDP g==;
X-CSE-ConnectionGUID: j1ZBn+1sTEiU3JnAv0A5vw==
X-CSE-MsgGUID: pCNeYjkVSLmDqHxqkSPdWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78070317"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78070317"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 07:19:14 -0800
X-CSE-ConnectionGUID: tHL8r5jZSKml6C0sP68vBA==
X-CSE-MsgGUID: 4rd/j/FmSxmIp/ihkqmAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="200987269"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.3])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 07:19:13 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/1] docs: fix intel-specific descriptions
Date: Thu, 11 Dec 2025 16:19:02 +0100
Message-ID: <20251211151903.323890-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211151903.323890-1-pawel.sikora@intel.com>
References: <20251211151903.323890-1-pawel.sikora@intel.com>
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
 docs/faq.md       | 14 ++++++++++----
 docs/platforms.md | 20 ++++++++++++--------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/docs/faq.md b/docs/faq.md
index 48e754c56..239d57012 100644
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
 
@@ -52,11 +53,16 @@ or decode state.
 
 ### What platforms are supported?
 
-IGT primarily targets Intel GPUs (Gen9+), but partial support exists for:
+IGT primarily targets platforms:/
 
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
index e6882feec..b788a92c1 100644
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
 
@@ -27,12 +27,16 @@ testing but may not support new test features.*
 
 ### Non-Intel GPU Support
 
-Although IGT is Intel-focused, basic support exists for other platforms:
+Basic support exists for other platforms:
 
-- **AMD (AMDGPU):** Some display and KMS tests run; feature support may vary.
-- **NVIDIA (nouveau):** Partial functionality; manual testing encouraged.
-- **VirtIO-GPU / QEMU / GVT-g:** Useful for automation and limited pipeline testing.
-- **ARM SoCs (e.g., Mali, Vivante):** Experimental – not all tests apply.
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

