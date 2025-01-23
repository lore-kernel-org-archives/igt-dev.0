Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AB6C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 09:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DD610E7B7;
	Thu, 23 Jan 2025 09:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AA7hPnCP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7F110E7B6
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737625950; x=1769161950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/RR6YVqFPWhMGtHJsrFqV2bKOx/1N5oNV2YHH6EMUVs=;
 b=AA7hPnCPTnDpec4T7tSJX3SB6+sfpmJYyD5xBNEqAvMmf8ALX5LLV+kc
 dqF4pbS2SLIpDp9+w/jDnuHZK2VTxS/uTxlkXcIlsQfDvrWQ41bedrtvK
 ylslZPTAlxN6orb3XnDzp7u8uFUYVKN/bM95KHoN8aZljcRJ67FU04Hvk
 siFApKbBNIMke5CeL1X781YRAs6x4FRPY7VzubwCmH4Z6iikLaE+xvZ2g
 YR2Ynv1QqjtN+N1OMps98YH2Sxo17urb/VYU6VGOrhtM04M3MNL9emzn6
 SrwpbgoT27BapfptJIfTimrRrOLYOBlLqMvVZgHrqQTYvVzslxp55yf9g g==;
X-CSE-ConnectionGUID: V1xoc1o7QkizTN9pcqAbLA==
X-CSE-MsgGUID: EH0LqqVHQq+ciCSKGyTbdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37814771"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37814771"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:52:25 -0800
X-CSE-ConnectionGUID: FMMBmGmbRb2PvN5l1LIYBQ==
X-CSE-MsgGUID: 08kLCL1NRQW5lsD82nx12w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107407514"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.85])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:52:23 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/3] lib/igt_device_scan: change device list variable
 visibility
Date: Thu, 23 Jan 2025 10:52:07 +0100
Message-Id: <20250123095208.72984-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In commit: 2e8f3e06fb (tests/xe_evict|exec_threads: Use fd reopen
to avoid corrupting global data) I simply changed tests which
corrupted device list global variable. i915 didn't use opening
devices in multithreaded tests but this changed with xe.

Device scan is now unconditional so we may change device list
variable visibility to TLS. With this reverting of above commit
should be safe (but I'm not sure is it worth to do this).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device_scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 44b632008b..c36b0efa90 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -247,7 +247,7 @@ struct igt_device {
 };
 
 /* Scanned devices */
-static struct {
+static __thread struct {
 	struct igt_list_head all;
 	struct igt_list_head filtered;
 	bool devs_scanned;
-- 
2.34.1

