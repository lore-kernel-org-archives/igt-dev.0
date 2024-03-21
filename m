Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521D3C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA22710ED70;
	Thu, 21 Mar 2024 15:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfrlLSQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8409B10ED70
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035756; x=1742571756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eg9ewbT2WtmSFWCY8+/Bbmgc6l1q1eIYsaX0Gq2RQrg=;
 b=HfrlLSQJmomI00G6qzuujBZpbeqHYoOoewJUJD4u/NSP9r8u3Kj2pDj4
 GIQOOvBr6gpvlqfGE9LtRTQLUfPz+xsiNZw0fkRk3q2X2BSTNsLxaTegc
 fBhPNTOkKCGFXESJqavRv7Rm2KlbmGvBE+8BiQg1GvLepWGfd1uL5/TQN
 wWFAjmtrbkYJpRHdNCO9tYY4lLOigHcaujEHFixO2Ep7C4aTbOa4IKLP6
 Amf3cCGCR5tlwJcNYiW98p7YkFVBEcrnpA+w9Wcga5sdaa2C5hpmfN6Qn
 2h8rP2FRv8khXNJXO/5f295bWiBMP3ijhuRwUP93ojPNMGO+xb3UkU5BU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5867216"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5867216"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14952556"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:42:35 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v5 22/24] tests: Update device_reset functionality
Date: Thu, 21 Mar 2024 15:38:45 +0000
Message-Id: <20240321153847.1787625-23-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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
index 9ec9a213e..4db7df7c5 100644
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
  * Run type: FULL
-- 
2.34.1

