Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942F8D31A29
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 09:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFA810E56D;
	Wed, 14 Jan 2026 09:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+d0I3iu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C7810E56D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 09:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768383768; x=1799919768;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8angmMfzFdSNY3P/wq6bsSL5NH2laaBliAF94kIGLac=;
 b=D+d0I3iuVJOvkE53lpbcxWRhynyHZrIw0QhbwU389iBx7pQeRm3Ns893
 eaDh7LSb+SMwAkLKOcfDbUB1hhuPcWDvV65lA66bWCuVBwoNnuCgLc+ip
 7n7As6ET/HqILSVj2HcY8QME2Ptu2i8KFL4N8swQn5u/GaHFnWiV2GiqX
 g0iMxIfmq631UAxQjHdlbpLWXchUbK/67YMGT3uG3RPQwfCxUsDpAHZ3e
 QH2eZatIQo7ZQzW7TdftQnScVqy++SZDICD5DR8Rmx0M/+9QjfllYg6s6
 CIPsy9zj4Q0Hb3zW3Ek10ssHAkNl8MaM7hSDH/n9TG32X6PzaNdr0A5nU g==;
X-CSE-ConnectionGUID: ftgSbv+cRJSUV24+2gBtYQ==
X-CSE-MsgGUID: ZrMwegraRhq3juplZxL/dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95154510"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="95154510"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 01:42:48 -0800
X-CSE-ConnectionGUID: K+rfSyA/SSuK1ia2Zs7tnQ==
X-CSE-MsgGUID: RM4mz2Y3SZOYERJHicB59w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="208785509"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by orviesa003.jf.intel.com with ESMTP; 14 Jan 2026 01:42:47 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add igt_info
 instead of igt_warn
Date: Wed, 14 Jan 2026 09:42:47 +0000
Message-ID: <20260114094247.851502-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
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

From: Nishit Sharma <nishit.sharma@intel.com>

Replaced igt_warn with igt_info in test output to prevent non-critical
warnings from being flagged as errors in CI runs. This change helps avoid
cluttering CI logs with benign messages, ensuring that only relevant
issues are highlighted during automated testing.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 8af66d76e..412ad0384 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1922,11 +1922,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		/*
 		 * Due how system allocations work, we can't make this check
 		 * 100% reliable, rather than fail the test, just print a
-		 * warning message.
+		 * message.
 		 */
-		if (pf_count != pf_count_after)
-			igt_warn("pf_count(%d) != pf_count_after(%d)\n",
+		if (pf_count != pf_count_after) {
+			igt_info("Pagefault count: before=%d, after=%d\n",
 				 pf_count, pf_count_after);
+		}
 	}
 
 cleanup:
-- 
2.48.1

