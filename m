Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F84C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 16:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D7F10E705;
	Tue, 11 Feb 2025 16:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLJxxJMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F94310E705
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739291369; x=1770827369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KOqohFcdSaxzcgn3BSbcUTga1u4AweGJ0u25UrC4HxE=;
 b=jLJxxJMgvVvDNr9VE9s24bOPClvnhU7x5bEa+SQLCzJBmy9cOrIFY2aF
 2y3CbmNfqZAjuJ4xQexBGkJOpI6jiRYHWFjFWG3lA5qYb6hmL5t77kyfx
 4dZRWWbyA48PLVexp8zO1gRwFA5g2+pS67EIMqiGFYsMFTsWviesTmgdc
 zgSH0sXLSZXGNXNc8ULY9kCGSWm34uF3tdLUV6l1tchDNzBrFolS5xY4h
 NFPam7tetqXk6q/eK3xxiuRRLxoS1ivJgilBJvHbvmiOisfh5PYVqD/P6
 M2WwucS2+GVi4WNUYz99U5KoUvSza3adhyBjvx0FJTXzumBevhBOHvlq5 Q==;
X-CSE-ConnectionGUID: hdiffL53QAGYsFxKdR7uxQ==
X-CSE-MsgGUID: VNXHai8MTfiPvytfTJwV8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39113941"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="39113941"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:29:29 -0800
X-CSE-ConnectionGUID: xbdAD9UySDO5rCUV5C1rUA==
X-CSE-MsgGUID: BIToWkzWSPuIN8Uy8UoEOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116643050"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:29:27 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v3 1/4] lib/xe/xe_sriov_debugfs: Add helper to read VF's
 configuration data
Date: Tue, 11 Feb 2025 17:29:16 +0100
Message-Id: <20250211162919.15076-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250211162919.15076-1-lukasz.laguna@intel.com>
References: <20250211162919.15076-1-lukasz.laguna@intel.com>
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

Add helper allowing to read configuration data that VF queried from GuC
during probe.

v2:
 - remove redundant fd closing (Marcin)
 - move helper to xe_sriov_debugfs lib (Marcin)
v3:
 - apply style corrections reported by checkpatch (Marcin)

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/xe/xe_sriov_debugfs.c | 78 +++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h |  5 +++
 2 files changed, 83 insertions(+)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index abb1bf7d5..8f30fa312 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -471,3 +471,81 @@ DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool *, get_boolean, __igt_sysfs_get_boolean)
  * Return: 0 on success, negative error code on failure.
  */
 DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(bool, set_boolean, __igt_sysfs_set_boolean)
+
+/**
+ * __xe_sriov_vf_debugfs_get_selfconfig - Read VF's configuration data.
+ * @vf: VF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @gt_num: GT number
+ * @value: Pointer to store the read value
+ *
+ * Reads the specified shared resource @res from selfconfig of given VF device
+ * @vf on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
+					 unsigned int gt_num, uint64_t *value)
+{
+	FILE *file;
+	size_t n = 0;
+	char *line = NULL;
+	int fd, ret = 0;
+
+	fd = igt_debugfs_gt_open(vf, gt_num, "vf/self_config", O_RDONLY);
+	if (fd < 0)
+		return fd;
+	file = fdopen(fd, "r");
+	if (!file) {
+		close(fd);
+		return -errno;
+	}
+
+	while (getline(&line, &n, file) >= 0) {
+		switch (res) {
+		case XE_SRIOV_SHARED_RES_CONTEXTS:
+			ret = sscanf(line, "GuC contexts: %lu", value);
+			break;
+		case XE_SRIOV_SHARED_RES_DOORBELLS:
+			ret = sscanf(line, "GuC doorbells: %lu", value);
+			break;
+		case XE_SRIOV_SHARED_RES_GGTT:
+			ret = sscanf(line, "GGTT size: %lu", value);
+			break;
+		case XE_SRIOV_SHARED_RES_LMEM:
+			ret = sscanf(line, "LMEM size: %lu", value);
+			break;
+		}
+
+		if (ret > 0)
+			break;
+	}
+
+	free(line);
+	fclose(file);
+
+	return ret ? 0 : -1;
+}
+
+/**
+ * xe_sriov_vf_debugfs_get_selfconfig - Read VF's configuration data.
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_vf_debugfs_get_selfconfig().
+ * Instead of returning an error code, it returns the quota value and asserts
+ * in case of an error.
+ *
+ * Return: The quota for the given shared resource.
+ *         Asserts in case of failure.
+ */
+uint64_t xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
+					    unsigned int gt_num)
+{
+	uint64_t value;
+
+	igt_fail_on(__xe_sriov_vf_debugfs_get_selfconfig(vf, res, gt_num, &value));
+
+	return value;
+}
diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
index cd5f932be..4983afbb3 100644
--- a/lib/xe/xe_sriov_debugfs.h
+++ b/lib/xe/xe_sriov_debugfs.h
@@ -39,4 +39,9 @@ int __xe_sriov_pf_debugfs_set_boolean(int pf, unsigned int vf_num,
 				      unsigned int gt_num, const char *attr,
 				      bool value);
 
+int __xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
+					 unsigned int gt_num, uint64_t *value);
+uint64_t xe_sriov_vf_debugfs_get_selfconfig(int vf, enum xe_sriov_shared_res res,
+					    unsigned int gt_num);
+
 #endif /* __XE_SRIOV_DEBUGFS_H__ */
-- 
2.40.0

