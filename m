Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4059CCF9E0
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 06:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A058E10E08F;
	Thu, 23 Oct 2025 06:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYBpOivO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D25410E07B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 06:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761201885; x=1792737885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RNwgJolRScQ0rUnvJwi26wJbFwXJ0wCTzzO2p1f78EU=;
 b=eYBpOivO/kHxDMP/W03E8ia4stKKDQ0U1TzHRXecJAu+jmb4LM/uEUfq
 Rk6HdDSnY4T2yF1+t+FMFuZj0vyavD+my6/iM/p+OP8ifR1lFFwzi4MN8
 +FRJLidVrGSP1eyutPh+Yjs5WsV59SNhC+ubw0VMJOaKlC/7SISYx5WO0
 WM0Unch6uGhRQL3+DgftA4Ao12q+3AaIuMS0rarHXvBFwi/Y576uScJxG
 EcrwJymUlwAA4kr+eNMRwYXTf0VkBH1hdzqO7KYVXMN+la3wrkVNcDsqp
 34Q+XGSjboF6yvH34CLJc4TcOaBMldRHRIRl76cOt/GiBWgTVFN0ICK86 w==;
X-CSE-ConnectionGUID: cSY5eDDhRxaWfL/rDDI0Bg==
X-CSE-MsgGUID: AObPk2AFSLGkUqIH80Nkqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74707728"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="74707728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:44:45 -0700
X-CSE-ConnectionGUID: b1bPfnxlQGmU/Y4sgq0jrA==
X-CSE-MsgGUID: DF4P7atpQtqp0cCn6WKB9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="207733039"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2025 23:44:43 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v7 3/3] tests/api_intel_allocator: Check if multiprocess
 is supported
Date: Thu, 23 Oct 2025 12:01:13 +0530
Message-Id: <20251023063113.3485132-4-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023063113.3485132-1-s.sebinraj@intel.com>
References: <20251023063113.3485132-1-s.sebinraj@intel.com>
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

Check if multiprocess is supported and if not, skip fork_simple_stress()
for targets that don't have SYSVIPC enabled in their kernel.
Without this check, the test would fail with assertion errors when
trying to use message queues.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tests/intel/api_intel_allocator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 15ba4828c..773c247db 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -487,7 +487,8 @@ static void fork_simple_stress(int fd, bool two_level_inception)
 	uint64_t ahnd0, ahnd1;
 	bool are_empty;
 
-	__intel_allocator_multiprocess_prepare();
+	igt_require_f(__intel_allocator_multiprocess_prepare(),
+			"System does not support SYSVIPC, multiprocess mode unsupported\n");
 
 	igt_fork(child, 8) {
 		if (two_level_inception) {
-- 
2.43.0

