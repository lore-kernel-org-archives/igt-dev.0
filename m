Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB92CEDD90
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 12:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D067510E6E9;
	Wed,  9 Oct 2024 12:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NX/ID9kE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B721110E6FE
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 12:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728477136; x=1760013136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oa0voHnKQzJfsZN492UuAF32N8rjUTzVN1MEnyZ5x2Q=;
 b=NX/ID9kEty0Nzl6Vt7RbISTj5MSvDThmWn/LUYaq0tR9BJPuzwnaWhOX
 nHIBXGbkNT8ZjcfBvpnCKQ+SejvkC6kSUoycy5Sj1tHDblBrvfO3SIXws
 MiQHcmYwbOYtIh2zReylfpN1U9tTUk0aqv1SYXgagUPNQFqXFTgkJDEr7
 E79JiNMsD+WyNP2Wvb7KWFQI9S/P7Ao309zcJm8BbyhtDjIwkdOYSudvT
 r3IvCICHWZFBKGg7CQpulSAytUrvwaurGv6rmkSjeJvgnguX/5p66Wbra
 55feWXU/t0AbGncLgNg2hFNqYdi35ePPuoVcfT6GbBmvSJq+PTmuoDvWc g==;
X-CSE-ConnectionGUID: 3R3hb3LrQ1+9Tbnphm3VfQ==
X-CSE-MsgGUID: BsrRhTRNTDqr0ZJ5lWTb/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38336514"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="38336514"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 05:32:16 -0700
X-CSE-ConnectionGUID: 2yf4uJ75QjSbxp9YgLmZxg==
X-CSE-MsgGUID: cNcC+5rwTYW6tPn4vSApRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="75831919"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fdugast-desk.intel.com) ([10.245.244.97])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 05:32:14 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_sysfs: Add igt_sysfs_{get,set}_s32
Date: Wed,  9 Oct 2024 14:28:48 +0200
Message-ID: <20241009123141.86800-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009123141.86800-1-francois.dugast@intel.com>
References: <20241009123141.86800-1-francois.dugast@intel.com>
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
---
 lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  5 ++++
 2 files changed, 76 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index b7746a1ec..56279d958 100644
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
index 0ee253826..1bf026bed 100644
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

