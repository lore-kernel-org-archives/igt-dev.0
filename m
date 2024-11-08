Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A805D5C0F6
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 16:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0766410E9FD;
	Fri,  8 Nov 2024 16:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRjlUV49";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B63410E9FC
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731081638; x=1762617638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ILhvWemzOSNSbmoE2MSetagTSRDJQw0TMrbF4fYyN6M=;
 b=iRjlUV49tjjGORxfu4/jUjLowPn2F2xAWt6mIfkLjcMtrstCWVodIR1h
 8TfDF1080Ep9hLZ7lTaq2jVADvAKRUdHN1TQl/jGqYUoXsUbDlxBQ9BIi
 Hi2Tgi79RMGx/VbzuY5T5OEmuXL/b8LNsOOD/KL5hHSdfbj+bi+cQWpyV
 /IZjsYfn3kY03/OB9dodjJt9uv9O2WR/tYgzjYkDS+ymGAgm/mxd+KGj1
 dVfP0a34qAvgKHeWuOZelUhwyy+qcDjVNc4KWap4OgzNqED9WixPCKCqO
 gjcodhsmJaZuAF4Z3go8SlZ+aDHQ5hI4DWDAK+8Fbzq6fBo25hMBX5gk/ w==;
X-CSE-ConnectionGUID: a/29dHQLT5aK65eYXHh8fg==
X-CSE-MsgGUID: q3/UkNimRymlfyvbBotdHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30738383"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30738383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:38 -0800
X-CSE-ConnectionGUID: XNU7PWl5RWirmzyGK+7Mbg==
X-CSE-MsgGUID: 2HjbqjilSxam1KD0+5A2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86423007"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.246])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:36 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/5] lib/igt_sysfs: Add igt_sysfs_{get,set}_s32
Date: Fri,  8 Nov 2024 16:59:30 +0100
Message-ID: <20241108160021.1202234-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108160021.1202234-1-francois.dugast@intel.com>
References: <20241108160021.1202234-1-francois.dugast@intel.com>
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

Add this family of functions to read and write signed values in sysfs.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  5 ++++
 2 files changed, 76 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 26a3aa31f..00d5822fd 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -873,6 +873,77 @@ void igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
 		     "Failed to write %u to %s attribute (%s)\n", value, attr, strerror(errno));
 }
 
+/**
+ * __igt_sysfs_get_s32:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to read
+ * @value: pointer for storing read value
+ *
+ * Convenience wrapper to read a signed 32bit integer from a sysfs file.
+ *
+ * Returns:
+ * True if value successfully read, false otherwise.
+ */
+bool __igt_sysfs_get_s32(int dir, const char *attr, int32_t *value)
+{
+	if (igt_debug_on(igt_sysfs_scanf(dir, attr, "%d", value) != 1))
+		return false;
+
+	return true;
+}
+
+/**
+ * igt_sysfs_get_s32:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to read
+ *
+ * Convenience wrapper to read a signed 32bit integer from a sysfs file.
+ * It asserts on failure.
+ *
+ * Returns:
+ * Read value.
+ */
+int32_t igt_sysfs_get_s32(int dir, const char *attr)
+{
+	int32_t value;
+
+	igt_assert_f(__igt_sysfs_get_s32(dir, attr, &value),
+		     "Failed to read %s attribute (%s)\n", attr, strerror(errno));
+
+	return value;
+}
+
+/**
+ * __igt_sysfs_set_s32:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to write
+ * @value: value to set
+ *
+ * Convenience wrapper to write a signed 32bit integer to a sysfs file.
+ *
+ * Returns:
+ * True if successfully written, false otherwise.
+ */
+bool __igt_sysfs_set_s32(int dir, const char *attr, int32_t value)
+{
+	return igt_sysfs_printf(dir, attr, "%d", value) > 0;
+}
+
+/**
+ * igt_sysfs_set_s32:
+ * @dir: directory corresponding to attribute
+ * @attr: name of the sysfs node to write
+ * @value: value to set
+ *
+ * Convenience wrapper to write a signed 32bit integer to a sysfs file.
+ * It asserts on failure.
+ */
+void igt_sysfs_set_s32(int dir, const char *attr, int32_t value)
+{
+	igt_assert_f(__igt_sysfs_set_s32(dir, attr, value),
+		     "Failed to write %d to %s attribute (%s)\n", value, attr, strerror(errno));
+}
+
 /**
  * __igt_sysfs_get_u64:
  * @dir: directory corresponding to attribute
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 852b95053..54a408791 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -125,6 +125,11 @@ uint32_t igt_sysfs_get_u32(int dir, const char *attr);
 bool __igt_sysfs_set_u32(int dir, const char *attr, uint32_t value);
 void igt_sysfs_set_u32(int dir, const char *attr, uint32_t value);
 
+bool __igt_sysfs_get_s32(int dir, const char *attr, int32_t *value);
+int32_t igt_sysfs_get_s32(int dir, const char *attr);
+bool __igt_sysfs_set_s32(int dir, const char *attr, int32_t value);
+void igt_sysfs_set_s32(int dir, const char *attr, int32_t value);
+
 bool __igt_sysfs_get_u64(int dir, const char *attr, uint64_t *value);
 uint64_t igt_sysfs_get_u64(int dir, const char *attr);
 bool __igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
-- 
2.43.0

