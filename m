Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1504AC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FD510EE18;
	Tue, 26 Mar 2024 09:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeUpI5bS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4ED10EE18
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445457; x=1742981457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8CyAO0fAnhFRH7kWEukr+3mPuwjzWacPbiP08MaQ1Tc=;
 b=FeUpI5bSDj8XSwGYKl6XSowpN1peg90Z0iQbduj3R3al/rZKtwQtz1Jx
 JVbrfal0HmH/zU0hA3fXSx/gvDn8DcTfyB42DUOAAsiQkKhk55OKyeg17
 WM8zNmykNjdPu4c36oOLDoKLTTlsbvu+FgdSGIiBpA3UpBIEdS2zMmWvC
 GP3Bc5ARj8Ihjy4DZw71zF507n500GKaZJZ+mwCBxeNLtVMfwG86G+TAb
 +t+ltIrdbzwZ6KWdZn2XLpBFqkpHOGPL7NfgF1HsQf9kz4CRKCvr4s3gH
 JralkB1+1AcDFoj39+/u8n9CaBA3nMW7XFl4jTQcbSXE8nYRL6Ak0IhUl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10280058"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="10280058"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="47064798"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:54 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 11/13] tests/intel: Move xe_waitfence test to
 Synchronization sub-category
Date: Tue, 26 Mar 2024 09:29:05 +0000
Message-Id: <20240326092907.1979345-12-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
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

Let's move xe_waitfence test to Synchronization sub-category to align
with i915 test documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_waitfence.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 5a67148ed..071e67bd6 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -16,7 +16,7 @@
 /**
  * TEST: Check if waitfences work
  * Category: Software building block
- * Sub-category: waitfence
+ * Sub-category: Synchronization
  * Functionality: waitfence
  * Test category: functionality test
  * Description: Test waitfences functionality
@@ -140,7 +140,6 @@ waitfence(int fd, enum waittype wt)
 /**
  * TEST: Negative test for wait ufence ioctl
  * Category: Software building block
- * Sub-category: waitfence
  * Functionality: waitfence
  * Test category: negative test
  *
-- 
2.34.1

