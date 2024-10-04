Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72C0CF8840
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 17:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E5710EA4B;
	Fri,  4 Oct 2024 17:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2WLq9xO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DFF10EA4B
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728061871; x=1759597871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u2pYIqnqyYmHjkHrwjCPd6jWuAf7J/NhPNsPCPqma6o=;
 b=H2WLq9xOqSvFROA7JGLmfnNqEPHNKy8sZUNPwNMoGGG0EUiKFwVgKuVS
 FfTwKunXaD1BauBS1OuDEEyopHP5t6imlnt7ju51yakjnJQ5VK8MqSlRY
 aai3OEKGRxS4Ort7LxCwm0l60e1cntKRdRFA+IG5VUiHSUtGYBuAFb23g
 pOivLb38KkFUbtEhKsHMF0fUMUnIbb4PfV2asDTflnIkQPr6jYekUwO2R
 xAyo3unxXwUKohQOowqv8oEXWDxUeAEnNx0HyGAXiGUOoSAstUaMytX81
 Blr5D49BYcJtIpcrfuQZiGRFWjkJle5hGxoUMDcscb301wPPegOp3xGxu Q==;
X-CSE-ConnectionGUID: ZeSZmxTNThytggqZbmHItw==
X-CSE-MsgGUID: ldmAlsX9S8uKv4+YPLY6gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31087956"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="31087956"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 10:11:06 -0700
X-CSE-ConnectionGUID: 0bI10xvnRPurzmhvxcxBfg==
X-CSE-MsgGUID: a0yA17gVSU2rkE6EdWGkqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74877661"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmviesa008.fm.intel.com with ESMTP; 04 Oct 2024 10:11:04 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: [PATCH i-g-t v3] tests/core_setmaster: simplify device handling
Date: Fri,  4 Oct 2024 22:27:45 +0530
Message-Id: <20241004165745.16799-1-krishnaiah.bommu@intel.com>
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

Refactored test setup to dynamically determine the correct drm card
for testing. Instead of changing permissions for all cards,
change only one that will be tested.

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

v2: corrected the e-mail address

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
---
 tests/core_setmaster.c | 82 ++++++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 35 deletions(-)

diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 9c2083f66..fe9993515 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -107,40 +107,31 @@ static void check_drop_set(void)
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
+	if (path[0] == 0)
+		return;
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
@@ -160,8 +151,8 @@ igt_main
 
 
 	igt_subtest_group {
-		uint8_t saved_perm[255];
-		unsigned num;
+		uint8_t saved_perm;
+		char buf[255];
 
 		/* Upon dropping root we end up as random user, which
 		 * a) is not in the video group, and
@@ -176,8 +167,29 @@ igt_main
 		 * restored on skip or failure.
 		 */
 		igt_fixture {
-			num = tweak_perm(saved_perm, ARRAY_SIZE(saved_perm),
-					 true);
+			char path[255];
+			int len;
+			int fd;
+
+			memset(buf, 0, sizeof(buf));
+			saved_perm = 0;
+
+			fd = __drm_open_driver(DRIVER_ANY);
+			igt_assert_fd(fd);
+
+			snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
+
+			len = readlink(path, buf, sizeof(buf) - 1);
+			igt_assert_f(len > 0, "readlink failed with %d path=%s\n", errno, path);
+
+			buf[len] = '\0';
+			if (!(strstr(buf, "/dev/dri/card") == buf ||
+					strstr(buf, "/dev/dri/renderD") == buf))
+				igt_assert_f(0, "Not a card nor render, path=%s\n", buf);
+
+			igt_assert_eq(__drm_close_driver(fd), 0);
+
+			tweak_perm(&saved_perm, buf, true);
 		}
 
 		igt_describe("Ensure first normal user can Set/DropMaster");
@@ -191,7 +203,7 @@ igt_main
 
 		/* Restore the original permissions */
 		igt_fixture {
-			tweak_perm(saved_perm, num, false);
+			tweak_perm(&saved_perm, buf, false);
 		}
 	}
 
-- 
2.34.1

