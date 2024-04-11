Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FAACD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 11:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1483D10F016;
	Thu, 11 Apr 2024 11:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7xq6dSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD85F10F01A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 11:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712834260; x=1744370260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+hEQH16MfZ5r74BA8zY3t1Ww+ZDwbveCS2PDnV99ZVU=;
 b=f7xq6dSt/mCuc5B0Iu3i0RcisrpKfydiAlzr8tEQk0P63LesFophLybV
 1I4agp88C9uUKRzDHnVKvFQL2jWLqMflsF01Hsm6PvWZSPn6m2TixGM7o
 4CdhQw51uaMn8QgW4n7CA/VuCkQRfmw6fFfFTFNTPh0q9na+Bot8elnQJ
 jnCT/T9oG/7gwK0aHQgeVAMZt0BRkN8MSv/OYDh7hjJUahIZgIz2L3lxP
 OmvTbVvlfN7FPyQqDIR0AO9ga8usGNSi4iZgU+0b4JI5yVneK9O8zpQZo
 WAqIPI8aLgmXnjwv8FyBZClNZFN0G+tmf7FHRTbpcpX4dmhSjn1CBU4zC g==;
X-CSE-ConnectionGUID: jZHERd9qSK+nHOsR6yhK6A==
X-CSE-MsgGUID: HE6vXxooQDGeGP4a0MBOGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8344487"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8344487"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:17:39 -0700
X-CSE-ConnectionGUID: Jkr1hTKNRHWJGU/56RDtKA==
X-CSE-MsgGUID: jwPp5j+GSPWr3lBZIj+EtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="44156100"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:17:37 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v2 1/5] tests/intel: Add missing Sub-category for
 xe_waitfence
Date: Thu, 11 Apr 2024 11:17:13 +0000
Message-Id: <20240411111717.2941810-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411111717.2941810-1-katarzyna.piecielska@intel.com>
References: <20240411111717.2941810-1-katarzyna.piecielska@intel.com>
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

Add missing Sub-category for xe_waitfence subtests.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
---
 tests/intel/xe_waitfence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 071e67bd6..45378d95d 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -140,6 +140,7 @@ waitfence(int fd, enum waittype wt)
 /**
  * TEST: Negative test for wait ufence ioctl
  * Category: Software building block
+ * Sub-category: Synchronization
  * Functionality: waitfence
  * Test category: negative test
  *
-- 
2.34.1

