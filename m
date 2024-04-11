Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9BBCD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C5C10F0B9;
	Thu, 11 Apr 2024 13:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nw61v/4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EB910F0BC
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841377; x=1744377377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7vSUNS/s+qc7d2RL0GP5EJrgajdlHqgyWjfGljnf3I=;
 b=nw61v/4V2Rp9t+P+4+BYUp1a14jR3lxd4S15Ms7MiDQ/o9zAFT7iMJN4
 hbYklus4LE8kiezYQmmlhSxazqd+yz5P1781gE4UEK5KsLr2dqKrHc8Ux
 lf06ojovnDvL8ECATQDrIZiS2leX9EwVK0C1kPXmh5EJSrSEJWsCCPonj
 OUketBOY4NLE/KjBqOWDleWhxWtOED4TNZtj0uUCLy+2dwbm41p/bH5bK
 J2omMSIFFURJm5JZwOe0VBkhdjBIir+rTboFvlZWN0qEiLq4lW03qdztX
 GdEZxwmJzgBaEMB/DWnC0+YE+dtIQLn7MnT4sIwdbCIFQ7wAKYgnTt3NA Q==;
X-CSE-ConnectionGUID: fWuFJNzSRK6Q6XdzigmFgw==
X-CSE-MsgGUID: 2u67OAehRqaUHvSirn92pA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25760716"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25760716"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:16:16 -0700
X-CSE-ConnectionGUID: Z+xVu2YxSvKg4z+yKspQEA==
X-CSE-MsgGUID: QSs0zE/4R3K+kmQ0iC+FTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21486865"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:16:14 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Priyanka Dandamudi <Priyanka.dandamudi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 1/5] tests/intel: Add missing Sub-category for
 xe_waitfence
Date: Thu, 11 Apr 2024 13:15:50 +0000
Message-Id: <20240411131554.2999053-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
References: <20240411131554.2999053-1-katarzyna.piecielska@intel.com>
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

