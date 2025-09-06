Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93778CA1002
	for <igt-dev@archiver.kernel.org>; Sat,  6 Sep 2025 05:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C3910E1A3;
	Sat,  6 Sep 2025 05:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irYQYnuc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE1010E1A3
 for <igt-dev@lists.freedesktop.org>; Sat,  6 Sep 2025 05:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757137958; x=1788673958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=stywoE+KjoC+GqGBXGwaaafFDred3OgK3XEvzT/ZWKE=;
 b=irYQYnucmIhUCB5gC8UR16O6dyzByubup+HDXJctO9ScHNcmiiNuD7UV
 IXb3Fhy6nsQr3DdqViG2HcKVnA2SHJdz7SlvstfsSr0K6XpqarVAoDHt0
 yl84I6e3b8AaksllFkr7np0ogX5HE8PYh3bSc3BKvRWGQOrvKscBhFe/8
 GcbWjYkaM3pZOOMjX/RPsjIL/JUXIobuxaV9O/YG5Ur+UKJraF6qrl0uB
 euW2sXbgCGOdqN009WGBVEexSCqinPa1YxdVXWiJ+OgDzPnIt7giN9Fxx
 gvZgHHeW3jZhhq3ej9G/y+HXdTn1VE193/Ecy8S9z+LxiZE9zEt/tiflB A==;
X-CSE-ConnectionGUID: lf3tyTeHR4KCN0Y9SLEdwQ==
X-CSE-MsgGUID: 7+nLW6BDRr6ssLQR9YnTxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59337692"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; d="scan'208";a="59337692"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 22:52:38 -0700
X-CSE-ConnectionGUID: QgK90XJrRUmZlGxrKlLwNw==
X-CSE-MsgGUID: bsdvo047SruG73Mz34/QZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; d="scan'208";a="176650181"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 22:52:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_configfs: Check ctx_restore_post_bb
Date: Fri,  5 Sep 2025 22:52:21 -0700
Message-ID: <20250906055220.803070-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.50.1
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

Add sanity checks for the values possibly written to
ctx_restore_post_bb, according to pending patch series:
https://lore.kernel.org/intel-xe/20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com/

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 113 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 086f99ba5..d778065f3 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -122,6 +122,111 @@ static void test_engines_allowed(int configfs_device_fd)
 	}
 }
 
+/**
+ * SUBTEST: ctx-restore-post-bb-invalid
+ * Description: Validate ctx_restore_post_bb attribute for invalid values
+ */
+static void test_ctx_restore_post_bb_invalid(int configfs_device_fd)
+{
+	static const struct value {
+		const char *test;
+		const char *in;
+		const char *out;
+	} values[] = {
+		{ .test = "invalid-engine",
+		  .in = "foobar cmd 11000001 4F100 DEADBEEF",
+		},
+		{ .test = "invalid-type",
+		  .in = "rcs 11000001 4F100 DEADBEEF",
+		},
+		{ .test = "invalid-number",
+		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
+		},
+		{ .test = "invalid-number",
+		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
+		},
+		{ .test = "invalid-reg-addr-only",
+		  .in = "rcs reg 4F100",
+		},
+	};
+
+	/*
+	 * These only test if command parsing is correct,
+	 * so just make sure there's no device bound
+	 */
+	igt_kmod_unbind("xe", bus_addr);
+
+	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
+		const struct value *v = &values[i];
+
+		igt_info("%s\n", v->test);
+		igt_debug("Test '%s' to ctx_restore_post_bb\n", v->in);
+		igt_assert(!igt_sysfs_set(configfs_device_fd,
+					  "ctx_restore_post_bb", v->in));
+	}
+}
+
+/**
+ * SUBTEST: ctx-restore-post-bb
+ * Description: Validate ctx_restore_post_bb attribute
+ */
+static void test_ctx_restore_post_bb(int configfs_device_fd)
+{
+	static const struct value {
+		const char *test;
+		const char *in;
+		const char *out;
+	} values[] = {
+		{ .test = "cmd-single",
+		  .in = "rcs cmd 11000001 4F100 DEADBEEF",
+		  .out = "rcs: 11000001 0004f100 deadbeef\n",
+		},
+		{ .test = "cmd-single-multi-values",
+		  .in = "rcs cmd 11000003 4F100 DEADBEEF 4F104 DEADBEEF",
+		  .out = "rcs: 11000003 0004f100 deadbeef 0004f104 deadbeef\n",
+		},
+		{ .test = "cmd-multi",
+		  .in = "rcs cmd 11000001 4F100 DEADBEEF\n"
+			"rcs cmd 11000001 4F104 FFFFFFFF",
+		  .out = "rcs: 11000001 0004f100 deadbeef 11000001 0004f104 ffffffff\n",
+		},
+		{ .test = "reg-single",
+		  .in = "rcs reg 4F100 DEADBEEF",
+		  .out = "rcs: 11000001 0004f100 deadbeef\n",
+		},
+		{ .test = "reg-multi",
+		  .in = "rcs reg 4F100 DEADBEEF\n"
+			"rcs reg 4F104 FFFFFFFF",
+		  .out = "rcs: 11000001 0004f100 deadbeef 11000001 0004f104 ffffffff\n",
+		},
+	};
+	char buf[4096] = { };
+
+	/*
+	 * These only test if command parsing is correct,
+	 * so just make sure there's no device bound
+	 */
+	igt_kmod_unbind("xe", bus_addr);
+
+	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
+		const struct value *v = &values[i];
+
+		igt_info("%s\n", v->test);
+		igt_debug("Test '%s' to ctx_restore_post_bb\n", v->in);
+		igt_assert(igt_sysfs_set(configfs_device_fd,
+					 "ctx_restore_post_bb", v->in));
+
+		if (v->out) {
+			igt_assert(igt_sysfs_read(configfs_device_fd, "ctx_restore_post_bb", buf,
+						  sizeof(buf) - 1));
+			if (strcmp(v->out, buf)) {
+				igt_debug("Expecting '%s' but found '%s'", v->out, buf);
+				igt_fail(IGT_EXIT_FAILURE);
+			}
+		}
+	}
+}
+
 static void set_bus_addr(int fd)
 {
 	struct pci_device *pci_dev;
@@ -173,6 +278,14 @@ igt_main
 	igt_subtest("engines-allowed")
 		test_engines_allowed(configfs_device_fd);
 
+	igt_describe("Validate ctx_restore_post_bb with invalid options");
+	igt_subtest("ctx-restore-post-bb-invalid")
+		test_ctx_restore_post_bb_invalid(configfs_device_fd);
+
+	igt_describe("Validate ctx_restore_post_bb");
+	igt_subtest("ctx-restore-post-bb")
+		test_ctx_restore_post_bb(configfs_device_fd);
+
 	igt_fixture {
 		close(configfs_device_fd);
 		close(configfs_fd);
-- 
2.50.1

