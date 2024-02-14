Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C8EC48BC4
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3250310E639;
	Wed, 14 Feb 2024 06:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ct1gVzvs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EB610E606
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893170; x=1739429170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zgCDW33iBazxGsp6Nw6nyQ1LCgQE6ZBf7HevaPZNiLE=;
 b=Ct1gVzvs/on25spe3UkKXd4jOAyfc2rMJhvB0DLER77P3IXq6Plbo7II
 EeeULspqLQ+wKnJgyBn75ero2Vplk6i1M7Vf+HclxGwOqamtsNPhvZtn2
 rai0akdvKxaGyPrA//FeEAoFUGD37W0ytkEpsOiUogGN6qetA61qkyWLb
 ZPlFII9uwfa1PRwyOthbwDW4FZDtCie+6MKfJeN81giBkFhq+3JtPEMDo
 EYXBqEzu5BlbL+qGzWD7ROyid/lZ/5U3Zfhr/1lrWk0/ipRmSpTyXSZrl
 9s0O3QhoKcKRHjkVCaxHZHZo7dVrIynIsPXq6r/3zqjSbdF+SmHwV24RO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645512"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645512"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427686"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:09 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v4 20/22] lib/igt_kms: Increase the colorops count
Date: Wed, 14 Feb 2024 12:09:51 +0530
Message-ID: <20240214063953.1285495-21-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

Everytime we introduce a new colorops, total colorops count
will increase by (number of pipes * number of planes per pipe)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9dc54d961..66823a84c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -90,7 +90,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
-#define MAX_NUM_COLOROPS 32
+#define MAX_NUM_COLOROPS 64
 
 static struct {
 	uint32_t connector_type;
-- 
2.43.0

