Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F61606A32C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M/DHNob6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970F010E53A;
	Wed, 18 Nov 2026 15:52:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460BA10FE0E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016735; x=1826552735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yCDATiD/9tQuUq7rNJe5OwBy8Toyp5YyVUrF5PQ1eGU=;
 b=M/DHNob64MCrJkKxNf+D8LKbFZLpdjt8dviVwlwddMav59+NbKy5Iede
 iVk0JexKcxWh/KF9dbDPYHu//VSAKGFhqYQ1slW/HO3mQnmADo/TX4X9R
 JmfW1TGaGGcQbwRZd2f6YW5CArPIb+yHItmZINqHeYPR2tNS5Vj7q7HFI
 uY8Juxx8JQSlh1UqWCFzvXIIokWbn0ajJUGGBPsXJ61aWP6WkiHeVAn6c
 wPXPxV2ck02g97WqFz5g6A97j0rnHAWktLQnPhkpoCSJIVfWNKgfQU8l0
 OrAMStXZMKLY8YSWR60RTM2eAfM2igWLC6Px0EvJcIoQfc42/NwNQzdOU A==;
X-CSE-ConnectionGUID: PVInVlubQHKqfjd8G7kGMQ==
X-CSE-MsgGUID: GjsBr0YjTDSkJbRTjz9wBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3720350"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3720350"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:35 -0800
X-CSE-ConnectionGUID: EfUQhxmbQ36UslSpx6Ma9A==
X-CSE-MsgGUID: XKLpt6w+R6+WbkSYZHbWzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10319381"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:33 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, pranay.samala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/8] lib/igt_params: Fall back to intel_display module
 parameters
Date: Wed, 18 Nov 2026 21:14:16 +0530
Message-ID: <20261118154426.345883-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118154426.345883-1-jeevan.b@intel.com>
References: <20261118154426.345883-1-jeevan.b@intel.com>
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

With display split into a dedicated intel-display.ko, display module
parameters move from /sys/module/<driver>/parameters to
/sys/module/intel_display/parameters.

Add igt_display_params_open() to open the intel_display parameters
directory, and make igt_params_get()/igt_params_set() search the GPU
driver module first and then intel_display. Existing tests keep working
unchanged on kernels both with and without the dedicated display module.
igt_params_open() is unchanged.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_params.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 lib/igt_params.h |  1 +
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index 3dad317a5..c95c88b87 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -28,6 +28,7 @@
 #include <stdio.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
+#include <unistd.h>
 
 #include <i915_drm.h>
 
@@ -156,6 +157,45 @@ int igt_params_open(int device)
 	return params;
 }
 
+/**
+ * igt_display_params_open:
+ *
+ * Opens the module parameters directory of the dedicated intel_display
+ * module (/sys/module/intel_display/parameters). On kernels where display is
+ * still built into the GPU driver module this directory does not exist.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_display_params_open(void)
+{
+	return open("/sys/module/intel_display/parameters", O_RDONLY);
+}
+
+/*
+ * Open the params directory that holds @parameter: the GPU driver module
+ * first, then the intel_display module. This keeps tests working on kernels
+ * with and without a dedicated display module.
+ */
+static int params_open_for(int device, const char *parameter)
+{
+	int dir;
+
+	dir = igt_params_open(device);
+	if (dir >= 0 && faccessat(dir, parameter, F_OK, 0) == 0)
+		return dir;
+	if (dir >= 0)
+		close(dir);
+
+	dir = igt_display_params_open();
+	if (dir >= 0 && faccessat(dir, parameter, F_OK, 0) == 0)
+		return dir;
+	if (dir >= 0)
+		close(dir);
+
+	return -1;
+}
+
 /**
  * __igt_params_get:
  * @device: fd of the device
@@ -172,7 +212,7 @@ char *__igt_params_get(int device, const char *parameter)
 	char *str;
 	int dir;
 
-	dir = igt_params_open(device);
+	dir = params_open_for(device, parameter);
 	if (dir < 0)
 		return NULL;
 
@@ -189,7 +229,7 @@ static bool __igt_params_set(int device, const char *parameter,
 	int dir;
 	int ret;
 
-	dir = igt_params_open(device);
+	dir = params_open_for(device, parameter);
 	if (dir < 0)
 		return false;
 
@@ -230,7 +270,9 @@ bool igt_params_set(int device, const char *parameter, const char *fmt, ...)
  *
  * Save original value to be restored by exit handler. Parameter is first
  * searched at debugfs/dri/N/<device>_params and if not found will look for
- * parameter at /sys/module/<device>/parameters.
+ * parameter at /sys/module/<device>/parameters. If the parameter is not found
+ * there either, the dedicated intel_display module is searched at
+ * /sys/module/intel_display/parameters.
  *
  * Giving -1 here for default device will search for matching device from
  * debugfs/dri/N where N go from 0 to 63. First device found from debugfs
diff --git a/lib/igt_params.h b/lib/igt_params.h
index 6494786f0..f2ec44d1f 100644
--- a/lib/igt_params.h
+++ b/lib/igt_params.h
@@ -27,6 +27,7 @@
 #include <stdbool.h>
 
 int igt_params_open(int device);
+int igt_display_params_open(void);
 
 char *__igt_params_get(int device, const char *parameter);
 
-- 
2.43.0

