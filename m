Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0B1C8303F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 02:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB7910E145;
	Tue, 26 Aug 2025 02:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NX0fS0wa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EEF10E145
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 02:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756177127; x=1787713127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zbEtJLOKQmHEqD5s1tMRrFvBQwI46WuqoMmVAegPRzg=;
 b=NX0fS0waXjyQGMR3RQp2PBAYWtvzvOW3mX9kipErdeJQtUIx9WWIdlBb
 g/uhuj1yEy2hwKrNMFWeFCF1MzHBknbo9y1CHyQWbGRRAZJJuKVxuYqAy
 lE3SrpUoolTJhb8ukFqQEQE9fICQtRCpYTF8JH99ct2JL5l664a6FxLsu
 14Kqgn8TSwxnfSjkiwNWmYsBCCcj/bZ+6G8iTOuDnUX2p/ShOvGTMMnr9
 0YNde/AhmOJelvu8ynDviie7t0XiMNhdquekryC+HbP+vj7NjJ6xvC5be
 P0Hv0i+xHzI7s3ybfFt97zK4w8mMFU1vT1WJKVcAC9A/KeCaUJLYbUg73 w==;
X-CSE-ConnectionGUID: kiSgNAbPSHuDfDipgL9IhQ==
X-CSE-MsgGUID: CviDd0GwSZW7X1P3hR/sTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="61037893"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61037893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 19:58:47 -0700
X-CSE-ConnectionGUID: 5dG3Ahn0Q/GQ9rg9CTb3hw==
X-CSE-MsgGUID: z2O9nkQ8S72o7DoRzYkyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="200350272"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 19:58:44 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_async_flips: Optimise crc subtest on
 simulation platforms
Date: Tue, 26 Aug 2025 08:25:17 +0530
Message-Id: <20250826025517.1108243-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Restrict the crc and dpms subtests to execute on a single pipe on
the simulation platforms as the crc calculations are slow.
This avoids timeouts on CI during execution while ensuring
functionality of the test is verified with single pipe.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 733abf417..817de92b9 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -888,6 +888,13 @@ static void require_linear_modifier(data_t *data)
 static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_display_t *display = &data->display;
+	bool single_pipe = false;
+	const char *subtest_name = igt_subtest_name();
+
+	/* Restrict to one pipe for crc/dpms subtests on simulation platform */
+	if (igt_run_in_simulation() &&
+	    (strstr(subtest_name, "crc") || strstr(subtest_name, "async-flip-dpms")))
+		single_pipe = true;
 
 	if (data->atomic_path)
 		require_atomic_async_cap(data);
@@ -916,6 +923,8 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			test_init_fbs(data);
 			test(data);
 		}
+		if (single_pipe)
+			break;
 	}
 }
 
-- 
2.34.1

