Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164A2C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 19:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CEF10F2E9;
	Wed, 20 Mar 2024 19:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8FzQHpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B828210FE1E
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 19:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710962642; x=1742498642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OYKBoNUV7zdr/X6lwY9kqHtGhRu6OIOkv4VGiOId2QU=;
 b=h8FzQHpa8PEK3aD/BIYiLIO7B4AQUf3tRVQPYO4AbHAeaVkWhUnIB5cG
 m3s4+XpXH8LDmgfep5eAPfBp5Q7I5EjwKaSIdQPqW8G95urktgOYxR+Q2
 g5CS8caXvvf1CxGXf64XZYmzQxS2BYjCbNRmAPIRkJf5MKGr8h+VAtTcI
 LLG7eStkAW2qUNFhZOA/Md+NlZWbLYUX0t42hguxWsB7rxt+tq77NLb7P
 Xl9p8popT58i/CIdV4qcdMr9v1USQxyROJZmGv65XOL2mB+Ov66et5A2n
 Fid1n+5xcJrjhY/Td3c2iljXRN1y4PTxJdOAw+ldC9mQYsGv9VpbDlXrf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6090762"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="6090762"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:24:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="45242439"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:24:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] tests/xe_exec_threads: Fill in GT field for second
 balancer thread
Date: Wed, 20 Mar 2024 12:23:56 -0700
Message-ID: <20240320192356.359327-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
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

The balancer subtests spawn two pthreads per engine class if there are
multiple instances of the class.  The GT field of the data structure is
filled in properly for the first thread, but not for the second,
effectively leaving it set to "0."

For platforms with standalone media, this will result in failures when
the thread tries to find the instances of a media class on GT0 and trips
the "igt_assert(num_placements > 1)" assertion in test_balancer().

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_exec_threads.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 55907e2b3..977e8c600 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1081,6 +1081,7 @@ static void threads(int fd, int flags)
 						threads_data[i].fd = 0;
 					else
 						threads_data[i].fd = fd;
+					threads_data[i].gt = gt;
 					threads_data[i].vm_legacy_mode =
 						vm_legacy_mode;
 					threads_data[i].class = class;
-- 
2.43.0

