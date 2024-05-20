Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A539CC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 09:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA5110E342;
	Mon, 20 May 2024 09:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ph4BI4dX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EBC10E342
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716196950; x=1747732950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h3DUHJoexZyNdMF70OEbmrhJGGF9m7B9mnKXZHa+y5U=;
 b=Ph4BI4dXB4cVfqnhWb0hDix0nmVx3bl8m3JYIAXI9rfKw79gY1NkkFSq
 4Eb4OCiIkpRy64r+9GWIFs7aa9+X3K6NlFH+CmdmF2hxyZj3Gobx1F+TW
 byY4rSh+6T2YStDcSTnik1cHmqYnJqoVn5l7EFglN6+Vg3gRDPTaLwvXN
 6w8xuIYs6iF8PXVYpBrbGYig2NN8KPecL3w7lgRgNg9kSOcee6THYy5rW
 PSHVclp+Ih86USz7elk6FZ49etGtPTpQ8BY6oDVh57aG5DUT+EX1FqF1W
 mJ0UZaMpwKgWnWqi4et2IJ4nLozVIsE4H2YG88c7Yqe1x7jBVohvzy8da A==;
X-CSE-ConnectionGUID: 3bF8PgM7QCCpPzYNnWLS6A==
X-CSE-MsgGUID: a+VcmwfaRruXaan5Z4+sbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12163082"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="12163082"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:22:30 -0700
X-CSE-ConnectionGUID: N5t/uFvfQlqffH97BY3e4g==
X-CSE-MsgGUID: YaMOV2tOSf6hM4PWYSR8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32499159"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.251.211.149])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:22:29 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH v2 i-g-t] lib/igt_kms: add retry loop in
 igt_enable_connectors()
Date: Mon, 20 May 2024 12:22:16 +0300
Message-Id: <20240520092216.150083-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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

In v2:
   * Changed igt_info() to igt_debug() in the retry loop (Kamil)
   * Changed the retry logs to start from 1 instead of 0 to avoid
     confusion.

 lib/igt_kms.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f82102144ea1..af63d13b1da3 100644
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
+			igt_debug("Could not read connector %u: %m (try %d of %d)\n",
+				  res->connectors[i], tries + 1, MAX_TRIES);
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

