Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A0CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 17:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B24110E4AC;
	Thu, 21 May 2026 17:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6fN/9Ej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489C910E4AC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 17:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779385712; x=1810921712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MTf23sGz07AkeU5/+GEOug6jIgPqfr5SxvdGOM8bD8c=;
 b=l6fN/9Ej84yQkyUwnQ7sQ7JBpxyoe7Aq+C8PMPMupnkb/Bfvcu8EH0kK
 0a4g9O77JJ2e9YxFOFBR7BzGoIJOxm94wG972Tzh5xB+HGYXuwQRFV3dq
 0EQtwbU1HpGewb8fEjm2/72TmsM9QUb8GSBjmUrak3nMlAW3mGXvnEiUY
 Y2yMpv3d/XoCO/42nYvLIP5RliN6ZmpB2U0yUuRlm/Cu5kjbZhWb10T0h
 iBeyhwhQq6WmTu27sYq4QfqjVGcezyqG4OVluTQO8jeLskA0sRE51p70w
 HZdycPYaDv9tqgr/KK7V3pPytsF3bspHkAXSadrPNU//dLkmAGgB+r5ek Q==;
X-CSE-ConnectionGUID: McZv6gUvTX+TzlvA51Q9yA==
X-CSE-MsgGUID: FNm6sFJYRf25ZNHyQGEAgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="97883768"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="97883768"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:48:32 -0700
X-CSE-ConnectionGUID: A5hQb6lrRy++o0Ng6jr6Bw==
X-CSE-MsgGUID: vKtBBsqfTIePPu2/jBnpEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="244612354"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:48:30 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 1/5] tests/prime_udl: Fix opening
Date: Thu, 21 May 2026 19:48:16 +0200
Message-ID: <20260521174820.167237-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521174820.167237-1-kamil.konieczny@linux.intel.com>
References: <20260521174820.167237-1-kamil.konieczny@linux.intel.com>
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

