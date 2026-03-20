Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BB1108B91B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 12:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6855A10E571;
	Fri, 20 Mar 2026 12:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OS5yVIfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F1F10E571
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774010065; x=1805546065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EJdnCHuhoaJZpI2/TNOv6rGvW/eLL6OW/lI5Iky3LIM=;
 b=OS5yVIfFKUN6Sm0JMrLxTV9mCXEms8M/11fdJrCiw4jyegK1sCfcRELQ
 iVV7Kv9jrntZdRsis4xAnbz8JR43cBn2JtQvWT216zN9upRU8m/cRFBc0
 SRGJZjm7k7RbwQGi1k53N436VlJeh0WNeiqJiu65cBcJ8TY7Pu9riOmuE
 YKDXh2r6WtbcUba+dz+4fodTZDd6J3Af1GltXU+mRhDQDSkF+46NXcDzq
 qN5T4x5S21YRSLGiyAE8E/aVyBXieTCFi7SS2xKWfAB1ZamXAAHrD7X2j
 Dmmz2nsBesvOIIw2/+u6Qia44CBaAGZNI6KtNxkjxTTsWES6NNTGI8bLl w==;
X-CSE-ConnectionGUID: X3/br9fbQh+ykHzPHLLn5g==
X-CSE-MsgGUID: vaSlQ5Y2RtS4/eLqdgGzmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86569213"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="86569213"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:34:24 -0700
X-CSE-ConnectionGUID: ChBtn1l4SIeFF4FNk8b/8Q==
X-CSE-MsgGUID: 9a2moHMSSNurAxXEYDHWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222361735"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:34:22 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] lib/drmtest: Create proper error report when open
 driver fails
Date: Fri, 20 Mar 2026 13:34:17 +0100
Message-ID: <20260320123417.30143-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

When first try for opening driver fails then opening function is
searching for next available device. When that also fails
reporting is printing last errno which could mislead developer:

$ build/tests/kms_dp_aux_dev
IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:754:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4294965755 (any)
Last errno: 2, No such file or directory
SKIP (0.006s)

ls /dev/dri
by-path  card1  renderD128

The real problem here is lack of permissions as there was a card
but program could not open it. Create a proper error report which
will print:

Last errno: 13, Permission denied

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4a788ea7a..047ca2ba8 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -426,6 +426,7 @@ static bool _is_already_opened(const char *path, int as_idx)
 static int __search_and_open(const char *base, int offset, unsigned int chipset, int as_idx)
 {
 	const char *forced;
+	int err = 0;
 
 	forced = forced_driver();
 	if (forced)
@@ -443,8 +444,18 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
 		fd = __drm_open_device(name, chipset);
 		if (fd != -1)
 			return fd;
+
+		if (!err) {
+			err = errno;
+		} else {
+			if (err == ENOENT && errno != ENOENT)
+				err = errno;
+		}
 	}
 
+	if (err != ENOENT)
+		errno = err;
+
 	return -1;
 }
 
-- 
2.53.0

