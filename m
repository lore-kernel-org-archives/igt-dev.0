Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD5DCFD346
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 18:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5466C10E2C3;
	Mon, 24 Nov 2025 18:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJdQ/6Mj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B87210E320
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 18:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764008915; x=1795544915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QzAf1PbFEQeX5e8isT51FkQUiwrhLML+R4DMQXSjzNo=;
 b=nJdQ/6MjjBoFaVT7v5haJFZAUePdAU3N/Qj/LcCm8IJCPony3XK/MyYc
 6JBclINwpAXT0HmisxHe5ZpwkDW1TwcojzHFYjcejnW3LB9olaPGG/gxx
 oqa0bi+runy36QjKPz50UKO3JPOR0jgMBV10J2ARfRCl2Wv9YEd64pKrP
 uKxYBHMQ1sYjUQIm9JvkgT8YTu5f+5ukAjvUwjf9rRcJea8aWgNQwtqVI
 1Ez6XVisa5s8Q9nwPzATXkdG3njOQ0GM1wGoQqvw3btc4mhst72p+nMdD
 5ikRJCj5HsaFR9dlKzQKJ0r4/ph8vuQuKLMrdbdn6WtIYaJrmyvEKqE5c g==;
X-CSE-ConnectionGUID: qVLWmkhvR16nklyGdcq2ug==
X-CSE-MsgGUID: Yzt3SjKiR/GNQYVvkbgnHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66055396"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66055396"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 10:28:35 -0800
X-CSE-ConnectionGUID: nX21+6CmQDiiFRNSFtGpdw==
X-CSE-MsgGUID: wa1O8zTUSzeaTRy8GVgGIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="215747212"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:28:35 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, suraj.kandpal@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 5/6] lib/igt_kms: Add helper to get eDP/DP supported
 link rates
Date: Mon, 24 Nov 2025 23:57:55 +0530
Message-ID: <20251124182804.2095722-6-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124182804.2095722-1-jeevan.b@intel.com>
References: <20251124182804.2095722-1-jeevan.b@intel.com>
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

Add igt_get_supported_link_rates to parse debugfs and return available
eDP/DP link rates for a given connector.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c03cfed09..4071aa00a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7632,3 +7632,55 @@ bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
                                               buf, sizeof(buf));
         return res == 0;
 }
+
+/**
+ * igt_get_supported_link_rates:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: All the link rates supported by the connector
+ */
+int igt_get_supported_link_rates(int drmfd, char *connector_name,
+		       int *rates, int max_rates)
+{
+	char buf[48];
+	int fd, res;
+	int count = 0;
+	char *token, *star;
+
+	if (!rates || max_rates <= 0) {
+		return -1;
+        }
+
+	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	igt_assert_lte(0, fd);
+
+	res = igt_debugfs_simple_read(fd, "i915_dp_force_link_rate", buf, sizeof(buf));
+	igt_require(res > 0);
+
+	igt_require_f(res > 0,
+		      "Unable to read i915_dp_force_link_rate for %s\n",
+		      connector_name);
+
+	buf[res] = '\0'; /* Null terminate */
+	token = strtok(buf, " \t\n");
+
+	while (token && count < max_rates) {
+		if (!strcmp(token, "[auto]")) {
+			token = strtok(NULL, " \t\n");
+			continue;
+		}
+
+		star = strchr(token, '*');
+		if (star)
+			*star = '\0';
+
+		if (isdigit(token[0])) {
+			rates[count++] = atoi(token);
+		}
+
+		token = strtok(NULL, " \t\n");
+	}
+
+	return count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index cd9f6840a..474a809ea 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1303,6 +1303,8 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 uint32_t igt_get_connected_output_count(igt_display_t *display);
+int igt_get_supported_link_rates(int drmfd, char *connector_name, int *rates,
+				 int max_rates);
 
 drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
-- 
2.43.0

