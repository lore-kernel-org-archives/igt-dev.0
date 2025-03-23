Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34C3C36008
	for <igt-dev@archiver.kernel.org>; Sun, 23 Mar 2025 19:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C7B10E194;
	Sun, 23 Mar 2025 19:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAwBZVKK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3F610E194
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Mar 2025 19:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742757966; x=1774293966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t7OECWRcDy1VLO9badwLInNv1x8nssGdRAcVVMbxqCQ=;
 b=GAwBZVKKIakA8Zy9u6V7F+8/LySG/7aX74ND/gD4LGmMGdCE+pf6nffV
 aUIygIMRX15mYzTHpxlcHqZkh2IVkjmw241+qgkHq+uVUuAzACLjPShp8
 qHzv2SuX5UNif9vLMcymk5M8gOui/CWNuzyEwfzBPwWmhAn0L1vj28ase
 H3P23TFvGIh26PBcgN8kK2j08rP9dqy917aDNlVbxyHaaqxAOjWfSdPzS
 k8RjD/rswFMyuYxaeIOes+TWiqRwVwe3oH7SeK6776VYZ6b3uWopnTsaP
 0SJ1f2Tf4wFWBXQydj7bhRiEjwC3YpLPPgX5AI2MHwIe2zKPcuY9Ckb7n Q==;
X-CSE-ConnectionGUID: O86h73tjQHGx7HGqUkGSBA==
X-CSE-MsgGUID: MPS0rzkiQTOonMwUUAYfPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43886200"
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; d="scan'208";a="43886200"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 12:26:03 -0700
X-CSE-ConnectionGUID: NLN1smQRS5SO11RV55aUzA==
X-CSE-MsgGUID: LLgu0floS7KWrmekMjCa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; d="scan'208";a="123656514"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2025 12:26:01 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] lib/igt_kms: Function for executing cmd and capturing
 message from dmesg
Date: Mon, 24 Mar 2025 00:55:55 +0530
Message-ID: <20250323192555.147825-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
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

The function is designed to execute a command and capture its output
into a buffer from dmesg, while providing robust error handling.
It validates input parameters, executes the command, reads the output,
and manages resource cleanup. The purpose is to facilitate capturing and
processing command results in applications, ensuring errors are
logged and handled appropriately.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cc3bb3ae7..6a6269964 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7439,3 +7439,56 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 	return 0;
 }
+
+/**
+ * igt_check_dmesg:
+ * @command:		The command to execute.
+ * @output_buffer:	Buffer to store the command output.
+ * @buffer_size:	Size of the output buffer.
+ *
+ * Executes a system command related to igt testing and captures its output.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int igt_check_dmesg(const char *command, char *output_buffer, size_t buffer_size)
+{
+	int result;
+	size_t output_len;
+	FILE *process_stream;
+	size_t total_read = 0;
+
+	if (!command || !output_buffer || buffer_size <= 0) {
+		igt_warn("Invalid parameters in %s!\n", __func__);
+		return -EINVAL;
+	}
+
+	process_stream = popen(command, "r");
+	if (!process_stream) {
+		igt_warn("Failed to open process stream in %s: %s\n", __func__, strerror(errno));
+		return -EIO;
+	}
+
+	memset(output_buffer, 0, buffer_size);
+	while (fgets(output_buffer + total_read, buffer_size - total_read, process_stream)) {
+		size_t len = strlen(output_buffer + total_read);
+
+		total_read += len;
+		if (total_read >= buffer_size - 1) {
+			igt_warn("Output truncated in %s due to buffer size limit.\n", __func__);
+			break;
+		}
+	}
+
+	result = pclose(process_stream);
+	if (result == -1) {
+		igt_warn("Failed to close process stream in %s!\n", __func__);
+		return -EIO;
+	}
+
+	/* Remove trailing newline if present */
+	output_len = strlen(output_buffer);
+	if (output_len > 0 && output_buffer[output_len - 1] == '\n')
+		output_buffer[output_len - 1] = '\0';
+
+	return 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 27b545f52..3bdb508eb 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1279,5 +1279,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 			   char *link_rate, char *lane_count);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
+int igt_check_dmesg(const char *command, char *output_buffer, size_t buffer_size);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

