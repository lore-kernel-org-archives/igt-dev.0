Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEF1C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 19:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01E010E1CF;
	Mon, 12 Aug 2024 19:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcmRcOz5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE02510E194
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 19:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723491700; x=1755027700;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nNdGkjLINPx5OpLxwr+5VjknmcmeIvgQh11f4YyMEEs=;
 b=YcmRcOz5bxfzVclBh1wy96K1LIYKSlnUgmMhPRSkJjigepgHbTEScoBA
 xZpa9k2JSca5w12k9rzA92nmMDm0dw2WHu+qacPc+Q2DNpi7zhTvhqMQw
 XKcCJCamhq0eYXlFeQj9RmVqqKD07sZQqUpLAq6K0dr8tQ2Pcz6kTBP2k
 ndG/Xx3LE0K/Tus/nhuH23Ya+mgqAPKAy3bTA8BbauLYTL2o3z93j/G0h
 40nG7PHErhcNLnHR75gdCcB8pmmwYKpkEDS279xaDuWzBj/Beibpr+aWx
 SXvBYDPMDNCoD70GWUZ5NimWmg5W2Ls6e4RR0inMfq7HOmeKyH+W+0bFh w==;
X-CSE-ConnectionGUID: bhVNWuRMTT6oTEYokqpsgg==
X-CSE-MsgGUID: 0ZqenUGDSUu7LJdlOKmF4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21788423"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="21788423"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 12:41:40 -0700
X-CSE-ConnectionGUID: 7SKFmperQ2iM9Vb1qE8ukQ==
X-CSE-MsgGUID: Pd9DIdwkRzaaeKUbbLGCPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="58443109"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2024 12:41:38 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH 1/2] lib/igt_sysfs: update igt_sysfs_engines to run dynamic
 tests with its associated engine class.
Date: Tue, 13 Aug 2024 01:11:35 +0530
Message-Id: <20240812194136.6352-2-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240812194136.6352-1-sai.gowtham.ch@intel.com>
References: <20240812194136.6352-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Correlate updates in sysfs engines queried and the work load submitted
to a engine, enhancing igt_sysfs_engines so that each update in sysfs
engine will corelates to it corresponding engine class.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/igt_sysfs.c | 39 ++++++++++++++++++++++++++++++++++++---
 lib/igt_sysfs.h |  4 ++--
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2863e22b5..aec0bb53d 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1210,6 +1210,32 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
 	igt_assert(!ret);
 }
 
+/**
+ * xe_get_engine_class:
+ * @name: de_d_name that we get from igt_sysfs_engine.
+ *
+ * It returns engine class corresponding to the engine dir from igt_sysfs_engines.
+ *
+ */
+static uint16_t xe_get_engine_class(char *name)
+{
+	uint16_t class;
+
+	if (strcmp(name, "rcs") == 0) {
+		class = DRM_XE_ENGINE_CLASS_RENDER;
+	} else if (strcmp(name, "bcs") == 0) {
+		class = DRM_XE_ENGINE_CLASS_COPY;
+	} else if (strcmp(name, "vcs") == 0) {
+		class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+	} else if (strcmp(name, "vecs") == 0) {
+		class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	} else if (strcmp(name, "ccs") == 0) {
+		class = DRM_XE_ENGINE_CLASS_COMPUTE;
+	}
+
+	return class;
+}
+
 /**
  * igt_sysfs_engines:
  * @xe: fd of the device
@@ -1220,11 +1246,12 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
  * It iterates over sysfs/engines and runs a dynamic engine test.
  *
  */
-void igt_sysfs_engines(int xe, int engines, const char **property,
-		       void (*test)(int, int, const char **))
+void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
+		       void (*test)(int, int, const char **, uint16_t, int))
 {
 	struct dirent *de;
 	DIR *dir;
+	uint16_t class;
 
 	lseek(engines, 0, SEEK_SET);
 
@@ -1251,7 +1278,13 @@ void igt_sysfs_engines(int xe, int engines, const char **property,
 				igt_require(fstatat(engine_fd, property[2], &st, 0) == 0);
 			}
 			errno = 0;
-			test(xe, engine_fd, property);
+
+			if (all) {
+				class = xe_get_engine_class(de->d_name);
+				test(xe, engine_fd, property, class, gt);
+			} else {
+				test(xe, engine_fd, property, 0, 0);
+			}
 		}
 		close(engine_fd);
 	}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 27031a015..2a1e3b1bf 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -163,8 +163,8 @@ typedef struct igt_sysfs_rw_attr {
 
 void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
 
-void igt_sysfs_engines(int xe, int engines, const char **property,
-		       void (*test)(int, int, const char **));
+void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
+		       void (*test)(int, int, const char **, uint16_t, int));
 
 char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen);
 int xe_sysfs_gt_open(int xe_device, int gt);
-- 
2.39.1

