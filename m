Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809D4C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D4010E42E;
	Mon, 29 Jul 2024 16:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njmZ8FoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9D710E432
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269069; x=1753805069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n5p+pYnFe2g3pvYOXs2yA+xTMsLCvHEo4rQZT/CMpW0=;
 b=njmZ8FoBDGhIzt+KHNZRZv68f5ZW2OZF1qfVsbjF2lYkTAxhvrE4WbXV
 KC15FflBwLudIQ/w+6UI9V7mBB1ZuqMUOsayTSywJHHCBa7aJEtX/tsP9
 Yk3zRpg48t0q0UO+myP8rr3wcA8lDVsJuZPwiDtcaq/bpSSPrmxZDA8lT
 i286gDr3SNftPjXmrSIONMreOsFk2HZeQp1zgr9WNNLdJ7I+dkAEDw+nG
 2t4yok4Z4IBgtVzb8dAht80K7rxbdi2vQ8wftmNvl7aI4Tq+Xnqp5XBHd
 EaDPWT3bxYliJOTNAOzok4rYbQgK50BNiyc3o70Qz8fprerNKRb6IkAqr A==;
X-CSE-ConnectionGUID: CzEVuQU+SqSU98WTshS8UA==
X-CSE-MsgGUID: g1fUhPX1RF6rgL+CiBA86Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427263"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427263"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:29 -0700
X-CSE-ConnectionGUID: 4beHRO9gQUag0Iw0q+jIUw==
X-CSE-MsgGUID: jqFGtUv3QNmXfM1KshXypA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53738830"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:25 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 40/66] tests/xe_exec_sip: Check usercoredump for attentions
Date: Mon, 29 Jul 2024 18:01:33 +0200
Message-Id: <20240729160159.37036-41-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

