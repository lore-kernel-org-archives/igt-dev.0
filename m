Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAF0D591AE
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 18:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789A210E550;
	Mon, 18 Nov 2024 18:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLsRPN6j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BE410E13E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 18:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731953114; x=1763489114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YxbfTBEi8YJV0hqdPIi1PNZzBthwyr98yk9hhEMJbXY=;
 b=QLsRPN6jZAL6yW+oUsczY/EIGSIdHbK19zJsPtHU23gegc7oABqrTO+k
 UnNvPH4PHy/ZNfL5FyUPynunx8y6DH3KG9zaQjzXaO3nggGtrE9keGDOY
 eWYxf3uFcs9h3O2v9IPRykNdOjohIHAieWM93n3X6SQc9IumcsX5q7pwh
 m263gIT4bvBx+jAWJHvnCuLJjMVbJ54NGTa0Vxo+JH8RD1NTvH33qx5mr
 RvaH4f08OO0SHtY+X16DHIlc6RqCIlbt+wPUy5CHaQwAUa74Ia3xcqycC
 FGsnaSAUN0aF1jOoL3un2+YsqzG/vHmY9zkVYS6heVGcts2nsrGwYRbQf g==;
X-CSE-ConnectionGUID: +xitLEVAR82sUhPwyBmxoA==
X-CSE-MsgGUID: yJHhIyVnS/iHOwfgY5rZFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35597458"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="35597458"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:05:13 -0800
X-CSE-ConnectionGUID: pGe002TKQzmn+Zw9cniKKQ==
X-CSE-MsgGUID: agGwi3cVTL+kzBCNwpY0zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89723610"
Received: from dut4411lnl.fm.intel.com ([10.105.10.34])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:05:12 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v7 1/4] lib/igt_sysfs: Add engine list helpers
Date: Mon, 18 Nov 2024 18:05:08 +0000
Message-ID: <20241118180511.64212-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241118180511.64212-1-jonathan.cavitt@intel.com>
References: <20241118180511.64212-1-jonathan.cavitt@intel.com>
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
 lib/igt_sysfs.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 57 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 00d5822fd3..3d2dd364cf 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1307,6 +1307,60 @@ static uint16_t xe_get_engine_class(char *name)
 	return class;
 }
 
+/**
+ * igt_sysfs_get_engine_list:
+ * @engines: fd of the directory engine
+ * @size: pointer to store the size of the returned char pointer
+ *
+ * Iterates over sysfs/engines and returns an array of
+ * opened engines.  The user will be in charge of closing
+ * the opened engines.
+ *
+ * The number of opened engines will be saved to size.
+ */
+int *igt_sysfs_get_engine_list(int engines, int *size)
+{
+	struct dirent *de;
+	DIR *dir;
+	int* ret = calloc(1, sizeof(int));
+
+	lseek(engines, 0, SEEK_SET);
+
+	dir = fdopendir(engines);
+	if (!dir)
+		close(engines);
+
+	*size = 0;
+	while ((de = readdir(dir))) {
+		if (*de->d_name == '.')
+			continue;
+		ret[*size] = openat(engines, de->d_name, O_RDONLY);
+		if (ret[*size] < 0) {
+			ret[*size] = 0;
+			continue;
+		}
+		*size += 1;
+		reallocarray(ret, *size + 1, sizeof(int));
+	}
+	return ret;
+}
+
+/**
+ * igt_sysfs_free_engine_list:
+ * @list: list of opened engines
+ * @size: number of engines in list
+ *
+ * Helper for cleaning up after igt_sysfs_get_engine_list.
+ * Closes all engines in list before freeing the list.
+ */
+void igt_sysfs_free_engine_list(int *list, int size)
+{
+	int i;
+	for (i = 0; i < size; i++)
+		close(list[i]);
+	free(list);
+}
+
 /**
  * igt_sysfs_engines:
  * @xe: fd of the device
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 54a4087918..ba0a74755c 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -168,6 +168,9 @@ typedef struct igt_sysfs_rw_attr {
 
 void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
 
+int *igt_sysfs_get_engine_list(int engines, int *size);
+void igt_sysfs_free_engine_list(int *list, int size);
+
 void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
 		       void (*test)(int, int, const char **, uint16_t, int));
 
-- 
2.43.0

