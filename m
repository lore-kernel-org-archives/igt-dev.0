Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AF3CAC58F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 07:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED2010E325;
	Mon, 15 Sep 2025 07:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9jWyjWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7601F10E325
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757922049; x=1789458049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2W67WzoRIyNCZPp2I4NHWL7kKKoVGJAqu/cwZasHm4Q=;
 b=J9jWyjWJm1J9sz6SAEiTH5W57XnRD0T1HeJ/UVXBmzyVKcjhJ0IebpJz
 alZhivsIdkfMj+QdjqVVFfAhv7GlkpcEyAWJICUgRxSz650My4la0tm0V
 KHPNzLYaGiPKBHo++WpNOizH/lzuH2sAAzVlWXaNHtQQwoV/8+QzeF1at
 GJYnEeksyzI9La+XnkrhlbTyShFOTHOiTVXZhL6mSDxmzx39AMFuzsgcN
 bdOg/NEK9U4+YLZvqIBVmzqpUFAHCYDnFswmZbYm27x5iW8ajgf0idUO6
 VOne2zae2a3VeMnYn9WRHFD7j+eBQgrkx/KlaVeRvDug+WX1/ovY06yqx w==;
X-CSE-ConnectionGUID: bX1t8sA8RxK8kwii4xvi8w==
X-CSE-MsgGUID: z9AjSwaVTUawykRLshhW7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60233865"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="60233865"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:40:49 -0700
X-CSE-ConnectionGUID: ySInfsQmT8mVMKyAbG3p/g==
X-CSE-MsgGUID: s66TpLMeRhSWGEc99WxtZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="173687271"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 15 Sep 2025 00:40:48 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/kms_concurrent: Add SYSVIPC support check
Date: Mon, 15 Sep 2025 13:02:31 +0530
Message-Id: <20250915073231.2093842-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915073231.2093842-1-s.sebinraj@intel.com>
References: <20250915073231.2093842-1-s.sebinraj@intel.com>
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

Check for System V IPC support in kms_concurrent test to handle
targets that don't have SYSVIPC enabled in their kernel. Without this
check, the test would fail with assertion errors when trying to use
message queues.

The implementation checks if the target supports IPC,
if not found it skips the test.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 lib/igt_core.h         |  2 ++
 tests/kms_concurrent.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 6f462205f..413e83bc8 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -45,6 +45,8 @@
 #include <getopt.h>
 #include <unistd.h>
 
+bool device_supports_sysvipc(void);
+
 #ifdef __FreeBSD__
 #include "igt_freebsd.h"
 #endif
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 4f16f8b89..80512a140 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -107,6 +107,22 @@ static void test_fini(data_t *data, enum pipe pipe, int n_planes,
 	data->fb = NULL;
 }
 
+/**
+ * Checks if the current device supports SYSVIPC by verifying the existence and accessibility
+ * of the /proc/sysvipc directory.
+ * Returns: true if accessible for read and write, false otherwise.
+ */
+bool device_supports_sysvipc(void)
+{
+	char path[128] = {'\0'};
+
+	snprintf(path, sizeof(path), "/proc/sysvipc");
+	if (access(path, R_OK | W_OK) == 0)
+		return true;
+
+	return false;
+}
+
 static void
 create_fb_for_mode_position(data_t *data, drmModeModeInfo *mode,
 			    int *rect_x, int *rect_y,
@@ -395,6 +411,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
+		igt_require(device_supports_sysvipc());
+
 		if (is_intel_device(data.drm_fd))
 			intel_allocator_multiprocess_start();
 	}
-- 
2.34.1

