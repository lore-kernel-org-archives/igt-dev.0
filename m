Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64F5D68BCD
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 17:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEE410E115;
	Fri, 15 Nov 2024 17:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMrbEwBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B7D10E8A9
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731690235; x=1763226235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j1+hrEfNZQ5WBFWjTk6rgVztWc0sGTDCyridvWFNi7A=;
 b=RMrbEwBgY6vbDDicZtjzB7h250YQ+TvZMi48XVApm85dCPJyglm1dQ9T
 qfFj1Z5WYCwYjL64YeBenTcJWdzii3bSYoQNrswkHqvdWBlO5Xl9dG5Ii
 sE2pg8IX2wELigVqa77wYb70SaBo8KbIhu3wbBtN3/7J9jyHfOO8Trny1
 OHBKPeCOJEuK2jF7rUbZHXzDIIf7BfXi2HBv4/ytCrb4bRthqRCY6h3+S
 N9Y79EjUMuzSBqxKI/FjMIU8PeTXAgJaDkUMLttQOAcdOwyuKE/HzBe3F
 rle0AvfpX1QQkvBn8DrJaasiyqvleC9SyslA2PSD2WWZhfJh8zmwII7uy Q==;
X-CSE-ConnectionGUID: bDXAXghkQb+EZi6IEgUJtQ==
X-CSE-MsgGUID: Eh8EzxXBTk6rEwb3jXQ3+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="57119396"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="57119396"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 09:03:53 -0800
X-CSE-ConnectionGUID: VS4CthhrRPujbVpvFadjEA==
X-CSE-MsgGUID: OvuBiG9CQ4Kn4HYq/R1jLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88497735"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 09:03:53 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v6 1/3] lib/igt_sysfs: Add engine list helpers
Date: Fri, 15 Nov 2024 17:03:50 +0000
Message-ID: <20241115170352.102039-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241115170352.102039-1-jonathan.cavitt@intel.com>
References: <20241115170352.102039-1-jonathan.cavitt@intel.com>
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
index 00d5822fd3..ca1e435fce 100644
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

