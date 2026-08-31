Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40C6C61DFD
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 20:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4547810EAE4;
	Mon, 31 Aug 2026 20:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0bZJtZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DE010EAEA
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 20:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788207878; x=1819743878;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=ILeI00XqIivnSxFjvvRXvU8PyfcYSGKmQBGXm7CGkWI=;
 b=G0bZJtZ7zwGuCVMaBvnj93PT5jItUDEmpPr32n5i4hzKVvavLKm63C7l
 SnNPugDE0IxeBqIvTH4YUls7Hhqysgk+y3w2JGmcZCO/Jqin3XThyx23X
 QEkPMs8ZMX0IMZBvayeRN4ZpomOEeDGlaJsKcduMLMJOOhEwvs4OvjpXy
 Z0Ls4/f3dBfdLxSIm5MXWH3arhzWwDkzgPd5UeN/DWKMM7eJyPmyCgwxz
 Kffa5iVdQR9t9Re+FA1ZsIPolpb87ZvDqhoWAU14mH1XSgrApH56aU/Ms
 ZBp+jCG0O3s7DKRWU6WHl4RFGkuzGszyjMJQJZFISdXngA0LEMjh+vUBT A==;
X-CSE-ConnectionGUID: tLleoLJDRlKrPwGxKF25Gw==
X-CSE-MsgGUID: HOLZDoDAQdCwcZ4diChwqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88647535"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88647535"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 13:24:38 -0700
X-CSE-ConnectionGUID: oqEHeqdNR9C/Z7BfFt0H1A==
X-CSE-MsgGUID: kS5swb5xQGqgIZWuY2dPyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="307110558"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.121.64.167])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 13:24:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Mon, 31 Aug 2026 13:23:45 -0700
Subject: [PATCH i-g-t] lib/xe: Use proper GT lookup in xe_gt_get_tile_id()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-gtlookup_noncontig-v1-1-37f22a0cbb6b@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMAxA0atI1hasE+pVRMQhrUFJpFURxLtbX
 L7F/w94dIQemugBhxd5Eg7QcQTTMrBFRXMwpElaJlWmlT02kfXcexaehA+ySmdo6nLIizE3EML
 doaH7n7bd+376/LI+ZAAAAA==
X-Change-ID: 20260831-gtlookup_noncontig-13ef96a45b4f
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=ILeI00XqIivnSxFjvvRXvU8PyfcYSGKmQBGXm7CGkWI=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqleMFYpYw8EjJ1uvc9HXsKiiokV3bn/mDFb6G1
 q9lrMSbw1SJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCapXjBQAKCRBNeSQFyHKQ
 BNYkEACmCllf6yE4gb6uBJ31CehQrmOfNygsZ/T2AmNNDNpciP0Bvc3Bptp1T3T7qdRu/4Qo/3Z
 vz+D0xgHA5irAaQQU8Bg/0DMyGCTpA2KBA7m15Rng7DzJMKoRwzT5I75w+eRXH4Bq9dRWjIMKdK
 CqM01YXEualL4yfgTnskhxh13q9fEgQMXHkKK2Bu7dGP9EUy2TuxHNV7ryvyLMP1cVZCw6pL1PJ
 ukjugI/Xd1n+VRBVkdUdRHDMAMkLOw2vFb5ijobu2Iqly5aLiCsjbVhcPh8eW1oPFJqun4EZTLk
 klCvRKx1STL1iA50PSq4BzE4Fca272xaT0BkK3R0HsjhfAR/T572l+vHzZBNrfnHPQUxy69zScZ
 LA8WPWrdBuVRnvATLKuyZHkkwTQIDmRplIts+lmxAsFnxvR0ZRO0FFhxo+h9myjL99F90c/mbaF
 FnU2zhSl7dEeZm/slLa+CmkyGckFW9qK7Pjt0s5lUrbccssNbXfjlUxjTm5nN0LMatW1rwgwQUl
 HcaZWRxRQmUp+X9AQD2tXH5EN0injlxt5aXrjUGX7uKy3qL32CNFlxEi6ieceukoJ2lnSZ1NjcE
 d66/U8trr5cTxjZEssD7Rv/8nWrQwbRnGCDRip1H40ruXnTDcDFFDvWJxccQLe0WOODqkA19XOR
 NxyvtO6y+2F0DUw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

xe_gt_get_tile_id() should lookup the GT record associated with a GT ID
via drm_xe_get_gt() rather than directly indexing into gt_list[].  The
ID may not always match the array index on future platforms if we ever
have cases where GT IDs are non-contiguous.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/xe/xe_query.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 68e60ddc7..0b309be03 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -1070,14 +1070,16 @@ bool xe_is_main_gt(int fd, int gt)
  */
 uint16_t xe_gt_get_tile_id(int fd, int gt)
 {
+	const struct drm_xe_gt *gt_data;
 	struct xe_device *xe_dev;
 
 	xe_dev = find_in_cache(fd);
-
 	igt_assert(xe_dev);
-	igt_assert(gt < xe_number_gt(fd));
 
-	return xe_dev->gt_list->gt_list[gt].tile_id;
+	gt_data = drm_xe_get_gt(xe_dev, gt);
+	igt_assert(gt_data);
+
+	return gt_data->tile_id;
 }
 
 /**

---
base-commit: d822caac6e3589c05fffb63fbfc89134b0f7ccb3
change-id: 20260831-gtlookup_noncontig-13ef96a45b4f

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

