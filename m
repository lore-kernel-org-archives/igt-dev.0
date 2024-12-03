Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68347E69EBD
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 22:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2363410E252;
	Tue,  3 Dec 2024 22:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YewNPhp/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2258710E276
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 22:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733265135; x=1764801135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8VJki55HW15NZa84wlo2q8iIVXIZ4EbYT5YQsvKIXdo=;
 b=YewNPhp//MhpAVUwy9I3miIrzFHDjeAQ3jO8Dgt/v7bVMnNX/a1zjG2v
 yTW64APAWoR8nSmTmusT7xaedO59d9HahQjZjj3RG8enwroixO4Lpd2hv
 k8dDhprbXlX0XE1bnNgvsHo0iRa1/+AVGYWD/DV4t7ewKC2XzZ5lAyWGS
 yGt4PaeYNKEb5mCox9nVv/F/UucVvqGSwxYOsXadmKYLwcdKoETqpbcL7
 a0eAr1neBeX+Ei1NkN/MW6hW0XRUM4vbFJRf4bk6bKs2QURuIiTKIP9OJ
 BWsTFHIVqT7PnnSRWiMmF1AQDlyPiGYeejFQ4C6ozrAEIa6OWmjbIBiKv A==;
X-CSE-ConnectionGUID: HZ+n8dZoTkaO/KS8uq3egw==
X-CSE-MsgGUID: WsP1P5enSnuxuaeGStGCtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44119885"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="44119885"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 14:32:14 -0800
X-CSE-ConnectionGUID: IcNrOqUES1SpsLGjc8Aj6A==
X-CSE-MsgGUID: FwrOJIZZROaeHuiUimquGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98585827"
Received: from dut4066lnl.fm.intel.com ([10.105.8.83])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 14:32:14 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v9 1/4] lib/igt_sysfs: Add engine list helpers
Date: Tue,  3 Dec 2024 22:32:10 +0000
Message-ID: <20241203223213.81798-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203223213.81798-1-jonathan.cavitt@intel.com>
References: <20241203223213.81798-1-jonathan.cavitt@intel.com>
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
 lib/igt_sysfs.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 64 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 00d5822fd3..eaf8fd8829 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1307,6 +1307,67 @@ static uint16_t xe_get_engine_class(char *name)
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
+	const int array_max = 16;
+	int *ret = calloc(array_max, sizeof(int));
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
+		igt_assert_lt(size, array_max);
+		ret[size] = openat(engines, de->d_name, O_RDONLY);
+		if (ret[size] < 0) {
+			ret[size] = 0;
+			continue;
+		}
+		size += 1;
+	}
+
+	igt_assert_lt(size, array_max);
+	ret[size] = -1;
+
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

