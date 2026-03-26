Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F657109E557
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 06:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A5E10E236;
	Thu, 26 Mar 2026 06:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ngn4NYmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EBA10E1F8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 06:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774506066; x=1806042066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e0WOAGrM8SjmSAj3gyU/cl60R5dpDTpbVi0qk6vMzVo=;
 b=Ngn4NYmWteKgAfTS12VSq5XRogXA6MPLvTKt+JWJkrO5UkifS7iAUY21
 R418wrrcxCtmp1XhgjHTaQJYS3BqDyu7lL3MYWEmdwNs6V0s4Lw34g31W
 qmRVd9brzqkrItUU99oIpyzknn2BbPktTZCn18JePn2Mm2x18GAIrAezL
 nyMhBQKcLcIQY77Sqy+wYx/6/+7vBJnOLx2gvCbI9mJO8c/xn7DadAarb
 cNaHDp/j2E0deOhZ2cW2Rkv9OH6JtGwoEOLkzONSCyBQID1FR2+jwAY2g
 331dpnP5v2CEXkHqIDH+UnMDav6ltR3wkOMgvX/3NDgGVfsLk2kDYTbRN A==;
X-CSE-ConnectionGUID: nrdEEzq3Qga2zxSfJWwtTw==
X-CSE-MsgGUID: Gmk44n5bSka3robFdMl6DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="98175232"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="98175232"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:21:05 -0700
X-CSE-ConnectionGUID: mZHSnZ4DRXqImE+87u7Xsw==
X-CSE-MsgGUID: m4nIsCDgQQCk1Us1BeCRFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224935967"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:21:04 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v4 3/4] intel-ci: Add VGA chamelium exclusion to Xe
 blocklist
Date: Thu, 26 Mar 2026 12:12:00 +0530
Message-ID: <20260326064201.783311-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326064201.783311-1-sowmiya.s@intel.com>
References: <20260326064201.783311-1-sowmiya.s@intel.com>
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

From: Mohammed Bilal <mohammed.bilal@intel.com>

Remove VGA-related subtests from the Xe chamelium testlist as Xe
driver does not support VGA connector types.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index edc5039a9..80a0ee904 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -128,3 +128,7 @@ igt@xe_exec_compute_mode@non-blocking
 ##################################################################
 igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
 ##################################################################
+# Remove VGA-related subtests from the Xe chamelium testlist as Xe
+# driver does not support VGA connector types.
+##################################################################
+igt@kms_chamelium.*@.*vga.*
-- 
2.48.1

