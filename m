Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EBBCF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 22:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EE910E4A9;
	Mon, 23 Sep 2024 22:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2+do3tq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA6A10E4A7
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 22:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727129517; x=1758665517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+wqAfj9LPn7WG1UDDtlQu0pLGz5pbwsZyQp2AQspfJw=;
 b=B2+do3tq7lUKoVzELyO12kPeK5dwIHvlIZj4f4NaYdSmXoQN47sg8CM0
 0wN/rMbDeXe+t1BfD54Qpp5wtF3YFhgGBgeq/ZT4G7pZWZceTnl572pna
 GdPoYt5ObZYcB+TTb2Ey27eeR2oNymXOdT+fWWrUGbDTkNHPNKBNDrHKX
 sdFk17ZOknx3Ok2jrfmQCTyQ+wRkG99lLjcLBYZPtWMKuNsXrbQUIErZC
 iW+envjnCK0bZJkE8yqyLpv+2NfcoOV9/Mj1WNXTLf24VDCF8wnIktpef
 cXAAWW0zUxLXzrIVgjM8Yr4v4ktXUWRq7ZNEvlCbDkIzUVOff3JMedc7w Q==;
X-CSE-ConnectionGUID: LeHJzdx3SC6zuEdQF1WwUQ==
X-CSE-MsgGUID: hqvTY9rEQxmJP7aSDQwIow==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43615584"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="43615584"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:57 -0700
X-CSE-ConnectionGUID: X26cOsv/RnecUIoyec+FSA==
X-CSE-MsgGUID: MxuVFT8zTi29Q92LdnQEhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71244259"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.110.192])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/5] lib/igt_gt: Add igt_open_forcewake_handle_for_pcidev()
Date: Mon, 23 Sep 2024 17:11:44 -0500
Message-ID: <20240923221146.125848-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923221146.125848-1-lucas.demarchi@intel.com>
References: <20240923221146.125848-1-lucas.demarchi@intel.com>
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

In several places we are getting the pci_dev for an fd and then passing
both the pci_dev and the fd to intel_register_access_init(). Add a
helper so intel_register_access_init() can operate on pci_dev only.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_gt.c | 37 +++++++++++++++++++++++++++++++++++++
 lib/igt_gt.h |  3 +++
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 0cc3ee131..c9fd9164f 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -30,6 +30,7 @@
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <fcntl.h>
+#include <pciaccess.h>
 
 #include "drmtest.h"
 #include "i915/gem.h"
@@ -514,6 +515,42 @@ int igt_open_forcewake_handle(int fd)
 	return igt_debugfs_open(fd, fn, O_RDONLY);
 }
 
+int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
+{
+	static const char *FORCEWAKE_FILES[] = {
+		"forcewake_all", "i915_forcewake_user",
+		NULL
+	};
+	const char *debugfs_root = igt_debugfs_mount(), **fn;
+	char path[PATH_MAX];
+	int dirlen, ret;
+
+	if (!debugfs_root)
+		return -ENOENT;
+
+	ret = snprintf(path, sizeof(path), "%s/dri/%04u:%02u:%02u.%u",
+		       debugfs_root,
+		       pci_dev->domain, pci_dev->bus, pci_dev->dev,
+		       pci_dev->func);
+	if (ret < 0 || ret >= sizeof(path))
+		return -EINVAL;
+
+	dirlen = ret;
+	for (fn = FORCEWAKE_FILES; *fn; fn++) {
+		ret = snprintf(path + dirlen, sizeof(path) - dirlen,
+			       "/%s", *fn);
+		if (ret < 0 || ret >= sizeof(path) - dirlen)
+			return -EINVAL;
+
+		ret = open(path, O_RDONLY);
+		if (ret >= 0 || errno != ENOENT)
+			return ret;
+	}
+
+	return -ENOENT;
+
+}
+
 #if defined(__x86_64__) || defined(__i386__)
 static unsigned int clflush_size;
 
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index d0c5510b1..4a67cd9f0 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -31,6 +31,8 @@
 #include "i915/i915_drm_local.h"
 #include "i915_drm.h"
 
+struct pci_device;
+
 void igt_require_hang_ring(int fd, uint32_t ctx, int ring);
 
 typedef struct igt_hang {
@@ -63,6 +65,7 @@ void igt_fork_hang_helper(void);
 void igt_stop_hang_helper(void);
 
 int igt_open_forcewake_handle(int fd);
+int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev);
 
 int igt_setup_clflush(void);
 void igt_clflush_range(void *addr, int size);
-- 
2.46.1

