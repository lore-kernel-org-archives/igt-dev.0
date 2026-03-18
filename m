Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B41103E187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 14:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CE510E823;
	Wed, 18 Mar 2026 14:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+d2jeZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2F810E04B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 14:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773842560; x=1805378560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J5xMG8fjXUle/zZ/sLIjOAdqvDiDWTwIavgFOMxQdL0=;
 b=Z+d2jeZtmJ47/CLoa3ahpcGsgmwR/2rVDHExwlKQmMfVUDkQLf+o6NtR
 KL/x4gU49Nzxhq19D0jppdNouCAI+AIYtueRiLBb/Ryho3oTtngKnBfLN
 akFmb0xfQGYFc+8oBVcM9TuIjg67PvQHzcobfhvSNndp8cJJrymJoVjF6
 vGzb08xvNYsNG3qPy7iTIcxJYMKWmaku8iOjmGq+gfwlCMzg9Jb0F14Z3
 qxaTRn9QACVzMGO1RWYn4KAnjBnIL6G6k8w7dCwtZV5wCRmXzB+i3KPix
 uf1gjIK3NF6Axf4co0pquPEJdF9vBn6erU8O6UJb4LOAi4ZnjLr0VU1jg Q==;
X-CSE-ConnectionGUID: QWOMGo0HQSaivwz3NsdnTw==
X-CSE-MsgGUID: DbGa9Sq9SF+2NbDhGFdmTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85592426"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="85592426"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 07:02:40 -0700
X-CSE-ConnectionGUID: zDSCYRsTRSmBp1nVPDuGNQ==
X-CSE-MsgGUID: RW30K4zvTwClP4RRpYbfIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="222603790"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 07:02:38 -0700
From: sumit kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	sumit kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_properties: Add skip on headless machines
Date: Wed, 18 Mar 2026 19:31:20 +0530
Message-ID: <20260318140120.283593-1-sumit.kishore@intel.com>
X-Mailer: git-send-email 2.43.0
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

Print debug messages for sub-tests which are expected to
skip on headless display systems.

v2: Use existing library function, instead of
    defining new (karthik)

Signed-off-by: sumit kishore <sumit.kishore@intel.com>
---
 tests/kms_properties.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index f735839da..9f5649c90 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -377,6 +377,8 @@ static void plane_properties(igt_display_t *display, bool atomic)
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 
+	igt_display_require_output(display);
+
 	for_each_crtc_with_single_output(display, crtc, output) {
 		igt_display_reset(display);
 
@@ -400,6 +402,8 @@ static void crtc_properties(igt_display_t *display, bool atomic)
 	igt_crtc_t *crtc;
 	igt_output_t *output;
 
+	igt_display_require_output(display);
+
 	for_each_crtc_with_single_output(display, crtc, output) {
 		igt_display_reset(display);
 
-- 
2.43.0

