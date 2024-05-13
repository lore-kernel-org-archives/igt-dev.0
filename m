Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC3CC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 10:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9D010E22A;
	Tue, 14 May 2024 10:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDpfAjQe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279EB10E981
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 20:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715633512; x=1747169512;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oJQ28oBY55s+TnDv/8Szhv/IREuBA4fi8/+onWCPmOg=;
 b=JDpfAjQe6EVfiMr/xyYQORs8vW7jfWe0bC+eV4Oi1X3TciAA3E95f+iK
 FAHR6JMX1LCVwmBY5FuaJHHKzWJ2pxnpByFxkY7oqNQ1JWeRL6tb+bWDj
 DB8VTqz9ZjoVMPYL1rGV0Tu0nQhRaJZa3QSQSwU5S/Wb2BksoCtS9KFIZ
 TB7HhSaJOSxofvcPg3ifk+8gAfkyO8flL0wbVTPRWv6AdP0A22rkM/mK/
 op+wIPVUVyIuwiD5Bybtzp0enGAgUdf+dhgdguLEABNPzlgd2CS7jfkzV
 zRQQU9BYj97pkdJTA/3NFIFKXGacq2Mj0SLdbOAvZiL1XnjjCxiJlJfQ3 Q==;
X-CSE-ConnectionGUID: qOpKV7lVRXuybTqk8uwRrw==
X-CSE-MsgGUID: dWnbSmr8SviIPNgKgfu+BQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11422154"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11422154"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 13:51:52 -0700
X-CSE-ConnectionGUID: 9LDvgxcNRrCT/jvs0Qd9TA==
X-CSE-MsgGUID: DtzvKfjCQySKMbut4aR5Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="53660722"
Received: from sidorovd-mobl2.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.252.52.106])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 13:51:50 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/igt_kms: add retry loop in igt_enable_connectors()
Date: Mon, 13 May 2024 23:51:26 +0300
Message-Id: <20240513205126.833654-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 May 2024 10:41:51 +0000
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

Sometimes the connector is not fully initialized yet when we try to
read it in igt_enable_connectors() and this causes a warning to be
issued and the test to fail.  This can happen in normal situations,
because there's no synchronization between the driver and IGT.  In
some tests we load the module and immediately start reading the
information, but the driver may not be fully initialized at that
point, causing the problem.

To prevent this, add a retry loop in igt_enable_connectors() so we
retry a few times, after a small delay, to wait for the initialization
to complete.

The number of retries and the delay between retries were chose after
running lots of tests, but these values may have to be adjusted after
running more tests on different machines.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10436
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 lib/igt_kms.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f82102144ea1..3832bf54a2fc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5386,7 +5386,10 @@ void igt_wait_for_vblank(int drm_fd, int crtc_offset)
  */
 void igt_enable_connectors(int drm_fd)
 {
+#define MAX_TRIES	10
+#define SLEEP_DURATION	50000
 	drmModeRes *res;
+	int tries;
 
 	res = drmModeGetResources(drm_fd);
 	if (!res)
@@ -5395,10 +5398,28 @@ void igt_enable_connectors(int drm_fd)
 	for (int i = 0; i < res->count_connectors; i++) {
 		drmModeConnector *c;
 
-		/* Do a probe. This may be the first action after booting */
-		c = drmModeGetConnector(drm_fd, res->connectors[i]);
-		if (!c) {
-			igt_warn("Could not read connector %u: %m\n", res->connectors[i]);
+		/*
+		 * The kernel returns the count of connectors before
+		 * they're all fully set up, so we can have a race
+		 * condition where we try to get the connector when
+		 * it's not fully set up yet.  To avoid failing here
+		 * in these cases, retry a few times.
+		 */
+		for (tries = 0; tries < MAX_TRIES; tries++) {
+			/* Do a probe. This may be the first action after booting */
+			c = drmModeGetConnector(drm_fd, res->connectors[i]);
+			if (c)
+				break;
+
+			igt_info("Could not read connector %u: %m (try %d of %d)\n",
+				  res->connectors[i], tries, MAX_TRIES);
+
+			usleep(SLEEP_DURATION);
+		}
+
+		if (tries == MAX_TRIES) {
+			igt_warn("Could not read connector %u after %d tries, skipping\n",
+				 res->connectors[i], MAX_TRIES);
 			continue;
 		}
 
-- 
2.39.2

