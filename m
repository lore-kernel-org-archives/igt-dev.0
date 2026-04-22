Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105DEFA1FC9
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 15:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC3A10E032;
	Wed, 22 Apr 2026 15:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0qmxCO3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DAD10E032
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776872673; x=1808408673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MTf23sGz07AkeU5/+GEOug6jIgPqfr5SxvdGOM8bD8c=;
 b=c0qmxCO3/jO6z32tOP11EPlWMh8qbWZzCXzMTuML5jTFoAYwTqC2W6Wq
 H/Pf9QsS3CldxLgCJ+LElFPWzXN5Pds9Mqpi0S7KwKLQ22klFDhcFWhzF
 s0Of+ivB/39pRmu/VRXA/CdFdIyHhK+DPOo47XnRRnMIuL+Ev8gTuvxvK
 qo7e34UqtWlbWw7dXyPHytzFo36X1aAD3MaFc2cp61NB1BOZKxG9O7+9p
 dIjgcsDuBppoAieGK2xAE4qcIhrZmMdYMKZc7NI2pMutvHgXPF4pva0pI
 XrxzEdRILvQHwUElmLxNTI1kPreCWnzDCHd0VBVTE6two26aUiczrn/V0 g==;
X-CSE-ConnectionGUID: tjbge+V7QbeRpP53gZbeKg==
X-CSE-MsgGUID: bo/uyc7rSy6ji+E66GEFCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76861094"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="76861094"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:33 -0700
X-CSE-ConnectionGUID: O02CJJfYTca1HQesx+pmPw==
X-CSE-MsgGUID: 04ZrfEgEQkODl/RzMOEznQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="234174335"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:32 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 1/5] tests/prime_udl: Fix opening
Date: Wed, 22 Apr 2026 17:44:19 +0200
Message-ID: <20260422154423.141908-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
References: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
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

Cards numbering can be non-sequential so create a way to open
them in such case.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/prime_udl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index 25950a09d..c3e92be1e 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -27,13 +27,13 @@ static int find_and_open_devices(void)
 	FILE *fl;
 	char vendor_id[8];
 	int venid;
-	for (i = 0; i < 9; i++) {
+	for (i = 0; i < 9 && intel_fd == -1 && udl_fd == -1; i++) {
 		sprintf(path, "/sys/class/drm/card%d/device/vendor", i);
 		if (stat(path, &buf)) {
 			/* look for usb dev */
 			sprintf(path, "/sys/class/drm/card%d/device/idVendor", i);
 			if (stat(path, &buf))
-				break;
+				continue;
 		}
 
 		fl = fopen(path, "r");
@@ -45,11 +45,11 @@ static int find_and_open_devices(void)
 
 		venid = strtoul(vendor_id, NULL, 16);
 		sprintf(path, "/dev/dri/card%d", i);
-		if (venid == 0x8086) {
+		if (venid == 0x8086 && intel_fd == -1) {
 			intel_fd = open(path, O_RDWR);
 			if (!intel_fd)
 				return -1;
-		} else if (venid == 0x17e9) {
+		} else if (venid == 0x17e9 && udl_fd == -1) {
 			udl_fd = open(path, O_RDWR);
 			if (!udl_fd)
 				return -1;
-- 
2.54.0

