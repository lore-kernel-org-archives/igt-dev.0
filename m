Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E15C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 10:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD9B10E9A0;
	Thu,  3 Apr 2025 10:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FILwfySN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C59D10E9A0
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675969; x=1775211969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fhDjzdOosXtqkRm4lZm4pL0QNJuo+3pboXKr9X+B1I4=;
 b=FILwfySNNGSI0ges6EpQq0zRmTHpRWYB8CGJIxqVVD1MPIXMLe6ClASd
 VywRKTWcB1h+BmcoASFx2PCUP1JpKxbiO1BnjC7Lz/hvzGnhUKaDNDCYR
 lturPq4IKCvPP0vWHGupEQwfuG7KjM7f9gqk3Op1oDGEVTRAvIme2B7a/
 UXfTThMVWRDgCoXY2pUTO43pDr4UWGvFroNmpu64JUHLUgwSXkVfCEFrI
 xIBy0Jx4EC/OHjgZM0RNdEF8WDQjWzAEVSpGjLaChWjNzdz9Rx+IJVALv
 pu0ggmAcUr3ZCNKlP4LHkIdsq/pPkd18KjtUrl9yumtvx1U8e0c+13fVY Q==;
X-CSE-ConnectionGUID: Xppbnz68TeSuUqwR0y3caw==
X-CSE-MsgGUID: 9Drnd0wETfyi9+FW8DzKMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62475587"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62475587"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:26:09 -0700
X-CSE-ConnectionGUID: UY0d8UJcRJWICFlJyDY13w==
X-CSE-MsgGUID: ehcO/dXKTKe7+ygcYRgenA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126768353"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:26:09 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Prevent bigjoiner assignment if next
 pipe is already in use
Date: Thu,  3 Apr 2025 16:11:48 +0530
Message-Id: <20250403104149.2033579-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403104149.2033579-1-jeevan.b@intel.com>
References: <20250403104149.2033579-1-jeevan.b@intel.com>
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

Added a check to prevent a bigjoiner pipe from using the next pipe
if it's already assigned, avoiding conflicts and ensuring pipe
allocation goes smoothly.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99c8707c7..f3bc481f2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6777,6 +6777,14 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 				return false;
 			}
 
+			for (int j = 0; j < pipes_in_use; j++) {
+				if (pipes[j].idx == pipes[i].idx + 1) {
+					igt_info("pipe-%s: Next pipe is already assigned to another output.\n",
+						 kmstest_pipe_name(pipes[j].idx));
+					return false;
+				}
+			}
+
 			if (!display->pipes[pipes[i].idx + 1].enabled) {
 				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
 					 kmstest_pipe_name(display->pipes[pipes[i].idx + 1].pipe));
-- 
2.25.1

