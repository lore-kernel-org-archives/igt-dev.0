Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B094D73619
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 18:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088E010E80D;
	Mon,  2 Dec 2024 18:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKjW4GdH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074E10E80C
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 18:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733162898; x=1764698898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BTE1cjE2fp0MK36uYYv1tIj85QHRoixuYHDuH5b9vZE=;
 b=cKjW4GdHSw01weBvbcc+KMV5NvXplwEwWi4/d4GLqkciGZLApZJc/7sB
 hdv4p4atxXRuULcHrP0En5nAcdOq7wdSYq7XBPDPL/Xo2C8ZpXtZyA9EB
 Oz5UqgxOQKWGCUhdoUd613m9vS8qR8Ji6Hd8JmjzuyHI36mZTTEj7QiWu
 10J6PX17sTxrlOJRn+U75P8wgp2QILVCGiCZYGkCUAicTgbH02S1BeRZE
 av8FbHkRVZoddnKF5hNNfrgn4QPvaC5aE/7SKR4wxOmDMM+H1vQCZ8ygi
 ky7g2L+5+5+0qOySKB+Xj0I7tq+//rtChOozlpktWgESz/Uyo8caj1aic A==;
X-CSE-ConnectionGUID: 5fJeCdCfSoSBS0vGtupVdg==
X-CSE-MsgGUID: jYCqV1/eQXK6CxETEh+WRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43957023"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="43957023"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 10:08:17 -0800
X-CSE-ConnectionGUID: u3rYfaQ/S++OQ9s9462cnQ==
X-CSE-MsgGUID: 7AIvNCzMSmyYoRUXT5KX1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="124021973"
Received: from dut4066lnl.fm.intel.com ([10.105.8.51])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 10:08:18 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v8 1/4] lib/igt_sysfs: Add engine list helpers
Date: Mon,  2 Dec 2024 18:08:13 +0000
Message-ID: <20241202180816.47538-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202180816.47538-1-jonathan.cavitt@intel.com>
References: <20241202180816.47538-1-jonathan.cavitt@intel.com>
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

Create two new helper functions, igt_sysfs_get_engine_list and
igt_sysfs_free_engine_list, that create and destroy lists of open
engines, respectively.  The list created by igt_sysfs_get_engine_list
can be used to iterate over the set of engines in sysfs/engines and must
be freed by igt_sysfs_free_engine_list after use.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/igt_sysfs.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 63 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 00d5822fd3..efb071bfe9 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1307,6 +1307,66 @@ static uint16_t xe_get_engine_class(char *name)
 	return class;
 }
 
+/**
+ * igt_sysfs_get_engine_list:
+ * @engines: fd of the directory engine
+ *
+ * Iterates over sysfs/engines and returns an array of
+ * opened engines.  The user will be in charge of closing
+ * the opened engines.
+ *
+ * The returned array will always be terminated by a -1.
+ */
+int *igt_sysfs_get_engine_list(int engines)
+{
+	struct dirent *de;
+	DIR *dir;
+#define ARRAY_MAX	16
+	int *ret = calloc(ARRAY_MAX, sizeof(int));
+	int size = 0;
+
+	igt_assert(ret);
+
+	lseek(engines, 0, SEEK_SET);
+
+	dir = fdopendir(engines);
+	if (!dir)
+		close(engines);
+
+	while ((de = readdir(dir))) {
+		if (*de->d_name == '.')
+			continue;
+		ret[size] = openat(engines, de->d_name, O_RDONLY);
+		if (ret[size] < 0) {
+			ret[size] = 0;
+			continue;
+		}
+		size += 1;
+		igt_assert_lt(size, ARRAY_MAX);
+	}
+
+	ret[size] = -1;
+	return ret;
+}
+#undef ARRAY_MAX
+
+/**
+ * igt_sysfs_free_engine_list:
+ * @list: list of opened engines
+ * @size: number of engines in list
+ *
+ * Helper for cleaning up after igt_sysfs_get_engine_list.
+ * Closes all engines in list before freeing the list.
+ */
+void igt_sysfs_free_engine_list(int *list)
+{
+	int i = 0;
+
+	while (list[i] != -1)
+		close(list[i++]);
+	free(list);
+}
+
 /**
  * igt_sysfs_engines:
  * @xe: fd of the device
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 54a4087918..86345f3d1b 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -168,6 +168,9 @@ typedef struct igt_sysfs_rw_attr {
 
 void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
 
+int *igt_sysfs_get_engine_list(int engines);
+void igt_sysfs_free_engine_list(int *list);
+
 void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
 		       void (*test)(int, int, const char **, uint16_t, int));
 
-- 
2.43.0

