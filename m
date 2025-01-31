Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7990C0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 20:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DBA10E207;
	Fri, 31 Jan 2025 20:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbWh1MJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2334C10E207
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738355387; x=1769891387;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NVG3HlQKY3LpDJKTnCAHe7m1bWghXpu7ODL+it7FBVs=;
 b=QbWh1MJSeFGXuY9w0XQKT5VqUrBOA9tgdlv+/ZK0jzef92jNox80phXR
 eM4yrl96XiOSgHUy9VEUfX+iQOBoq2cez09KFT1PV23hIUbIrvwOAN2Cw
 /wgIWxa/ITqwj+/FTNu1zI13TfnB+UkEHlawBDLNhikf9fY1toyR7x5ci
 KOoid1SfdRsvyNnCmtL4Wqwb78DILey5vcxG9P6Khs3mNgkPheI5Vfwri
 tkS6x6klXJ8gMkUDPzRQBA92zLoSpIKJj3qrldL+aWWoAGp4Grz6+ccI/
 IFdCoOCjiSF/i6a7yudtTUq5yPgrNinkQnRAA/ED+XJv/k3o0NJIcJ2j8 A==;
X-CSE-ConnectionGUID: 4jHtaAjdRXeERpDsrtZqvg==
X-CSE-MsgGUID: MCgoZlawRy+zj7cRBnlX4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="56361412"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="56361412"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 12:29:47 -0800
X-CSE-ConnectionGUID: ASRmthN4QP64n3n/IB1ZGA==
X-CSE-MsgGUID: s8qNYmtlRCyFYNPWkryc7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="109659440"
Received: from dut2949atsm.iind.intel.com ([10.49.63.13])
 by orviesa006.jf.intel.com with ESMTP; 31 Jan 2025 12:29:45 -0800
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH 2/2] tools/intel_error_decode: Enable support for xe driver in
 the tool
Date: Fri, 31 Jan 2025 20:29:40 +0000
Message-Id: <20250131202940.1124460-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131202940.1124460-1-sai.gowtham.ch@intel.com>
References: <20250131202940.1124460-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Enables error decode support for xe dumps. which uses intel_error_decode_xe
lib.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tools/intel_error_decode.c | 156 +++++++++++++++++++++++++------------
 1 file changed, 107 insertions(+), 49 deletions(-)

diff --git a/tools/intel_error_decode.c b/tools/intel_error_decode.c
index 451608826..a722621e2 100644
--- a/tools/intel_error_decode.c
+++ b/tools/intel_error_decode.c
@@ -57,7 +57,11 @@
 #include "instdone.h"
 #include "intel_reg.h"
 #include "drmtest.h"
+#include "drm-uapi/xe_drm.h"
 #include "i915/intel_decode.h"
+#include "xe/intel_error_decode_xe_lib.h"
+
+#define XE_KMD_ERROR_DUMP_IDENTIFIER "**** Xe Device Coredump ****"
 
 static uint32_t
 print_head(unsigned int reg)
@@ -793,14 +797,86 @@ static void setup_pager(void)
 	}
 }
 
+static FILE *
+try_open_file(const char *format, ...)
+{
+	int ret;
+	char *filename;
+	FILE *file;
+	va_list args;
+
+	va_start(args, format);
+	ret = vasprintf(&filename, format, args);
+	va_end(args);
+
+	igt_assert(ret > 0);
+	file = fopen(filename, "r");
+	free(filename);
+
+	return file;
+}
+
+static FILE *
+open_i915_core_dump(const char *path)
+{
+	FILE *file = NULL;
+	struct stat st;
+
+	if (stat(path, &st))
+		return NULL;
+
+	if (S_ISDIR(st.st_mode)) {
+		file = try_open_file("%s/i915_error_state", path);
+		if (!file) {
+			int minor;
+			for (minor = 0; minor < 64; minor++) {
+				file = try_open_file("%s/%d/i915_error_state", path, minor);
+				if (file)
+					break;
+			}
+		}
+	} else {
+		file = fopen(path, "r");
+	}
+
+	return file;
+}
+
+static FILE *
+open_xe_core_dump(const char *path)
+{
+	FILE *file = NULL;
+
+	if (path) {
+		struct stat st;
+
+		if (stat(path, &st))
+			return NULL;
+
+		if (S_ISDIR(st.st_mode)) {
+			file = try_open_file("%s/data", path);
+		} else {
+			file = fopen(path, "r");
+		}
+	} else {
+		for (int minor = 0; minor < 64; minor++) {
+			file = try_open_file("/sys/class/drm/card%i/device/devcoredump/data", minor);
+			if (file)
+				break;
+		}
+	}
+
+	return file;
+}
+
 int
 main(int argc, char *argv[])
 {
 	FILE *file;
 	const char *path;
 	char *filename = NULL;
-	struct stat st;
-	int error;
+	char *line = NULL;
+	size_t line_size;
 
 	if (argc > 2) {
 		fprintf(stderr,
@@ -823,69 +899,51 @@ main(int argc, char *argv[])
 
 	if (argc == 1) {
 		if (isatty(0)) {
-			path = "/sys/class/drm/card0/error";
-			error = stat(path, &st);
-			if (error != 0) {
-				path = "/debug/dri";
-				error = stat(path, &st);
+			file = open_i915_core_dump("/sys/class/drm/card0/error");
+			if (!file) {
+				file  = open_i915_core_dump("/debug/dri");
 			}
-			if (error != 0) {
-				path = "/sys/kernel/debug/dri";
-				error = stat(path, &st);
+			if (!file) {
+				file = open_i915_core_dump("/sys/kernel/debug/dri");
 			}
-			if (error != 0) {
+			if (!file) {
+				file = open_xe_core_dump(NULL);
+			}
+			if (file == NULL) {
 				errx(1,
-				     "Couldn't find i915 debugfs directory.\n\n"
+				     "Couldn't find i915 or xe debugfs directory.\n\n"
 				     "Is debugfs mounted? You might try mounting it with a command such as:\n\n"
 				     "\tsudo mount -t debugfs debugfs /sys/kernel/debug\n");
 			}
 		} else {
-			read_data_file(stdin);
-			exit(0);
+			file = stdin;
 		}
 	} else {
 		path = argv[1];
-		error = stat(path, &st);
-		if (error != 0) {
-			fprintf(stderr, "Error opening %s: %s\n",
-					path, strerror(errno));
-			exit(1);
-		}
-	}
+		if (strcmp(path, "-") == 0) {
+				file = stdin;
+		} else {
+			FILE *i915, *xe;
 
-	if (S_ISDIR(st.st_mode)) {
-		int ret;
+			i915 = open_i915_core_dump(path);
+			xe = open_xe_core_dump(path);
 
-		ret = asprintf(&filename, "%s/i915_error_state", path);
-		assert(ret > 0);
-		file = fopen(filename, "r");
-		if (!file) {
-			int minor;
-			for (minor = 0; minor < 64; minor++) {
-				free(filename);
-				ret = asprintf(&filename, "%s/%d/i915_error_state", path, minor);
-				assert(ret > 0);
-
-				file = fopen(filename, "r");
-				if (file)
-					break;
+			if (i915 == NULL && xe == NULL) {
+				fprintf(stderr, "Error opening %s: %s\n", path, strerror(errno));
+				exit(1);
 			}
-		}
-		if (!file) {
-			fprintf(stderr, "Failed to find i915_error_state beneath %s\n",
-					path);
-			exit (1);
-		}
-	} else {
-		file = fopen(path, "r");
-		if (!file) {
-			fprintf(stderr, "Failed to open %s: %s\n",
-					path, strerror(errno));
-			exit (1);
+
+			file = i915 ? i915 : xe;
 		}
 	}
 
-	read_data_file(file);
+	getline(&line, &line_size, file);
+	rewind(file);
+	if (strncmp(line, XE_KMD_ERROR_DUMP_IDENTIFIER, strlen(XE_KMD_ERROR_DUMP_IDENTIFIER)) == 0)
+		read_xe_data_file(file);
+	else
+		read_data_file(file);
+	free(line);
 	fclose(file);
 
 	if (filename != path)
-- 
2.34.1

