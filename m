Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2B6C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E9310E50D;
	Tue, 30 Jul 2024 11:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRE70kDB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C600010E516
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340122; x=1753876122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n5p+pYnFe2g3pvYOXs2yA+xTMsLCvHEo4rQZT/CMpW0=;
 b=MRE70kDBVxRgJPsBqpSqTOBRWuF9AVG9wxFMTDEPAr/krrFjOI3fGHKJ
 BvtGxjntD6mzteqkpEgtlKqyG7h69hxz8eXzYIFKCG2G2xgTLvaKaGLp0
 S4P6fZmrK+JCxRKwxGo5JEMskxa6n2xcsIaL81M/ymSJmXdJjm8QB4bjX
 P4V1NDPIx1AmdlDkRQG5841dYN0jIY9RlUuZ30veX1jkWH7g+IlosWO6j
 t5X/Xga6Q36syyYF/w8oU3UJej8DIIjPVesA7BFD7wPDg/QBJv9aqSPvX
 BRXGLttB5xpXsIcHbQyJ5qmjANr1HhM1EXIc/Kkam3izI5AtKqqEvcl23 Q==;
X-CSE-ConnectionGUID: ETR6zVRITpSJQ17eSaECig==
X-CSE-MsgGUID: gBlYJ9joRLO2K/WQPT0aOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937401"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937401"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:42 -0700
X-CSE-ConnectionGUID: TAInzEjITF2wzeLuI2uTrg==
X-CSE-MsgGUID: M5au3D7iS86Lk8OWylORMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217185"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:39 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 40/66] tests/xe_exec_sip: Check usercoredump for
 attentions
Date: Tue, 30 Jul 2024 13:44:57 +0200
Message-Id: <20240730114523.334156-41-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Check for attentions within usercoredump in tests that raise attentions.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_exec_sip.c | 64 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 1b0accb3b..a315bd3a9 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -145,7 +145,7 @@ static void check_fill_buf(uint8_t *ptr, const int width, const int x,
 		     color, val, x, y);
 }
 
-static void check_buf(int fd, uint32_t handle, int width, int height,
+static int check_buf(int fd, uint32_t handle, int width, int height,
 		      int siptype, uint8_t poison_c)
 {
 	unsigned int sz = ALIGN(width * height, 4096);
@@ -188,6 +188,63 @@ static void check_buf(int fd, uint32_t handle, int width, int height,
 		igt_assert(sip_count == 0);
 
 	munmap(ptr, sz);
+
+	return sip_count;
+}
+
+#define USERCOREDUMP_FORMAT "usercoredumps/%d/%d"
+static char *get_latest_usercoredump(int dir)
+{
+	char tmp[256];
+	int i = 1;
+
+	do {
+		snprintf(tmp, sizeof(tmp), USERCOREDUMP_FORMAT, getpid(), i++);
+	} while (igt_sysfs_has_attr(dir, tmp));
+
+	snprintf(tmp, sizeof(tmp), USERCOREDUMP_FORMAT, getpid(), i-2);
+	return igt_sysfs_get(dir, tmp);
+}
+
+static void check_usercoredump(int fd, int sip, int dispatched)
+{
+	int dir = igt_debugfs_dir(fd);
+	char *usercoredump, *str;
+	unsigned int before, after;
+	char match[256];
+
+	if (sip != SIP_WAIT)
+		return;
+
+	/* XXX reinstate when offline coredumps are implemented */
+#ifndef XXX_ATTENTIONS_THROUGH_COREDUMPS
+	return;
+#endif
+	usercoredump = get_latest_usercoredump(dir);
+	igt_assert(usercoredump);
+	igt_debug("%s\n", usercoredump);
+
+	snprintf(match, sizeof(match), "PID: %d", getpid());
+	str = strstr(usercoredump, match);
+	igt_assert(str);
+
+	snprintf(match, sizeof(match), "Comm: %s", igt_test_name());
+	str = strstr(str, match);
+	igt_assert(str);
+
+	str = strstr(str, "TD_ATT");
+	igt_assert(str);
+	igt_assert_eq(sscanf(str, "TD_ATT before (%d):", &before), 1);
+	str = strstr(str + 1, "TD_ATT");
+	igt_assert_eq(sscanf(str, "TD_ATT after (%d):", &after), 1);
+
+	igt_info("attentions %d before, %d after\n", before, after);
+
+	igt_assert_eq(before, dispatched);
+	igt_assert_eq(after, dispatched);
+
+	free(usercoredump);
+	close(dir);
 }
 
 static uint64_t
@@ -232,7 +289,7 @@ static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *e
 	uint32_t exec_queue_id, handle, vm_id;
 	struct intel_bb *ibb;
 	uint64_t timeout;
-	int fd;
+	int dispatched, fd;
 
 	igt_debug("Using %s\n", xe_engine_class_string(eci->engine_class));
 
@@ -258,7 +315,8 @@ static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *e
 	intel_bb_sync(ibb);
 	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
 
-	check_buf(fd, handle, width, height, sip, COLOR_C4);
+	dispatched = check_buf(fd, handle, width, height, sip, COLOR_C4);
+	check_usercoredump(fd, sip, dispatched);
 
 	gem_close(fd, handle);
 	intel_bb_destroy(ibb);
-- 
2.34.1

