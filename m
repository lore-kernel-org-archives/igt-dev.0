Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99ECC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7078010E031;
	Wed, 16 Sep 2026 11:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTLajErv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2537710E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557102; x=1821093102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CMTjQs69CvbEqMOSthH9TT1DpBP3/boHUZPHd2f+8l4=;
 b=MTLajErviK4aWF5HVN0ryrHH71GwDzfwbunrvfR8tXGg0WlT3GsqwO50
 PW3Hf757pvdJdg0wjK4W9agZm5fvYGYL+YVEuGRQhyUNHoKk2S6Jp9dNW
 t0F+tcP/Hul3zO8YHrjQb00S7pDz8M47mbKrfKHFbha2JCY34NqMbHfyh
 ddXISmbi/w2CLu+uGdn4VmK5QpWa/1c/3yg0rxgbbelU064U/f09M9oSs
 kp78IWeB7UsKRi+2dVda/190HOhM3hS+nK/Hebls+zoNHf2ENLfj17bvi
 pOXKht7nRRnyBg+VZlcrm0qeAd5qI5/7T0fPZgliGbZGEJEfuozD/ll1G A==;
X-CSE-ConnectionGUID: +3HpWyP3S6qSF08GhUxgrA==
X-CSE-MsgGUID: XbGDrzfNSF+JLFXaEy6qXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440532"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440532"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:42 -0700
X-CSE-ConnectionGUID: IkUHi30GRfmMUqf2P0h5Vg==
X-CSE-MsgGUID: qhc8hVleRn2tbTmZkkJ3vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296800793"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:39 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 05/16] tools/intel_hdcp: Report the tool and IGT
 version
Date: Wed, 16 Sep 2026 16:36:58 +0530
Message-ID: <20260916110718.596603-6-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The tool prints no identifying information, so a log or a photo of the
screen taken during a bring-up session cannot be tied back to the build
it came from.

Print a version line at startup and support --version, so it can be read
without starting a modeset:

  $ intel_hdcp --version
  intel_hdcp 1.0 (IGT 2.5-gd66922648)

INTEL_HDCP_VERSION is bumped by hand when the operator-visible behaviour
changes; PACKAGE_VERSION and IGT_GIT_SHA1 come from the build and
identify the IGT tree. version.h is generated into the build directory by
lib/meson.build and lib/ is already on the tools include path, so no
build change is needed.

Anything other than --version is now rejected with a usage line instead
of being silently ignored.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 742909b092..c15891c777 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -11,9 +11,17 @@
 #include <stdio.h>
 
 #include "igt.h"
+#include "version.h"
 
 #define MAX_HDCP_BUF_LEN	5000
 
+/*
+ * Bumped by hand when the operator-visible behaviour changes, so a log or a
+ * photo of the screen can be tied back to a known build of the tool.
+ * PACKAGE_VERSION and IGT_GIT_SHA1 identify the IGT tree it was built from.
+ */
+#define INTEL_HDCP_VERSION	"1.0"
+
 #define CP_UNDESIRED	0
 #define CP_DESIRED	1
 #define CP_ENABLED	2
@@ -44,6 +52,15 @@ typedef struct data {
 
 static volatile sig_atomic_t quit_requested;
 
+/* "intel_hdcp 1.0 (IGT 2.5-gd66922648)" */
+static char version_str[128];
+
+static void init_version_str(void)
+{
+	snprintf(version_str, sizeof(version_str), "intel_hdcp %s (IGT %s-%s)",
+		 INTEL_HDCP_VERSION, PACKAGE_VERSION, IGT_GIT_SHA1);
+}
+
 static void sighandler(int sig)
 {
 	quit_requested = 1;
@@ -771,6 +788,20 @@ int main(int argc, char **argv)
 	pthread_t tid;
 	igt_plane_t *primary;
 
+	init_version_str();
+
+	if (argc > 1) {
+		if (!strcmp(argv[1], "--version")) {
+			printf("%s\n", version_str);
+			return 0;
+		}
+
+		fprintf(stderr, "usage: %s [--version]\n", argv[0]);
+		return EXIT_FAILURE;
+	}
+
+	printf("%s\n", version_str);
+
 	signal(SIGINT, sighandler);
 	signal(SIGTERM, sighandler);
 
-- 
2.43.0

