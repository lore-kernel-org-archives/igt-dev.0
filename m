Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DBFC369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 19:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1202E10E460;
	Tue, 29 Apr 2025 19:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y09pHFY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BDF10E460
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745955005; x=1777491005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cLjC+vB47ctTAGzgP/DU3XPWQ2rlfieFaUZG55ePSP4=;
 b=Y09pHFY4Ys6nLnNGCFsnTUZp8q+tBBO1695kdgFJUJN41eAx2/w7BGfB
 9znTngaJ0H30ie6+Dk4DZ2FffCpJP4lSGTU7dP0uFhLLW3R49NKidmTuM
 tJm0irlczLXf+5IFObC+gc3bvAgK7Zydps5vsH+pKTmYItftqCjg+eDKt
 BCSpyhYlrNV1ljwFbsHUmJBCbtiZedL60of8viI4nCIosc+Wuv9syVWbB
 TsaR/4wPTHFYJiSKiM+R4wXJAjyDNW9UZ8Dy+oPmPg4xq/oz+pG05SYzZ
 XUvYYuECj1sBMOjsZ4+PCXd+m63WQ1p0P8Iz3yg6HpxVUXzVM7tm5wEzV Q==;
X-CSE-ConnectionGUID: 8xs6Rj3ITNeS2o2MMY7mZQ==
X-CSE-MsgGUID: bz2Lb82FQ/Sko+3Yf9zF/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72978026"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="72978026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:29:58 -0700
X-CSE-ConnectionGUID: +ulOXfNcSl6qm9RoF11mQg==
X-CSE-MsgGUID: 494ij2f3Somo8XvyqkCUpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="134413048"
Received: from dut4036ptlh.fm.intel.com ([10.105.10.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:29:57 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com
Subject: [PATCH 1/2] lib/igt_os: Add igt_get_meminfo
Date: Tue, 29 Apr 2025 19:29:55 +0000
Message-ID: <20250429192956.275280-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429192956.275280-1-jonathan.cavitt@intel.com>
References: <20250429192956.275280-1-jonathan.cavitt@intel.com>
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

Add a function, igt_get_meminfo, that allows IGT to query the value of a
specific meminfo param.  This can have practical use later, E.G. for
determining if a test can run given the current meminfo settings.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/igt_os.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_os.h |  2 ++
 2 files changed, 45 insertions(+)

diff --git a/lib/igt_os.c b/lib/igt_os.c
index ac8960f8b0..0fa10ee750 100644
--- a/lib/igt_os.c
+++ b/lib/igt_os.c
@@ -99,6 +99,49 @@ static uint64_t get_meminfo(const char *info, const char *tag)
 	return 0;
 }
 
+/**
+ * igt_get_meminfo:
+ * @field: name of meminfo field to get the value of
+ *
+ * Returns:
+ * The value of the meminfo field @field
+ */
+uint64_t igt_get_meminfo(const char *field)
+{
+	uint64_t retval;
+	char *info;
+	char *query;
+	int fd;
+
+	fd = open("/proc", O_RDONLY);
+	info = igt_sysfs_get(fd, "meminfo");
+	close(fd);
+
+	if (!info) {
+		igt_warn("Could not open /proc/meminfo");
+		return 0;
+	}
+
+	/*
+	 * In get_meminfo, it is expected that the provided tag ends in a colon (:).
+	 * If the colon is missing, the search will fail to find the meminfo field.
+	 * Userspace should not be required to provide this extra colon in the
+	 * meminfo field name, so append it silently to the provided name before
+	 * passing it to get_meminfo.
+	 */
+	query = malloc(strlen(field) + 1);
+	if (!query) {
+		igt_warn("Failed to alloc search query");
+		return 0;
+	}
+	sprintf(query, "%s:", field);
+
+	retval = get_meminfo(info, query);
+	free(query);
+
+	return retval;
+}
+
 /**
  * igt_get_avail_ram_mb:
  *
diff --git a/lib/igt_os.h b/lib/igt_os.h
index b9af0a4b7c..415895f76a 100644
--- a/lib/igt_os.h
+++ b/lib/igt_os.h
@@ -28,6 +28,8 @@
 #include <stddef.h>
 #include <stdint.h>
 
+uint64_t igt_get_meminfo(const char *field);
+
 /* These are separate to allow easier testing when porting, see the comment at
  * the bottom of intel_os.c. */
 uint64_t igt_get_total_ram_mb(void);
-- 
2.43.0

