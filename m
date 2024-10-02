Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD72CF6D3A
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 15:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD7F89DA5;
	Wed,  2 Oct 2024 15:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3u7sFcT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C69489DA5
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727883542; x=1759419542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lDZGblpuVEsVO/ucD32XRwNmWw6HDFFDSbvG+gEmsCc=;
 b=K3u7sFcTY6SSAtmiIY22dXP5wyqSB9z2WarBzeHFSiqWwgo1z1Gjjd8a
 Es5XquRpXyW8CmSuHW0a1rZvzJ0zgwTHKFq28VMMs/wfRIuiZJlZ8OE0I
 4RwDIN0VqUHln+rpb/j7UuwvQm7kbTq4EMo6+k5apb1HYOB6c9gLL+DeE
 kZlJ1GsKmF3c7nSM30gyYmS9YgxWyLBhKyLGYO76ugNNJ514zO/ZCP+Nm
 cO70cS6Tj5hVSYbvI+yML9Zgx/vo319TIqnD0ZSnLJBp5tuqc7hj4g73i
 RU8XpYW2cPEWh4PYK8NBodTFbVo+uAu9fFA4hs2pG9V84YMEQXMOp/2N9 w==;
X-CSE-ConnectionGUID: Ibc1NnpGSD2fHcU5c40BMg==
X-CSE-MsgGUID: u/PnY4Q7SQO2xkyCnHog1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="49577272"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="49577272"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 08:38:54 -0700
X-CSE-ConnectionGUID: wX296+49SaqyTl6LvXFRbQ==
X-CSE-MsgGUID: p8cTKAEyTmOO7Kwp/Shc6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="104848493"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by orviesa002.jf.intel.com with ESMTP; 02 Oct 2024 08:38:53 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH i-g-t v4] tests/core_setmaster: Handle the test even if cards
 are non-continuous
Date: Wed,  2 Oct 2024 20:55:38 +0530
Message-Id: <20241002152538.26971-1-krishnaiah.bommu@intel.com>
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
        - Output: gta@core_setmaster@master-drop-set-user failure

This failures on both XE and i915 for above sequence.

v2: Break the loop after first card found and check return value of chmod.
v3: Undated comments in code.
v4: Refactor the code in master-drop-set-user

Signed-off-by: Bommu Krishnaiah krishnaiah.bommu@intel.com
Cc: Emil Velikov emil.l.velikov@gmail.com
Cc: Himal Prasad Ghimiray himal.prasad.ghimiray@intel.com
Cc: Kamil Konieczny kamil.konieczny@linux.intel.com
---
 tests/core_setmaster.c | 78 +++++++++++++++++++++++-------------------
 1 file changed, 43 insertions(+), 35 deletions(-)

diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 9c2083f66..137039782 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -107,40 +107,28 @@ static void check_drop_set(void)
 	drm_close_driver(master);
 }
 
-static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
+static void tweak_perm(uint8_t *saved_perm, char *path, bool save)
 {
-	char path[256];
 	struct stat st;
-	unsigned i;
-
-	for (i = 0; i < max_perm; i++) {
-		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
-
-		/* Existing userspace assumes there's no gaps, do the same. */
-		if (stat(path, &st) != 0)
-			break;
-
-		if (save) {
-			/* Save and toggle */
-			saved_perm[i] = st.st_mode & (S_IROTH | S_IWOTH);
-			st.st_mode |= S_IROTH | S_IWOTH;
-		} else {
-			/* Clear and restore */
-			st.st_mode &= ~(S_IROTH | S_IWOTH);
-			st.st_mode |= saved_perm[i];
-		}
-
-		/* There's only one way for chmod to fail - race vs rmmod.
-		 * In that case, do _not_ error/skip, since:
-		 * - we need to restore the [correct] permissions
-		 * - __drm_open_driver() can open another device, aka the
-		 * failure may be irrelevant.
-		 */
-		chmod(path, st.st_mode);
+	int ret;
+
+	ret = stat(path, &st);
+	igt_assert_f(!ret, "stat failed with %d path=%s\n", errno, path);
+
+	if (save) {
+		/* Save and toggle */
+		*saved_perm = st.st_mode & (S_IROTH | S_IWOTH);
+		st.st_mode |= S_IROTH | S_IWOTH;
+	} else {
+		/* Clear and restore */
+		st.st_mode &= ~(S_IROTH | S_IWOTH);
+		st.st_mode |= *saved_perm;
 	}
-	return i;
-}
 
+	/* There's only one way for chmod to fail - race vs rmmod. */
+	ret = chmod(path, st.st_mode);
+	igt_assert_f(!ret, "chmod failed with %d path=%s\n", errno, path);
+}
 
 igt_main
 {
@@ -160,8 +148,8 @@ igt_main
 
 
 	igt_subtest_group {
-		uint8_t saved_perm[255];
-		unsigned num;
+		uint8_t saved_perm;
+		char buf[255];
 
 		/* Upon dropping root we end up as random user, which
 		 * a) is not in the video group, and
@@ -176,8 +164,28 @@ igt_main
 		 * restored on skip or failure.
 		 */
 		igt_fixture {
-			num = tweak_perm(saved_perm, ARRAY_SIZE(saved_perm),
-					 true);
+			char path[255];
+			int len;
+			int fd;
+
+			fd = __drm_open_driver(DRIVER_ANY);
+			igt_assert_fd(fd);
+
+			snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
+
+			memset(buf, 0, sizeof(buf));
+			len = readlink(path, buf, sizeof(buf) - 1);
+			if (len <= 0)
+				igt_assert_f(0, "readlink failed with %d path=%s\n", errno, path);
+
+			buf[len] = '\0';
+			if (!(strstr(buf, "/dev/dri/card") == buf ||
+					strstr(buf, "/dev/dri/renderD") == buf))
+				igt_assert_f(0, "Not a card nor render, errno %d path=%s\n", errno, buf);
+
+			igt_assert_eq(__drm_close_driver(fd), 0);
+
+			tweak_perm(&saved_perm, buf, true);
 		}
 
 		igt_describe("Ensure first normal user can Set/DropMaster");
@@ -191,7 +199,7 @@ igt_main
 
 		/* Restore the original permissions */
 		igt_fixture {
-			tweak_perm(saved_perm, num, false);
+			tweak_perm(&saved_perm, buf, false);
 		}
 	}
 
-- 
2.34.1

