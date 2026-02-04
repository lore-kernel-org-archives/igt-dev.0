Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED90E9D40F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8200510E6AE;
	Wed,  4 Feb 2026 16:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqLIMXM2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F66810E6AE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770222772; x=1801758772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jrowW4TQKDVj3kMtFVP5S01bScztIido/0tJBvtZSNs=;
 b=CqLIMXM2N2tAlSQMQUAkcM4O7yuHNyAXIGez5d2FTiXpZ3/xmgvfQO3L
 0E3mPE2PGIl8GdnAosTQmg7W053P2huw2p2jm3ZArRM4EyOtqXUKsF8rm
 4K47LHEIbuhx39oC8DkzQ5nWFlthkJbwsQ0eofNzEOmPSP+IoczlVVgPg
 Fb5nJyoGTdn5+21MCPH5PKeQo+lgMiPvZDecYJ0jdiVgz2CULdVfRqzJk
 tsM3pHK68ZSmXldQUvzvcLTKP4us+E3eTwj5jGABYHqsVxQ5xrYfqMBzK
 6iaMzDpUh5IXTgSYJVGa6zaTf1ekR/lfKi8Ktw3ZWByuw/LtzKApvU5gg w==;
X-CSE-ConnectionGUID: AR3W0QUURROYJ86o0X8GRA==
X-CSE-MsgGUID: DyKi/qmMQ6eEyTUk6329AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96867039"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="96867039"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:52 -0800
X-CSE-ConnectionGUID: nhXC2NSrRq+NPA/7QeEglQ==
X-CSE-MsgGUID: DvgOVyCrQfiscAjrWS5GmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="247804679"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.79])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:51 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 i-g-t 5/7] tests/intel/xe_sriov_flr: Add --wait-flr-ms
 option
Date: Wed,  4 Feb 2026 17:32:08 +0100
Message-ID: <20260204163217.121305-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
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

Make the post-FLR sleep configurable (default 200ms).

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 tests/intel/xe_sriov_flr.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 2f6b24cf0..951628159 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -4,6 +4,7 @@
  */
 
 #include <fcntl.h>
+#include <limits.h>
 #include <pthread.h>
 #include <sys/stat.h>
 #include "drmtest.h"
@@ -61,6 +62,8 @@ static const char STOP_REASON_SKIP[]  = "SKIP";
 
 #define DRIVER_OVERRIDE_TIMEOUT_MS 200
 
+static int g_wait_flr_ms = 200;
+
 static struct g_mmio {
 	struct xe_mmio *mmio;
 	unsigned int num_vfs;
@@ -368,7 +371,7 @@ typedef int (*flr_exec_strategy)(int pf_fd, int num_vfs,
 static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 		       int num_checks, flr_exec_strategy exec_strategy)
 {
-	const int wait_flr_ms = 200;
+	const int wait_flr_ms = g_wait_flr_ms;
 	int i, vf_id, flr_vf_id = -1;
 	bool xe_vfio_loaded;
 	bool *vf_bound = NULL;
@@ -1088,7 +1091,36 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
 }
 
-int igt_main()
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	char *end = NULL;
+	long val;
+
+	switch (opt) {
+	case 'w':
+		errno = 0;
+		val = strtol(optarg, &end, 0);
+		if (errno || !end || *end != '\0' || val < 0 || val > INT_MAX)
+			return IGT_OPT_HANDLER_ERROR;
+		g_wait_flr_ms = (int)val;
+		igt_info("Using wait_flr_ms=%d\n", g_wait_flr_ms);
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const struct option long_options[] = {
+	{ .name = "wait-flr-ms", .has_arg = true, .val = 'w', },
+	{},
+};
+
+static const char help_str[] =
+	"  --wait-flr-ms=MS\tSleep MS milliseconds after VF reset sysfs write (default: 200)\n";
+
+int igt_main_args("w:", long_options, help_str, opt_handler, NULL)
 {
 	int pf_fd;
 	bool autoprobe;
-- 
2.43.0

