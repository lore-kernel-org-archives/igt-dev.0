Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69F4C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 13:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D4610ECB2;
	Mon, 11 Mar 2024 13:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7Ui2EOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C0B10ECB2
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710162139; x=1741698139;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=PAn+8u5dbx9m+BJXpUt7g8E/AGJ6xnqXiWPObbHFPqg=;
 b=V7Ui2EODHO0gSc3zGWF2Mw4SeOEuOuxe6VW+TZd8xxbdfXdBpPoAnzez
 OaZpQdZBOEyBpXgwWtFAnsowvGJjbPfMzbf/DEK2Ntwv6u+68zSTWWdtX
 6eQNEwm+GaL7avpXENL0snsTx/3omsKMiUlAjgDrwHAFfRbXrn5i0ikNr
 BwzmiIErtX1h2j71EOowFOgAKwxRiLN1+Y+PqO/ZtrfJX9cCe/jb8Mx68
 Wv9s2uLHgrLVRya1N3hbccaLwB8MizZTt07s1kNCdaZOaVF2jcoTGElGT
 sVqzcxwQoTaCfDDILwj6JGz133Pag+JuUZCosMLEBswQEjq7NijWwTcLR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="22274979"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="22274979"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="48620466"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:02:18 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E88B6580DA0
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 06:02:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rjfIF-000000047cJ-415U for igt-dev@lists.freedesktop.org;
 Mon, 11 Mar 2024 14:02:15 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_exec_queue_property: fix documentation
 output
Date: Mon, 11 Mar 2024 14:02:12 +0100
Message-ID: <20240311130212.982578-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The wildcard is wrong there, causing the ReST output to be:

	``igt@xe_exec_queue_property@timeslice_duration_us-property-min-max``

	:Description: Test to check if %s timeslice duration us schedule parameter checks for min max values.

After the change, the description is now correct:

	``igt@xe_exec_queue_property@timeslice_duration_us-property-min-max``

	:Description: Test to check if timeslice duration schedule parameter checks for min max values.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_exec_queue_property.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 4e20cfd25f0e..b1cdc7ffefff 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -12,11 +12,11 @@
  * SUBTEST: priority-set-property
  * Description: tests basic priority property by setting invalid values and positive values.
  * SUBTEST: %s-property-min-max
- * Description: Test to check if %s arg[1] schedule parameter checks for min max values.
+ * Description: Test to check if %arg[1] schedule parameter checks for min max values.
  *
  * arg[1]:
  *
- * @timeslice_duration_us:	timeslice duration us
+ * @timeslice_duration_us:	timeslice duration
  */
 
 #include <dirent.h>
-- 
2.43.2

