Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6074DC83F1D
	for <igt-dev@archiver.kernel.org>; Sun, 13 Jul 2025 11:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C0710E0F6;
	Sun, 13 Jul 2025 11:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNe+Q/Cg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A5C10E0F6
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Jul 2025 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752405858; x=1783941858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=es7YuK+6LUM1C1y1fVbMU/Q7JyXDlNLPrn38e8GENKA=;
 b=WNe+Q/CgRjALYkucgMJa/Dzt4rE11a5fU8S4/mF9l6ySkEEBrn+IdOx5
 79Q5BK7zLomLHBuJJjJ1fRhamERVgeSm4U4hJ/84LdI2TXXx8c9xC0kit
 19wG4HQkW76SgAXj/n9j8eM6E77rE0A1VXq6LHcCuVS9PMbCkutf+LJBD
 J2tdHZeeo7CEezps7/v8VYKTVF8Ag5eyL1YYzxJl8iy0CAm3+PoIkoitd
 FWl+ZCz8Je/hoqKujBHFhJScGKxKQMhpaEKY3vDFIsVw9NDxstoS51o6B
 VL3TsrhAHwX7MYrwiJsyOSM9ONwud2r4mKaaHRXNj9wrM73H0nfQnZzic g==;
X-CSE-ConnectionGUID: qDFy6ChJTvO2LvQUrpoxfA==
X-CSE-MsgGUID: sOdmzjdtSl6TpSsDlnWwcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72070745"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="72070745"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 04:24:18 -0700
X-CSE-ConnectionGUID: CAJY9W6oSmyaRgRNpnJhQg==
X-CSE-MsgGUID: y7oZdz1tSiiZ/5g0neH87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="156126322"
Received: from bleysen-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.96.65])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 04:24:16 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Souza <gustavo.souza@linux.intel.com>
Subject: [PATCH v2 i-g-t 2/2] lib/igt_kmod: Add IGT_HOOK_POST_GPUKMOD_UNBIND
Date: Sun, 13 Jul 2025 13:23:54 +0200
Message-ID: <20250713112354.32032-3-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713112354.32032-1-peter.senna@linux.intel.com>
References: <20250713112354.32032-1-peter.senna@linux.intel.com>
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
v2:
 - Added code ducumentation for new hook
 - Added env var IGT_HOOK_KMOD_UNBIND_MODULE_NAME and extended help text

 lib/igt_hook.c | 10 ++++++++++
 lib/igt_hook.h |  3 +++
 lib/igt_kmod.c |  8 ++++++++
 3 files changed, 21 insertions(+)

diff --git a/lib/igt_hook.c b/lib/igt_hook.c
index 8932d118d..a5a55a659 100644
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
@@ -335,6 +337,7 @@ static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct igt_hook_
 	setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
 	setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
 	setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
+	setenv("IGT_HOOK_KMOD_UNBIND_MODULE_NAME", evt->target_name ?: "", 1);
 	setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
 }
 
@@ -470,6 +473,9 @@ below:\n\
 		case IGT_HOOK_POST_TEST:
 			desc = "Occurs after a test case has finished.";
 			break;
+		case IGT_HOOK_POST_GPUKMOD_UNBIND:
+			desc = "Occurs after the GPU kernel module is unbound from the device.";
+			break;
 		default:
 			desc = "MISSING DESCRIPTION";
 		}
@@ -504,6 +510,10 @@ available to the command:\n\
   values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*\"\n\
   events and will be the empty string for other types of events.\n\
 \n\
+  IGT_HOOK_KMOD_UNBIND_MODULE_NAME\n\
+  Name of the GPU kernel module that was unbound from the device. This is only\n\
+  applicable on the `IGT_HOOK_POST_GPUKMOD_UNBIND` event and will be the empty\n\
+  string for other types of events.\n\
 \n\
 Note that %s can be passed multiple times. Each descriptor is evaluated in turn\n\
 when matching events and running hook commands.\n\
diff --git a/lib/igt_hook.h b/lib/igt_hook.h
index e9f97b79b..d80a012f4 100644
--- a/lib/igt_hook.h
+++ b/lib/igt_hook.h
@@ -26,6 +26,8 @@ struct igt_hook;
  * @IGT_HOOK_POST_SUBTEST: Occurs after the execution of a subtest..
  * @IGT_HOOK_POST_TEST: Occurs after a test case (executable) is finished with
  * the test code.
+ * @IGT_HOOK_POST_GPUKMOD_UNBIND: Occurs after the GPU kernel module is
+ * unbound from the device.
  * @IGT_HOOK_NUM_EVENTS: This is not really an event and represents the number
  * of possible events tracked by igt_hook.
  *
@@ -39,6 +41,7 @@ enum igt_hook_evt_type {
 	IGT_HOOK_POST_DYN_SUBTEST,
 	IGT_HOOK_POST_SUBTEST,
 	IGT_HOOK_POST_TEST,
+	IGT_HOOK_POST_GPUKMOD_UNBIND,
 	IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
 };
 
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 6d7f5705c..9b95a2288 100644
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
@@ -634,6 +636,12 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 
 	closedir(dir);
 
+	igt_hook = igt_core_get_igt_hook();
+	igt_hook_event_notify(igt_hook, &(struct igt_hook_evt){
+		.evt_type = IGT_HOOK_POST_GPUKMOD_UNBIND,
+		.target_name = mod_name,
+	});
+
 	return 0;
 }
 
-- 
2.43.0

