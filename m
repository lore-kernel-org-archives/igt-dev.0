Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13067C77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 15:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9B310E869;
	Thu,  3 Jul 2025 15:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOfYZXqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F56510E869
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 15:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751555063; x=1783091063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NAhY9tLCTvmbf6Z8s+XF6C03LSK9agtxXVkQazoN46k=;
 b=gOfYZXqF1pfPVW97ujL2GUjn/XNzRRoFV7gMhFUrJHOnOZdqUsFPa7BW
 Fu5j2Hb1sH0/u5sKeAzu8NdzYt6E3dX5YG0u7FFU0MRAiEseBZlZ+pzyE
 bbtjC5MJMMdXy+kup+QJ8RfuTAYlOqUFWZfNsEO/UYEdmlw3KibqR9VaM
 2Mau203UY7y9PCU7WBCtuxwjLWelhyQMsvy4RgCQHudVAa6jcQ366EQ32
 YBkk7ESkI6O/mR7tt2nxt1kjTtO80sAnuaLcQm8F/KdyAzxCS/Ykm61lX
 6ecx3v11kx1f/j8I/WezTJFkR3sXFhGwhu80L2njfxRxz61/Bv3ov+lLM w==;
X-CSE-ConnectionGUID: fXGqXqppSwigReXIb751Fg==
X-CSE-MsgGUID: KYBRtX43SCyp1bT7xQ+YRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53603465"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53603465"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:04:23 -0700
X-CSE-ConnectionGUID: af6QY00rTyWWZQML89vTng==
X-CSE-MsgGUID: slmCobQuQi+TBkp6STorzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="158952511"
Received: from jmkrefta-mobl2.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.255.250])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:04:21 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Souza <gustavo.souza@linux.intel.com>
Subject: [PATCH i-g-t 2/2] lib/igt_kmod: Add IGT_HOOK_POST_GPUKMOD_UNBIND
Date: Thu,  3 Jul 2025 17:03:04 +0200
Message-ID: <20250703150304.101208-3-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703150304.101208-1-peter.senna@linux.intel.com>
References: <20250703150304.101208-1-peter.senna@linux.intel.com>
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

Adds an igt_hook after the unbind operation of the GPU kmod intended as
a strategice entry point for kmemleak scans.

Can be used with --hook  'post-gpukmod-unbind:...'

Cc: Gustavo Souza <gustavo.souza@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_hook.c | 5 +++++
 lib/igt_hook.h | 1 +
 lib/igt_kmod.c | 7 +++++++
 3 files changed, 13 insertions(+)

diff --git a/lib/igt_hook.c b/lib/igt_hook.c
index 8932d118d..a3f92acd4 100644
--- a/lib/igt_hook.c
+++ b/lib/igt_hook.c
@@ -74,6 +74,8 @@ static const char *igt_hook_evt_type_to_name(enum igt_hook_evt_type evt_type)
 		return "post-subtest";
 	case IGT_HOOK_POST_TEST:
 		return "post-test";
+	case IGT_HOOK_POST_GPUKMOD_UNBIND:
+		return "post-gpukmod-unbind";
 	case IGT_HOOK_NUM_EVENTS:
 		break;
 	/* No "default:" case, to force a warning from -Wswitch in case we miss
@@ -470,6 +472,9 @@ below:\n\
 		case IGT_HOOK_POST_TEST:
 			desc = "Occurs after a test case has finished.";
 			break;
+		case IGT_HOOK_POST_GPUKMOD_UNBIND:
+			desc = "Occurs after the GPU kernel module is unbound from the device.";
+			break;
 		default:
 			desc = "MISSING DESCRIPTION";
 		}
diff --git a/lib/igt_hook.h b/lib/igt_hook.h
index e9f97b79b..92d3986e8 100644
--- a/lib/igt_hook.h
+++ b/lib/igt_hook.h
@@ -39,6 +39,7 @@ enum igt_hook_evt_type {
 	IGT_HOOK_POST_DYN_SUBTEST,
 	IGT_HOOK_POST_SUBTEST,
 	IGT_HOOK_POST_TEST,
+	IGT_HOOK_POST_GPUKMOD_UNBIND,
 	IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
 };
 
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 6d7f5705c..e300b743a 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -41,6 +41,7 @@
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_debugfs.h"
+#include "igt_hook.h"
 #include "igt_kmod.h"
 #include "igt_ktap.h"
 #include "igt_sysfs.h"
@@ -604,6 +605,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
  */
 int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 {
+	struct igt_hook *igt_hook = NULL;
 	char path[PATH_MAX];
 	struct dirent *de;
 	int dirlen;
@@ -633,6 +635,11 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 	}
 
 	closedir(dir);
+	igt_hook = igt_hook_get_pointer();
+	igt_hook_event_notify(igt_hook, &(struct igt_hook_evt){
+		.evt_type = IGT_HOOK_POST_GPUKMOD_UNBIND,
+		.target_name = mod_name,
+	});
 
 	return 0;
 }
-- 
2.43.0

