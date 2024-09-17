Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF14C35FED
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 07:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D8C10E429;
	Tue, 17 Sep 2024 07:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXhstLgC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B5010E429
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 07:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726558447; x=1758094447;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gpjt5cIAf+Io687MyG2t9xiLAXdJOCDKU4HRx2JhLF8=;
 b=TXhstLgCK8ZwA+yo24PLni5WsAo6pVYjgdvybChihoIu5I8TbXm2ZcGI
 3DlA/hoiJAJfmHtYThj/pyAVfnUcAZ7vDo4cZnRdzrK1u8riDbRSCqeH9
 BV/ce8qrFDWfoqKwDOI07XvSgXkdHkP3fuW7K4Zn33mnDAD9iU1wQTpCS
 QTem7UqjtJWp52/w7GVSvUVFiZSN1iaADXRRT8xRQQCEeTRs7Ci6UGgCn
 8jqW65VA6zK1ACKn1vdRMzLFNeJkLj/YgMe3lCdGNd4MS7CgIOBf71WOO
 EJ3FLRxJMbMLju+/XMiwt5OucwFzT97G8Now9YgYs8k6A/02BD5t2pJ+y Q==;
X-CSE-ConnectionGUID: +2kijwaNRzSIYbN5fFLQyA==
X-CSE-MsgGUID: QjqA+FG5QK+FGoTwIquxTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="47910952"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="47910952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 00:34:07 -0700
X-CSE-ConnectionGUID: QSvuQef6Q6KeTLCWAJOiPg==
X-CSE-MsgGUID: zETcHLxYQmiv0demEqKrvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68748259"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2024 00:34:05 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH v3] tests/core_setmaster: Handle the test even if cards are
 non-continuous
Date: Tue, 17 Sep 2024 12:51:23 +0530
Message-Id: <20240917072123.17381-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Although most of user space assumes drm cards to be populated continuously,
this assumption may not be always true. After hot unpluging and repluging
of card, the card may be non-continuous. To address such scenarios where
the cards can be non-continuous Modify the tweak_perm function to loop all
possible card numbers(card0-card255) and break after first card found.

Problem Description:
The test fails after running the `core_hotunplug@hot*` subtest, where
Card0 is populated as card1, This leads to a failure in the subsequent
`master-drop-set-user` test.

Command sequence for reproducing the issue:
- Check available cards: `ls /dev/dri/`
        - Output: by-path  card0  renderD128
- Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
- Check again: ‘ls /dev/dri/’
        - Output after core_hotunplug : by-path  card1  renderD129
- Run the test: `# ./core_setmaster --r master-drop-set-user`
        - Output: gta@ core_setmaster@master-drop-set-user failure

This failures on both XE and i915 for above sequence.

v2: Break the loop after first card found and check return value of chmod.
v3: Undated comments in code.

Signed-off-by: Bommu Krishnaiah krishnaiah.bommu@intel.com
Cc: Emil Velikov emil.l.velikov@gmail.com
Cc: Himal Prasad Ghimiray himal.prasad.ghimiray@intel.com
Cc: Kamil Konieczny kamil.konieczny@linux.intel.com
---
 tests/core_setmaster.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 9c2083f66..91cbc1b39 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -107,18 +107,21 @@ static void check_drop_set(void)
 	drm_close_driver(master);
 }
 
-static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
+static int tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
 {
 	char path[256];
 	struct stat st;
-	unsigned i;
+	int i;
 
 	for (i = 0; i < max_perm; i++) {
+		int ret = 0;
+
 		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
 
-		/* Existing userspace assumes there's no gaps, do the same. */
+		/* Userspace cannot always have continuous card0...N due to
+		 * dynamic unloading or removal of cards */
 		if (stat(path, &st) != 0)
-			break;
+			continue;
 
 		if (save) {
 			/* Save and toggle */
@@ -136,7 +139,13 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
 		 * - __drm_open_driver() can open another device, aka the
 		 * failure may be irrelevant.
 		 */
-		chmod(path, st.st_mode);
+		ret = chmod(path, st.st_mode);
+		if (ret)
+			return ret;
+
+		/* Break the loop after the frist card */
+		if (save)
+			return i;
 	}
 	return i;
 }
@@ -161,7 +170,7 @@ igt_main
 
 	igt_subtest_group {
 		uint8_t saved_perm[255];
-		unsigned num;
+		int num;
 
 		/* Upon dropping root we end up as random user, which
 		 * a) is not in the video group, and
-- 
2.25.1

