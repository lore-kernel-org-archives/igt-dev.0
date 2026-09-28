Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F66C9833F
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 11:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4500510E87B;
	Mon, 28 Sep 2026 11:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9MaS6mw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9DB10E092
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790594558; x=1822130558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cY31bw2gmU610+UGs4mbk3gO12yOz5Fhr/qYv3km22k=;
 b=E9MaS6mwT/ODAMV74Kg0uyXYXhairn0bD9XNzA5hxU/I9jmIMCStz+9Z
 7T6UL0Hfma3D9WdukdG9+g4joZrX4FZIT8rTXAZFkHa0jCusBP58VOzBU
 fVd41jwP00sy07dcTSEOxSgLzl70H5X0RxAUrhs5cJHW/2EivI4wFpkhb
 agAPP0DzIaov4eeibjzRXRL8gjiCBA42dW2CThnByjemERzwEI16L7LTl
 17piRDxG+6hqN5kcK3GUfll0U/0lU6UAaF7vDkMt9eJXfy1ZsZQrlvDvS
 YVkrHBB2QtFnuJ1bjFhUk/Q5ownAyLlK/IQj7mIswAPBFDO2Z8HVzXk8M g==;
X-CSE-ConnectionGUID: 9WmATyboSJOjz6+lKMKvxw==
X-CSE-MsgGUID: 2Xeru6ZoR6eBfiwwI8FiWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91154398"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="91154398"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 04:22:37 -0700
X-CSE-ConnectionGUID: wS0qh0EMSC6b5JRhFoLSpw==
X-CSE-MsgGUID: pS0mOrJHT9+RXFQrrH2vyQ==
X-ExtLoop1: 1
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.81])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 04:22:36 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] Update NEWS, bump version to 2.6
Date: Mon, 28 Sep 2026 13:22:26 +0200
Message-ID: <20260928112227.60071-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 NEWS        | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 meson.build |  2 +-
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/NEWS b/NEWS
index adb794151..f3d4ee2e5 100644
--- a/NEWS
+++ b/NEWS
@@ -1,3 +1,96 @@
+Release 2.6 (2026-09-28)
+------------------------
+
+General changes:
+
+- Removed xe_eudebug from meson. (Dominik Karol Piątkowski)
+
+Devops changes:
+
+- Bumped Debian version to bookworm and Fedora to latest 44 (Kamil Konieczny)
+
+Runner changes:
+
+- New igt_runner option --save-results-after-each-test. (Kamil Konieczny)
+
+Library changes:
+
+- Continued refactor of display library code. (Jani Nikula)
+
+- New platform filtering helpers for skipping tests without modifying test
+  source code. (Vitaly Prosyak)
+
+- Improved setting up the render and compute pipelines for Intel GPUs. (Jan
+  Maslak)
+
+Test changes:
+
+- Improved display testing during suspend. (Michał Grzelak)
+
+- Added subtest for BACKGROUND_COLOR crtc property. (Maarten Lankhorst)
+
+- New test for HDMI TMDS audio bandwidth constraints on Intel GPUs. (Swati
+  Sharma)
+
+- Added subtest for Content Match Refresh Rate (CMRR) across both fixed and
+  video timing display modes. (Naladala Ramanaidu)
+
+- New Xe page offline tests on Intel CRI GPUs. (Tejas Upadhyay)
+
+- Added test coverage for FIXED_MATRIX colorops for CSC. (Harry Wentland)
+
+- Added GT reset submit stress subtest. (Nishit Sharma)
+
+- New tests for SRIOV GGTT accesses by PF and VFs on Xe. (Piotr Piórkowski,
+  Marcin Bernatowicz and Lukasz Laguna).
+
+- Added FIXED_MATRIX colorop subtests. (Swati Sharma)
+
+- Added UHBR-to-HBR fallback subtest for UHBR-capable DP connectors.(Sowmiya S)
+
+- Improved KMS tests on MediaTek. (Jason-JH Lin)
+
+- Added user fence no signal subtest for Intel Xe driver. (Priyanka Dandamudi)
+
+- Improved userptr stress test for amdgpu. (Vitaly Prosyak)
+
+- Improved Xe OA testing. (Umesh Nerlige Ramappa)
+
+- Improved FBC handling in display tests. (Vinod Govindapillai)
+
+- Improved amdgpu reset tests. (Jesse Zhang)
+
+- Added subtest to validate YUV420 with DC3CO. (Jeevan B)
+
+- Ported dmabuf tests to KUnit. (Krzysztof Niemiec)
+
+- Added display feature discovery subtests for HDR, VRR and DSC. (Swati Sharma)
+
+- Added Panthor sparse VM_BIND tests. (Adrián Larumbe)
+
+- Extended BO tests to cover GEM_INFO and cache flags on MSM. (Jitta Vignan)
+
+- New tests for PERFCNTR_CONFIG ioctl on MSM GPUs. (Rob Clark)
+
+- New tests for PowerVR Imagination GPUs. (Donald Robson, Matt Coster,
+  Robert Mazur, Frank Binns and Sarah Walker)
+
+Tools changes:
+
+- Fixed gputop on Panthor. (Deborah Brouwer)
+
+- Renamed AMD tool to igt_hdmi_compliance and improved it to work on Intel GPUs
+  (Swati Sharma)
+
+- Improvements in amd_hdmi_compliance. (Fangzhi Zuo and Mark Broadworth)
+
+- Decreased number of dynamically linked libraries in many tools. (Sebastian
+  Brzezinka)
+
+
+And many other bug fixes, improvements, cleanups and new tests.
+
+
 Release 2.5 (2026-06-30)
 ------------------------
 
diff --git a/meson.build b/meson.build
index 980fb6421..d7bbfd969 100644
--- a/meson.build
+++ b/meson.build
@@ -1,5 +1,5 @@
 project('igt-gpu-tools', 'c',
-	version : '2.5',
+	version : '2.6',
         default_options: [
           'warning_level=2',
           'c_std=gnu11',
-- 
2.55.0

