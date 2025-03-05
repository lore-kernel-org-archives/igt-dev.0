Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCE3C282DC
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 00:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838D010E6D1;
	Wed,  5 Mar 2025 00:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IP0UWsPb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC86E10E6D1
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 00:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741136241; x=1772672241;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tje+bC+ipQEp+/bZ2x3Wbhk2DsQVaB1bDNiWxX5UkmE=;
 b=IP0UWsPbocwPMNpQJy7FHdA9unSCIPC85szy9QpfWJM/QcLD8jEhPrWO
 AKmJftKfyayNntR5uyhuaFnFK1ybdvS9px4lxudcTORHqxriI0bwUX8ze
 +uu6INs8BQkT0yGbJGSrA49Xcx70I4T7s+Xw+2/KXqsX/bxBICF9i9fcg
 rRdtXlcdTlZdjU+ONjDBvPtFwwhXIGCaWZ/aX0JiL0JOp+NELVuz69ZuF
 4ciGmbU0uh3U3/vstV+FK/V6uIRTI7t8bSJM7Gz9rRJMfaFhGrAv7x4AB
 xiLF9jqC0ZRWgO2Psud9dFJcdHSJVacn+zfrsz447D8W944vZat72uhqu g==;
X-CSE-ConnectionGUID: GH1hfyg7RfKRVtJvBxNqfQ==
X-CSE-MsgGUID: y9iLfdNfSUy2fgPAp4W89Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44889461"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; d="scan'208";a="44889461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 16:57:21 -0800
X-CSE-ConnectionGUID: WDOgrB5DRc6pOKAyJmWGbw==
X-CSE-MsgGUID: 5T26JamYQiGO6N5TZfnSXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119043940"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 16:57:20 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_oa: Do not discard single reports in
 oa-formats
Date: Tue,  4 Mar 2025 16:57:15 -0800
Message-Id: <20250305005716.168646-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305005716.168646-1-umesh.nerlige.ramappa@intel.com>
References: <20250305005716.168646-1-umesh.nerlige.ramappa@intel.com>
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

Internally the test is expecting a single read call to return at least
two reports. If two reports are not read, the logic retries from the
beginning. This can easily fail if each read just returns one report. In
essence, many reports are available, but the logic causes test to fail.
Instead, count and use every report read when waiting for two reports to
be available.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index dd71683928bd..e5744d830d39 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1314,13 +1314,14 @@ read_2_oa_reports(int format_id,
 	int max_reports = default_oa_buffer_size / format_size;
 	int buf_size = format_size * max_reports * 1.5;
 	uint8_t *buf = malloc(buf_size);
+	ssize_t len = 0;
 	int n = 0;
 
 	for (int i = 0; i < 1000; i++) {
 		u32 oa_status = 0;
-		ssize_t len;
+		int ret;
 
-		while ((len = read(stream_fd, buf, buf_size)) < 0 && errno == EINTR)
+		while ((ret = read(stream_fd, buf + len, buf_size)) < 0 && errno == EINTR)
 			;
 		if (errno == EIO) {
 			oa_status = get_stream_status(stream_fd);
@@ -1328,9 +1329,10 @@ read_2_oa_reports(int format_id,
 			continue;
 		}
 
-		igt_assert(len > 0);
-		igt_debug("read %d bytes\n", (int)len);
+		igt_assert(ret > 0);
+		igt_debug("read %d bytes\n", (int)ret);
 
+		len += ret;
 		/* Need at least 2 reports */
 		if (len < 2 * format_size)
 			continue;
-- 
2.45.2

