Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C395D606A32E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JL7ggixz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5982110E73D;
	Thu, 26 Nov 2026 07:51:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5039D10E234
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795679220; x=1827215220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IEJtHOSgu76HTYhQk10DSPf7Gd+ZFRekj31E+gAw96Q=;
 b=JL7ggixzE2ot+nUy6UNpGWcW3W9G8FlcCqXIfGfrq9r3UkF48i4vhb7p
 VWGvp7OGYLNDht/srKYatmOCNqezUx9cBRYpPYaR5oDqnnaDxH3hSkaXd
 7gvNJu9eXwYcmXgwvw4RrCST9s2/lG4ohFvybKPBBA7/hRWGZn3rslYDr
 YFDpFUnsO/y8dl8gmnGG93kNla/p2ZdHeb3YGX+2yQNnh4KaD8saL/RX+
 qfChXoW9IFCa2KDDWuvLcpTuW+gkcS9Z2tzRNZ8WQ5UP2dlsNNTmNVZtH
 p3LBjHx516XkIGAKqB2r/wV1Ob/95XtYU37u3ocpANq1rD/APZtXzHqz7 Q==;
X-CSE-ConnectionGUID: /Swh56rdSlGmhv1toWiHhw==
X-CSE-MsgGUID: HhXsWrAmRRSNxnVvqWq8Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4566202"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4566202"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:54 -0800
X-CSE-ConnectionGUID: ppZlyUwbQLuJX9TyXrnOew==
X-CSE-MsgGUID: EJwoNpfQSvO0Cng1uGrJPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="11991843"
Received: from hchegond-desk.jf.intel.com ([10.24.80.219])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:55 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, ravi.kishore.koppuravuri@intel.com,
 zbigniew.kempczynski@intel.com, maarten.lankhorst@intel.com,
 alexander.usyskin@intel.com, anshuman.gupta@intel.com,
 soham.purkait@intel.com, riana.tauro@intel.com, nishit.sharma@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t 2/6] lib/xe: Add API for late binding from an input file
Date: Wed, 25 Nov 2026 23:46:42 -0800
Message-ID: <cc41956c90b4da254dfb005a4d4861d8c7023acb.1795677252.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795677252.git.harish.chegondi@intel.com>
References: <cover.1795677252.git.harish.chegondi@intel.com>
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

IGSC library provides an API for late binding but the payload
data has to be in a buffer. Reuse functions from the IGSC library
to create an API for late binding which takes the payload data
in a file.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 lib/meson.build  |   5 ++
 lib/xe/xe_igsc.c | 142 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_igsc.h |  13 +++++
 3 files changed, 160 insertions(+)
 create mode 100644 lib/xe/xe_igsc.c
 create mode 100644 lib/xe/xe_igsc.h

diff --git a/lib/meson.build b/lib/meson.build
index 3ed1369b5..a899047fb 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -258,6 +258,11 @@ if alsa.found()
 	lib_sources += 'igt_alsa.c'
 endif
 
+if igsc.found()
+	lib_deps += igsc
+	lib_sources += 'xe/xe_igsc.c'
+endif
+
 if chamelium.found()
 	lib_deps += chamelium
 	lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
diff --git a/lib/xe/xe_igsc.c b/lib/xe/xe_igsc.c
new file mode 100644
index 000000000..4b6337a28
--- /dev/null
+++ b/lib/xe/xe_igsc.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "igt_core.h"
+#include "xe_igsc.h"
+
+#define CONNECT_RETRIES_SLEEP_SEC	2
+#define MAX_CONNECT_RETRIES		3
+
+static int copy_file_to_buf(const char *p_path, uint8_t **buf, size_t *buf_len)
+{
+	FILE *fp = NULL;
+	uint8_t *pbuf = NULL;
+	long file_size;
+	int ret = 0;
+
+	fp = fopen(p_path, "rb");
+	if (!fp) {
+		igt_warn("Failed to open file %s\n", p_path);
+		ret = -1;
+		goto exit;
+	}
+	if (fseek(fp, 0L, SEEK_END) != 0) {
+		igt_warn("Failed to get file size %s\n", p_path);
+		ret = -1;
+		goto exit;
+	}
+	file_size = ftell(fp);
+	if (file_size < 0) {
+		igt_warn("Failed to get file size %s\n", p_path);
+		ret = -1;
+		goto exit;
+	}
+	if (file_size > IGSC_MAX_IMAGE_SIZE) {
+		igt_warn("Update image size (%ld) too large\n", file_size);
+		ret = -1;
+		goto exit;
+	}
+	if (fseek(fp, 0L, SEEK_SET) != 0) {
+		igt_warn("Failed to reset file position %s\n", p_path);
+		ret = -1;
+		goto exit;
+	}
+	pbuf = malloc((size_t)file_size);
+	if (!pbuf) {
+		igt_warn("Failed to allocate memory\n");
+		ret = -1;
+		goto exit;
+	}
+	if (fread(pbuf, 1, (size_t)file_size, fp) != (size_t)file_size) {
+		igt_warn("Failed to read file %s\n", p_path);
+		ret = -1;
+		free(pbuf);
+		goto exit;
+	}
+	*buf_len = (size_t)file_size;
+	*buf = pbuf;
+exit:
+	if (fp)
+		fclose(fp);
+	return ret;
+}
+
+static int
+late_binding(const char *device_path, const char *payload_path, uint32_t type, uint32_t flags)
+{
+	struct igsc_device_handle handle;
+	char *device_path_found = NULL;
+	unsigned int retries = 0;
+	size_t payload_size = 0;
+	uint8_t *payload = NULL;
+	uint32_t status = 0;
+	int ret;
+
+	memset(&handle, 0, sizeof(handle));
+
+	if (copy_file_to_buf(payload_path, &payload, &payload_size) != 0) {
+		igt_warn("Failed to copy file : %s\n", payload_path);
+		ret = -1;
+		goto exit;
+	}
+	ret = igsc_device_init_by_device(&handle, device_path);
+	if (ret) {
+		igt_warn("Cannot initialize device: %s\n", device_path);
+		goto exit;
+	}
+	while ((ret = igsc_device_update_late_binding_config2(&handle, type, flags,
+							      payload, payload_size,
+							      &status)) == IGSC_ERROR_BUSY) {
+		sleep(CONNECT_RETRIES_SLEEP_SEC);
+		if (++retries >= MAX_CONNECT_RETRIES)
+			break;
+	}
+	if (ret)
+		igt_warn("Failed to send late binding command: %d\n", ret);
+exit:
+	igsc_device_close(&handle);
+
+	free(device_path_found);
+	free(payload);
+	return ret;
+}
+
+/**
+ * xe_igsc_load_firmware:
+ * @fw_file: pointer to late binding payload file name and path.
+ *
+ * Reads the input payload file into a buffer and call function that
+ * sends a late binding HECI command to the firmware with the buffer.
+ *
+ * Returns IGSC_SUCCESS(0) if successful, otherwise error code.
+ */
+int xe_igsc_load_firmware(const char *fw_file)
+{
+	struct igsc_device_iterator *iter;
+	struct igsc_device_info info;
+	int ret;
+
+	if (!fw_file) {
+		igt_critical("Input file missing\n");
+		return -1;
+	}
+
+	ret = igsc_device_iterator_create(&iter);
+	if (ret != IGSC_SUCCESS) {
+		igt_critical("Cannot create device iterator\n");
+		return ret;
+	}
+	info.name[0] = '\0';
+	ret = igsc_device_iterator_next(iter, &info);
+	if (ret == IGSC_SUCCESS)
+		ret = late_binding(info.name, fw_file, CSC_LATE_BINDING_TYPE_DGDIAG, 0);
+	igsc_device_iterator_destroy(iter);
+
+	return ret;
+}
diff --git a/lib/xe/xe_igsc.h b/lib/xe/xe_igsc.h
new file mode 100644
index 000000000..24bb3110b
--- /dev/null
+++ b/lib/xe/xe_igsc.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#ifndef XE_IGSC_H
+#define XE_IGSC_H
+
+#include <igsc_lib.h>
+
+int xe_igsc_load_firmware(const char *fw_file);
+
+#endif /* XE_IGSC_H */
-- 
2.43.0

