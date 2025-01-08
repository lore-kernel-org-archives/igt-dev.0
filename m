Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83573E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 12:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E1410E2D1;
	Wed,  8 Jan 2025 12:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3NpUMEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8E210E2D1
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 12:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736340412; x=1767876412;
 h=from:to:cc:subject:date:message-id:reply-to:mime-version:
 content-transfer-encoding;
 bh=emox6Ln70HeLKkOPhC0Bq0DyWPMWR+C3dx/1RSv7nCU=;
 b=k3NpUMELRDONZp8VRBZzuGyGoPnxIHzFcbMgUbuydmgBeZ9rPSqjIldW
 UO4Vm5jy1219VrCL7NInfcNqGrbZnSdxU8S+rIJrD+vyNbUFp3gfuznJS
 EAILCuS6C9WwkybIWOvhuPbCwXUZVx9LWNCel8aj51YUHtxp9GpNMmRt2
 TtRtC9rZKJeqDeUJPVm1GfTnu+5Bsp60i/MetJw6/2FakBHcsRAP+4vIB
 Crj714b/X0HQUxPM8WQFs7yOZgJ443An9Um2wchpm2VBeuBmo07kr1gOT
 6pue0AVbZFYcGOFkcxnnSfb0PayxdNdVtk/uOueGgIIPpuequydirgekR A==;
X-CSE-ConnectionGUID: oFpMx+p0Q2eavlCwgbV02g==
X-CSE-MsgGUID: 3tABqcK8TzCLQZP+mB4XFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35791279"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="35791279"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 04:46:52 -0800
X-CSE-ConnectionGUID: xu8rk9OBQtO19QMJVl5HBA==
X-CSE-MsgGUID: srP+5TMLTfGL3k3VphJP5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108187271"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 04:46:51 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Date: Wed,  8 Jan 2025 18:16:37 +0530
Message-ID: <20250108124637.291978-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Reply-To: 20250106095154.243459-1-mohammed.thasleem@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Check ghe algo for the function called by ghe igt while compiling.

v2: Update version check and remove warning message. (Lucas)
    Print messae at api else check. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 meson.build | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meson.build b/meson.build
index 8b2a2a64a..6370887d6 100644
--- a/meson.build
+++ b/meson.build
@@ -199,7 +199,17 @@ endif
 
 libghe = dependency('libghe', required : false)
 if libghe.found()
+  if libghe.version().version_compare('>=0.2.0')
+
+    cc = meson.get_compiler('c')
+
+    if cc.has_function('histogram_compute_generate_data_bin', dependencies: libghe)
+      message('libghe provides the required function')
       config.set('HAVE_LIBGHE', 1)
+    else
+      message ('libghe API changed')
+    endif
+  endif
 endif
 
 build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
-- 
2.43.0

