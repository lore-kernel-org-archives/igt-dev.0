Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91A8C54E49
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 18:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604A210E5A0;
	Thu, 29 Feb 2024 18:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5EJH5MM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2465510E410
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709229610; x=1740765610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eHXvSP+/9RmmiXwq+kyXvecaN2EmBisiSAbCvGI9V0c=;
 b=Z5EJH5MMw6198HT2Ls/w/QGcbDqeL44Ae7pm44U81hsPiUgeX0bdDW+V
 Hon7A9eTg5RlLkfEAjgGhqnJvslgvhBq2H5cHND7zofhSQB+/2KYsEEKF
 KD/NcTDsgIz1LDfAzeK3fwUnUalcmm3sXPwLxFHNYHtAJblokeO3Tgtgi
 iQza5llf3PgWNhfhRju2idF+RRSIb8oELE7at3w0dtSOpVouom5U6UNbm
 x34XfElPfFyU+YEghxkv2UPFN9Hd+SG+DoEYUeXCNGGVSAWrA5G91y+q9
 R5b9FAf4WziPfp5aA+dE0biEb0mIpbj5461LB1nMpFNmRCiMg5JrLNBMR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="21264859"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="21264859"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 09:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8338019"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:59:55 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel-ci/fast-feedback: HAX PATCH DO NOT MERGE
Date: Thu, 29 Feb 2024 23:40:21 +0530
Message-Id: <20240229181021.130314-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229181021.130314-1-kunal1.joshi@intel.com>
References: <20240229181021.130314-1-kunal1.joshi@intel.com>
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

Just for testing
Do not merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..06863f1a2 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,11 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+#HAX PATCH DO NOT MERGE
+igt@kms_big_joiner@basic
+igt@kms_big_joiner@force-joiner-basic
+igt@kms_big_joiner@invalid-modeset
+igt@kms_big_joiner@force-joiner-invalid-modeset
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1

