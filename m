Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00C7C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BFB10FBD1;
	Thu, 14 Mar 2024 14:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjShzsy7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5552F10FBD1
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710427148; x=1741963148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x0Ay5q7LKa7mmt56q8Cja4pzt7nDxZ1PBcetgdhVsY0=;
 b=KjShzsy7+PO/T2ln3N2Vw9Wjc6DCoZvued1R4/eekqWLcSNKNGaWaYZH
 u0lyBn/eK+se8rfl+fcjChKnqW88W6cOZ2rTSMQdpeOAlMfN3MQGh9k1G
 mJcyQRhmttBLgXj+yiW8hKWtDm9GQo4N6dh0cok+fw/X6TQi6TQwmcX4t
 n39lz0t8Q3WgUGQvWDuPCdFvCiBXu14UiFIylmIupcOAZVCF9HBjIitSg
 tGvjA7YQir9WlPdZRvpP/SQGWIGpkVn4YssWqx85cltH7CE7HaueB1AiQ
 5RU1ZlKkHw9tmP9CG9bvMMH3b2Ul8jWapdtSC+IrS4y3eUFN/vinmnh8G g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="22706797"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="22706797"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="17036652"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:39:07 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v4 25/25] tests: Update device_reset functionality
Date: Thu, 14 Mar 2024 14:34:55 +0000
Message-Id: <20240314143455.1436688-26-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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

There is a need to keep Sub-category and Functionality different, so
automation tools can work properly.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
---
 tests/device_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 018c8a9ac..d7163b277 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -20,7 +20,7 @@
  * Description: Examine behavior of a driver on device sysfs reset
  * Category: Server
  * Feature: reset
- * Functionality: reset
+ * Functionality: sysfs reset
  * Sub-category: Reset
  * Test category: GEM_Legacy
  *
-- 
2.34.1

