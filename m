Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60937606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RHOmoTpK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED19710E83E;
	Fri, 30 Oct 2026 06:30:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A593110E22C
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 06:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793341749; x=1824877749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PNTMd6izX98/cAgxErfq+IZEvxOzx7A39E2+6oaz6Ts=;
 b=RHOmoTpKnmhPO4rhVKmtKAUTlcocAXrNFvbnkdtllP5H4QQadn6Wnhd3
 MTZdmY9OubPguXqLG3593Q59P2+ylE2qhjIKoaiTuHYlJyA6pELhU81fa
 UYi7f5jlK6EC//mvDyDoc2MOta4NP/exhI4AT9+t7U7nxcX5wvuUfMLM5
 SBqA/PPFwz8cxxLy7zBwyY4kcaV+MfnQ1xWDEqawEjp6dPyIqT8e5w/jc
 6V+c5wlga8SMKp7R5ZvShwRVLkiWDPq9EWUbyVap9CUtJAPitEbfkKbJz
 5uzexMGYbxqGVVptIdI4JXk8rwutcPBheC7gMz4WOg5aK1KaI612uscXq A==;
X-CSE-ConnectionGUID: UHIBabCmSZi0wZoSVa4WYw==
X-CSE-MsgGUID: TIK6Ld2eTlCfOXSIu7qNiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2129641"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2129641"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 23:29:09 -0700
X-CSE-ConnectionGUID: mGRWOmxMQH+IvJ88dbt+8A==
X-CSE-MsgGUID: 4GfyNvoSRoeZ/XWMkq/vbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5451120"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 23:29:07 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3] tests/intel/xe_configfs: reuse pre-existing configfs group
Date: Fri, 30 Oct 2026 11:44:41 +0530
Message-ID: <20261030061440.2342301-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Handle a pre-existing configfs group by opening and reusing it, retain
it across cleanup, and validate the fd so the test fails early with a
clear message on any error.

v2: Add a common function (Soham)
v3: Close fd and handle failure (Soham)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 lib/igt_configfs.c             | 62 +++++++++++++++++++++++++
 lib/igt_configfs.h             |  6 +++
 tests/intel/xe_configfs.c      | 85 ++++++++++++++++++++--------------
 tests/intel/xe_survivability.c | 22 +++------
 4 files changed, 124 insertions(+), 51 deletions(-)

diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
index e0cba92a1..7bbeca746 100644
--- a/lib/igt_configfs.c
+++ b/lib/igt_configfs.c
@@ -10,9 +10,12 @@
 #include <fcntl.h>
 #include <limits.h>
 #include <sys/mount.h>
+#include <sys/stat.h>
+#include <unistd.h>
 
 #include "igt_aux.h"
 #include "igt_configfs.h"
+#include "igt_fs.h"
 
 /**
  * SECTION:igt_configfs
@@ -84,3 +87,62 @@ int igt_configfs_open(const char *name)
 
 	return open(path, O_DIRECTORY | O_RDONLY);
 }
+
+/**
+ * igt_configfs_create_device_group: create or reuse a device's configfs group
+ * @configfs_fd: configfs directory fd
+ * @name: name of the device group
+ * @preexisting: set to true when @name already existed
+ *
+ * Creates the configfs group @name under @configfs_fd. If the group already
+ * exists, it is opened and reused instead.
+ *
+ * Returns:
+ * The group directory fd.
+ */
+int igt_configfs_create_device_group(int configfs_fd, const char *name,
+				     bool *preexisting)
+{
+	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
+	int device_fd;
+
+	device_fd = igt_fs_create_dir(configfs_fd, name, mode);
+	if (device_fd == -EEXIST) {
+		if (preexisting)
+			*preexisting = true;
+
+		device_fd = openat(configfs_fd, name, O_DIRECTORY);
+		if (device_fd < 0)
+			device_fd = -errno;
+	}
+	igt_assert_f(device_fd >= 0,
+		     "Failed to create/open configfs group for %s: %s\n",
+		     name, strerror(-device_fd));
+
+	return device_fd;
+}
+
+/**
+ * igt_configfs_close_device_group: close a device's configfs group
+ * @configfs_fd: configfs directory fd, as returned by igt_configfs_open()
+ * @name: name of the device group
+ * @device_fd: group directory fd
+ * @preexisting: whether the group already existed before it was created by
+ * igt_configfs_create_device_group()
+ *
+ * Closes @device_fd and removes the @name group, unless it was pre-existing.
+ */
+void igt_configfs_close_device_group(int configfs_fd, const char *name,
+				     int device_fd, bool preexisting)
+{
+	int ret;
+
+	close(device_fd);
+
+	if (!preexisting) {
+		ret = igt_fs_remove_dir(configfs_fd, name);
+		if (ret)
+			igt_debug("Failed to remove configfs group %s: %s\n",
+				  name, strerror(-ret));
+	}
+}
diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
index 91f95659b..0f4cfe5d3 100644
--- a/lib/igt_configfs.h
+++ b/lib/igt_configfs.h
@@ -9,7 +9,13 @@
 #ifndef __IGT_CONFIGFS_H__
 #define __IGT_CONFIGFS_H__
 
+#include <stdbool.h>
+
 const char *igt_configfs_mount(void);
 int igt_configfs_open(const char *name);
 
+int igt_configfs_create_device_group(int configfs_fd, const char *name, bool *preexisting);
+void igt_configfs_close_device_group(int configfs_fd, const char *name, int device_fd,
+				     bool preexisting);
+
 #endif /* __IGT_CONFIGFS_H__ */
diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 450c0a119..68daed690 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -26,6 +26,8 @@
 static char bus_addr[NAME_MAX];
 static struct pci_device *pci_dev;
 
+static bool configfs_group_preexisting;
+
 static bool check_registers(const uint32_t reg[], const uint32_t val[],
 			    size_t max)
 {
@@ -60,7 +62,7 @@ static void restore(int sig)
 
 	/* Drop all custom configfs settings from subtests */
 	configfs_fd = igt_configfs_open("xe");
-	if (configfs_fd >= 0)
+	if (configfs_fd >= 0 && !configfs_group_preexisting)
 		igt_fs_remove_dir(configfs_fd, bus_addr);
 	close(configfs_fd);
 
@@ -70,10 +72,19 @@ static void restore(int sig)
 
 static void set_survivability_mode(int configfs_device_fd, bool value)
 {
+	int ret;
+
 	igt_audio_driver_unload(NULL);
-	igt_kmod_unbind("xe", bus_addr);
+
+	ret = igt_kmod_unbind("xe", bus_addr);
+	igt_assert_f(!ret, "Failed to unbind xe from %s: %s\n",
+		     bus_addr, strerror(-ret));
+
 	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
-	igt_kmod_bind("xe", bus_addr);
+
+	ret = igt_kmod_bind("xe", bus_addr);
+	igt_assert_f(!ret, "Failed to bind xe to %s: %s\n",
+		     bus_addr, strerror(-ret));
 }
 
 /**
@@ -93,6 +104,9 @@ static void test_survivability_mode(int configfs_device_fd)
 
 	fd = open(path, O_RDONLY);
 	igt_assert_f(fd >= 0, "Survivability mode not set\n");
+
+	set_survivability_mode(configfs_device_fd, false);
+
 	close(fd);
 }
 
@@ -357,23 +371,6 @@ static void set_bus_addr(int fd)
 		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
 }
 
-static int create_device_configfs_group(int configfs_fd)
-{
-	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
-	int configfs_device_fd;
-
-	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
-	igt_assert(configfs_device_fd);
-
-	return configfs_device_fd;
-}
-
-static void close_configfs_group(int configfs_fd, int configfs_device_fd)
-{
-	close(configfs_device_fd);
-	igt_fs_remove_dir(configfs_fd, bus_addr);
-}
-
 int igt_main()
 {
 	int fd, configfs_fd, configfs_device_fd;
@@ -412,62 +409,78 @@ int igt_main()
 	igt_subtest("survivability-mode") {
 		igt_require(has_survivability);
 		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+								      &configfs_group_preexisting);
 		test_survivability_mode(configfs_device_fd);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
+						configfs_group_preexisting);
 	}
 
 	igt_describe("Validate engines_allowed with invalid options");
 	igt_subtest("engines-allowed-invalid") {
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+								      &configfs_group_preexisting);
 		test_engines_allowed_invalid(configfs_device_fd);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
+						configfs_group_preexisting);
 	}
 
 	igt_describe("Validate engines_allowed");
 	igt_subtest("engines-allowed") {
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+								      &configfs_group_preexisting);
 		test_engines_allowed(configfs_device_fd);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
+						configfs_group_preexisting);
 	}
 
 	igt_describe("Validate gt_types_allowed");
 	igt_subtest("gt-types-allowed") {
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+								      &configfs_group_preexisting);
 		test_gt_types_allowed(configfs_device_fd);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
+						configfs_group_preexisting);
 	}
 
 	igt_describe("Validate ctx_restore_post_bb with invalid options");
 	igt_subtest("ctx-restore-post-bb-invalid") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+								      &configfs_group_preexisting);
 		test_ctx_restore_invalid(configfs_device_fd, "post");
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
+						configfs_group_preexisting);
 	}
 
 	igt_describe("Validate ctx_restore_post_bb");
 	igt_subtest("ctx-restore-post-bb") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+								      &configfs_group_preexisting);
 		test_ctx_restore(configfs_device_fd, "post", engine);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
+						configfs_group_preexisting);
 	}
 
 	igt_describe("Validate ctx_restore_mid_bb with invalid options");
 	igt_subtest("ctx-restore-mid-bb-invalid") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+								      &configfs_group_preexisting);
 		test_ctx_restore_invalid(configfs_device_fd, "mid");
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
+						configfs_group_preexisting);
 	}
 
 	igt_describe("Validate ctx_restore_mid_bb");
 	igt_subtest("ctx-restore-mid-bb") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+								      &configfs_group_preexisting);
 		test_ctx_restore(configfs_device_fd, "mid", engine);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
+						configfs_group_preexisting);
 	}
 
 	igt_fixture() {
diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index bae9eca27..015b22051 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -40,6 +40,8 @@
 
 static char bus_addr[NAME_MAX];
 
+static bool configfs_group_preexisting;
+
 static void ignore_wedged_in_dmesg(void)
 {
 	/* this is needed for igt_runner so it will ignore it */
@@ -162,7 +164,7 @@ static void restore(int sig)
 	igt_kmod_unbind("xe", bus_addr);
 
 	configfs_fd = igt_configfs_open("xe");
-	if (configfs_fd >= 0)
+	if (configfs_fd >= 0 && !configfs_group_preexisting)
 		igt_fs_remove_dir(configfs_fd, bus_addr);
 	close(configfs_fd);
 
@@ -194,17 +196,6 @@ static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pc
 	}
 }
 
-static int create_device_configfs_group(int configfs_fd)
-{
-	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
-	int configfs_device_fd;
-
-	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
-	igt_assert(configfs_device_fd);
-
-	return configfs_device_fd;
-}
-
 static void test_spinner_after_recovery(int fd)
 {
 	uint64_t ahnd;
@@ -232,7 +223,8 @@ int igt_main()
 		igt_device_get_pci_slot_name(fd, bus_addr);
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+								      &configfs_group_preexisting);
 		igt_install_exit_handler(restore);
 	}
 
@@ -269,8 +261,8 @@ int igt_main()
 	}
 
 	igt_fixture() {
-		igt_fs_remove_dir(configfs_fd, bus_addr);
-		close(configfs_device_fd);
+		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
+						configfs_group_preexisting);
 		close(configfs_fd);
 		drm_close_driver(fd);
 	}
-- 
2.43.0

