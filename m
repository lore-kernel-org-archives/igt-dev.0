Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DBAE77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 22:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAA210E965;
	Fri,  3 Jan 2025 22:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pSoT8B0t";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F45110E965
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 22:26:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BA160C0F4F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 22:26:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2818CFF803;
 Fri,  3 Jan 2025 22:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735943191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=uQa5Ko8MJCT3YKqUXOMtmBpDwiA/DFXgp8N4i10XdEA=;
 b=pSoT8B0tlNiqB/aRgrE83kf56WgMuPLxTo3YxLaqUPFfl8ur0xQbQ1ivgAJFjfMShEP1QK
 5moI42ShiNRwFsGB1OXyd6gCQv0kxjupUns6MKnSfwdmPa0bC/TUSyXBvfZeWWYL2/HGfi
 4WiQ2OwS5aXlecd0tzQqlgJnbRkwtOoks7RRXo1ANz0CwAEpTf0XOkIpe6OEbeVocD6sAb
 jOvGJsSbKcCM23KCjpdFhJR8RrEH5n8tEKbVre0UmrhHpyBungoS9Ma8klwI/GCifKMGEC
 WNJn0Sj9efsSf0625sXKF66ySDZ3akacqh6j2j3sftP+CwrgVrZvEQkWtNWYfQ==
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH i-g-t] lib/igt_aux.c: since procps-ng 4.0.5,
 PIDS_VAL() takes 3 arguments, not 4
Date: Fri,  3 Jan 2025 23:26:28 +0100
Message-ID: <20250103222628.4069004-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.petazzoni@bootlin.com
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

Unfortunately, the API of procps-ng has changed between procps-ng
4.0.4 and procps-ng 4.0.5, with the PIDS_VAL() macro changing in
upstream commit
https://gitlab.com/procps-ng/procps/-/commit/967fdcfb06e20aad0f31073474cb94545c9bdea5.

This API breakage has been reported upstream as of
https://gitlab.com/procps-ng/procps/-/issues/366, but in the mean
time, the build of igt-gpu-tools breaks with:

../lib/igt_aux.c:1358:78: error: macro "PIDS_VAL" passed 4 arguments, but takes just 3

We fix this by detecting the version of the libproc2 library, and
adjusting accordingly how PIDS_VAL() gets used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 lib/igt_aux.c | 7 +++++++
 meson.build   | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 3407cc4f2..f5bf48da6 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1358,10 +1358,17 @@ static bool get_process_ids(struct igt_process *prcs)
 	prcs->comm = NULL;
 	prcs->stack = procps_pids_get(prcs->info, PIDS_FETCH_TASKS_ONLY);
 	if (prcs->stack) {
+#if defined(HAVE_LIBPROC2_POST_4_0_5_API)
+		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack);
+		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack);
+		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack);
+		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack);
+#else
 		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack, prcs->info);
 		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack, prcs->info);
 		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack, prcs->info);
 		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack, prcs->info);
+#endif
 	}
 #endif
 	return prcs->tid != 0;
diff --git a/meson.build b/meson.build
index 8b2a2a64a..f3e645c4d 100644
--- a/meson.build
+++ b/meson.build
@@ -139,6 +139,9 @@ if libprocps.found()
   config.set('HAVE_LIBPROCPS', 1)
 elif libproc2.found()
   config.set('HAVE_LIBPROC2', 1)
+  if libproc2.version().version_compare('>= 4.0.5')
+    config.set('HAVE_LIBPROC2_POST_4_0_5_API', 1)
+  endif
 else
   error('Either libprocps or libproc2 is required')
 endif
-- 
2.47.1

