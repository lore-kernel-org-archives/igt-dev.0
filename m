Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE64CD5D699
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 22:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA1F10E17D;
	Thu,  7 Nov 2024 22:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekMaZHam";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2A610E23F
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731019976; x=1762555976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ogG1wmzYWtdS3pWmbVE9OIK2isqS60En2dlsvwi9Vgk=;
 b=ekMaZHam99Zr8K7j3O/9W+ZhSBf194ux37v0mMJ6qkeV/SI3JGOKEh4p
 5DVaJhB6HI5ArsC6T0t3YYTJR5u0LwMcT9I0zbQComWHqjvQABqkm47wS
 XZkxQyEVZhYze1wUkVqMY0xUBcKB75GdqlH54Vf9glnQRF+ZD/7RfzHoD
 OsbDADTKkmkXUMURbdP7KffyGCn0ZOhejL/R1PZrUVUwijzkKDCDw89Go
 HrSgGHNbNtMOpA7m2CMWw+AlJ9MVJhc0TUu17PJi5zKG4K+CkUkeio7yY
 1Ai1m49NBxadYmOvCMRgV+Ma0n/Ty9fgLg00p5RwhEIgkIFxsl2x8/c/P w==;
X-CSE-ConnectionGUID: TwmX4SjDTd2u9UNDWDxO/w==
X-CSE-MsgGUID: w6OfUBbSRWazS3hh3rlhBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31114836"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31114836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:52:56 -0800
X-CSE-ConnectionGUID: MciYI8q5TiKLAXIejI+Yvw==
X-CSE-MsgGUID: 8X4uQIC2SF+BYR9Y3AU1KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="85675163"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:52:55 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v5 1/3] lib/igt_sysfs: Add igt_sysfs_get_next_engine
Date: Thu,  7 Nov 2024 22:52:52 +0000
Message-ID: <20241107225254.302010-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241107225254.302010-1-jonathan.cavitt@intel.com>
References: <20241107225254.302010-1-jonathan.cavitt@intel.com>
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

Create a new helper function, igt_sysfs_get_next_engine, that iterates
over sysfs/engines and stores the next engine for the user.  The
function returns true if the next engine in the list is available, and
false otherwise.  The function will be used in the test suite in a later
patch.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/igt_sysfs.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 26a3aa31fb..3d0dada969 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1236,6 +1236,42 @@ static uint16_t xe_get_engine_class(char *name)
 	return class;
 }
 
+/**
+ * igt_sysfs_get_next_engine:
+ * @engines: fd of the directory engine
+ * @prior: previous engine from the sysfs/engines list
+ *
+ * Iterates over sysfs/engines and stores the next engine in prior.
+ * Returns true if there are more engines to iterate over, and false otherwise.
+ */
+bool igt_sysfs_get_next_engine(int engines, int *prior)
+{
+	struct dirent *de;
+	DIR *dir;
+
+	if (!prior)
+		lseek(engines, 0, SEEK_SET);
+	else
+		close(*prior);
+
+	dir = fdopendir(engines);
+	if (!dir) {
+		close(engines);
+		return false;
+	}
+
+	while ((de = readdir(dir))) {
+		if (*de->d_name == '.')
+			continue;
+
+		*prior = openat(engines, de->d_name, O_RDONLY);
+		if (*prior >= 0)
+			return true;
+	}
+	return false;
+}
+
+
 /**
  * igt_sysfs_engines:
  * @xe: fd of the device
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 852b95053f..bff5ed68e6 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -163,6 +163,7 @@ typedef struct igt_sysfs_rw_attr {
 
 void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
 
+bool igt_sysfs_get_next_engine(int engines, int *prior);
 void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
 		       void (*test)(int, int, const char **, uint16_t, int));
 
-- 
2.43.0

