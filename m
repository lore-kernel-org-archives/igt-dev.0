Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC37C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 14:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FC110EE2B;
	Thu,  1 Feb 2024 14:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4/kKb2T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EFF10EE18
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706796637; x=1738332637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=78uUGdPZP3RXhk0BkzZOi+1cZhLfuI3fEUh6GrgrdZ8=;
 b=e4/kKb2Tguq8zBbx/iXRmRSKHYgM/tl7ICkVHMQ3AGyHgTpaLEz6LGHd
 KgOX/n2ctCvKC1vhv+E/5FV72aCyjLj0bOR6Gt5oP8cz47BVUQn2PLLog
 ZzrHG0U14NlKREOmy7O8lcfSIT3Z+An2nDAACKetuUA6CWqhIvsix7RV/
 eQ8H60qDQdXCl5O5Byx/Fz23/CsC9NlvvU11CiS8v8OdGyU7p3gLJesE+
 A6P6k8a+YrrWoFPAltYFAKhIbo8kwszX0ZRKxWbUImDL9JCd8J9PTxhXf
 gU7WghQpHjpotMexvcDUsDaRIIwvnLE+KBLhZO4r+kPUq0Qnp3ABtNOyj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="119633"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="119633"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:03:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="78765"
Received: from abojovix-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.0.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:03:26 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 1/3] lib/intel_device_info: set has_flatccs on LNL
Date: Thu,  1 Feb 2024 14:03:13 +0000
Message-ID: <20240201140315.334388-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
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

Xe2 supports flat CCS based compression, including igpu. Currently
HAS_FLATCCS() is incorrectly returning false on LNL.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_device_info.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index a669797c3..64b5246b7 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -509,6 +509,7 @@ static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
+	.has_flatccs = true,
 	.is_lunarlake = true,
 	.codename = "lunarlake",
 	.cmds_info = &xe2_cmds_info,
-- 
2.43.0

