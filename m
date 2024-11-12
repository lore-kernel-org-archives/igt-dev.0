Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8439D3ABFB
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 13:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E5710E5F6;
	Tue, 12 Nov 2024 13:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTgviffi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E1410E5ED
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731418249; x=1762954249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ILhvWemzOSNSbmoE2MSetagTSRDJQw0TMrbF4fYyN6M=;
 b=GTgviffiB/aSG2mA3XGgw1UbzapJKFbYwTm0OwGDXHEmG8FC/Znpv4Vq
 amA+5xO+U+XIJHbkG/64YWSX27wqMsRrATl1xR1Ge1TPbf1Nd0yfFYeeV
 Ok+tv4g8KZDOwQE6U6+s7pl8DddTmnA6kgBtEeygWYW0+DqNfhtVpsQ2u
 ioM+LVpPrhs/zQe8Nrm8AKVq50Jnx2rSsHUrpfETn/oBSpEFOb5AT/o0r
 Okv9Kzorwuyz3WuYrb9g7+UPjPFRiH8BoWLTHoGKe4HSSpZ0fJhLorCZm
 fSeydrLR4hifqTZGXwr+7BQX6Tq5rQvESExKJnqi8DQr+bddbOX9/Us9i w==;
X-CSE-ConnectionGUID: zWnxYjLIQfCaOI1TtLZCaw==
X-CSE-MsgGUID: snW1AfIyTrOwfoPtRtrNkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34118263"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="34118263"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:49 -0800
X-CSE-ConnectionGUID: AC6q9+EdRzSu6kmjIfJgFg==
X-CSE-MsgGUID: 0GT6K9z7TeWrNdXo0Q4+tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="92237840"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.113])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:47 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t,v3 2/5] lib/igt_sysfs: Add igt_sysfs_{get,set}_s32
Date: Tue, 12 Nov 2024 14:29:51 +0100
Message-ID: <20241112133034.1919573-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112133034.1919573-1-francois.dugast@intel.com>
References: <20241112133034.1919573-1-francois.dugast@intel.com>
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

