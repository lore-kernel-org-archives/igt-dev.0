Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4628BC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E995B10F3F8;
	Fri, 22 Mar 2024 12:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7FzrROq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314A210F3F8
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111331; x=1742647331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6J60fVI+P1QLfDa/8CobyxA79TpCLn2yhrsxxu6JKOE=;
 b=f7FzrROqQUi8pMEAw9WPwILSa97M+kvA8zENtTIpaLE0ATTlMtNL7gMm
 xGN2z8twmpuGJyVmoB7px0WvudpIp5JKucMt1x8qwo3XsbWIBqYIsywPF
 /EmfjxlGK4qHfpQ72u9sBvpHE6FmAgw3vfw5g4ziW5x1LxFNu+dO/4hph
 BTHP9SzsOGXCWFDfL8a8fOg4c0V1igoJMMIuabMtDmvCXbmdNMrr5DHC9
 VOZ5iQvRzCYrnHKcfQFKJqP6X1Uv6SgTclu8A8immDvejmhZmBB4OUNyN
 vyPHzJwAgXNOVlzOuk8gHdROd8ZrHF5ITaolZeEXOl/4MgRrk6iS5BgMy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9919336"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="9919336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19585924"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:09 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 04/12] tests/intel: Let's have Firmware subcategory in
 Xe tests as well
Date: Fri, 22 Mar 2024 12:41:00 +0000
Message-Id: <20240322124108.1825345-6-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
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

Let's put HUC test to Firmware subcategory to align with i915 docs.
Also change functionality name s/HuC copy/huc copy/ to align with i915
test docs.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/xe_huc_copy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index ca045c41b..339cf6e5f 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -6,8 +6,8 @@
 /**
  * TEST: Test HuC copy firmware.
  * Category: Firmware building block
- * Sub-category: HuC
- * Functionality: HuC copy
+ * Sub-category: Firmware
+ * Functionality: huc copy
  * Test category: functionality test
  * TODO: make the test more generic, getting rid of the PCI ID list
  * GPU requirements: This test currently requires TGL, and runs only if the
-- 
2.34.1

