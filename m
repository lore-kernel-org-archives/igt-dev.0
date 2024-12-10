Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F245E77182
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 09:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15F910E847;
	Tue, 10 Dec 2024 09:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwcZnrr3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E5F10E844
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733822494; x=1765358494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qd6Kynda4/Ygx2AIdQ7HKkABYT+NWmGRc9PRfm0zPhI=;
 b=bwcZnrr3rn1WySjDy9u76QpxlJfCvx2uHadRuyUogPd0sTVW7xkaqJYh
 Ldqoiev/GoF2B4GTqIrIcnk/B/L6vGMS4F3R+LeI8HAFSpPjFou3mrTvy
 5ig8iTXwar5pgYG0vrcn+t1ccuV2PCWU0uP1zm+U/MfiHPu+7zpBPS+Ox
 5TA0J+lyAqiHTk0NcC+xGGIBAlodJlJ/+SyKx5aDrCJTNxOJnG0Pf2lro
 deY0bKTwSKZpYnpDXi8sc5jPizkzNDfWKyKiIJ6ZUDNrzt4yNec9qdsuD
 /Hpb1iWr8EMEO6q4CexWWvoCTWc9ExHr8xCPTthlkORP6JGfITh3CDgzE Q==;
X-CSE-ConnectionGUID: j2bLzR19RyyacwiXyBi6zA==
X-CSE-MsgGUID: zKwQgk+QRdu30i/0lmKUoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34294765"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34294765"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 01:21:34 -0800
X-CSE-ConnectionGUID: jcTdZdHpTg6vXlbq8Opdqw==
X-CSE-MsgGUID: ldGh/8lfSi2f5Y3u13uenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="118599225"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.231])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 01:21:33 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/2] lib/igt_sysfs: Add helper to set the CPU scaling
 governor
Date: Tue, 10 Dec 2024 10:19:32 +0100
Message-ID: <20241210092119.1556652-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210092119.1556652-1-francois.dugast@intel.com>
References: <20241210092119.1556652-1-francois.dugast@intel.com>
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

CPU scaling governor is relevant for IGT to have reproducible results
when it comes to tests duration on a given machine. Add helpers to
set it easily from IGT, removing the need for an external script.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/igt_sysfs.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 55 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index f33478cea..68cb53981 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1690,3 +1690,55 @@ uint32_t xe_sysfs_get_gt_freq(int xe_device, int gt, const char *freq_name)
 	close(gt_fd);
 	return freq;
 }
+
+static char *xe_sysfs_cpu_path(int cpu, char *path, int pathlen)
+{
+	snprintf(path, pathlen, "/sys/devices/system/cpu/cpu%d", cpu);
+
+	if (!access(path, F_OK))
+		return path;
+	return NULL;
+}
+
+/**
+ * xe_sysfs_get_num_cpus:
+ *
+ * Reads number of CPU sysfs entries.
+ * Asserts for at least one CPU entry.
+ * (see xe_sysfs_cpu_path).
+ *
+ * Returns: Number of CPUs.
+ */
+int xe_sysfs_get_num_cpus(void)
+{
+	int num_cpus = 0;
+	char path[96];
+
+	while (xe_sysfs_cpu_path(num_cpus, path, sizeof(path)))
+		++num_cpus;
+
+	igt_assert_f(num_cpus > 0, "No CPU sysfs entry is found.");
+
+	return num_cpus;
+}
+
+/**
+ * xe_sysfs_set_cpu_governor
+ * @cpu: CPU number
+ * @governor: CPU scaling governor
+ *
+ * Set the scaling governor of one CPU.
+ *
+ */
+void xe_sysfs_set_cpu_governor(int cpu, const char *governor)
+{
+	char path[96];
+	int sysfs;
+
+	sysfs = open(xe_sysfs_cpu_path(cpu, path, sizeof(path)), O_DIRECTORY);
+	igt_assert(sysfs);
+
+	igt_assert(igt_sysfs_set(sysfs, "cpufreq/scaling_governor", governor));
+
+	close(sysfs);
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 6a141a5de..b44545851 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -200,4 +200,7 @@ bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, c
 int xe_sysfs_set_gt_freq(int fd, int gt_id, const char *freq_name, uint32_t freq);
 uint32_t xe_sysfs_get_gt_freq(int fd, int gt_id, const char *freq_name);
 
+int xe_sysfs_get_num_cpus(void);
+void xe_sysfs_set_cpu_governor(int cpu, const char *governor);
+
 #endif /* __IGT_SYSFS_H__ */
-- 
2.43.0

