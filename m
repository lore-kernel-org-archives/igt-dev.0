Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C684DCA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 09:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4FC10E357;
	Wed, 10 Sep 2025 09:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czMn0VNf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD20810E357
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757496207; x=1789032207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZVG7oA/SEn1zHOSA3nBpQI9ahbvnOPZ4otUShhUBB1E=;
 b=czMn0VNf/LLNYxYrV6kJgmiYFBwirDcacdlY/9FFJqDXuG0JnUBT36UC
 fkkzX+m61DJuNYyxwNnfPT0jeioULhbebsLv3DV9J2mYZR1bdxFc20Yud
 jA3L8nc4GdcO+wDfsdgxPKdL25hvLRQJOtu1xI2soLbNmr5nRe51wCRoD
 ftSoPwFdG/asB+XnNelv5AikpNza7g29ISPgplCJaYFU1qd75RVVmO0LL
 uJ65Fi8/DY2eyD53lNUEO8maPfr3QRDAAPXqn+sKmsr702llJ2kMtfbax
 a3TZPT9fB3nT9VlMW83QYDXnOa2q8IBrREOho6UMZY934CP+iiNFMwieS Q==;
X-CSE-ConnectionGUID: hETMGFzrRBm28Y1c62s6qA==
X-CSE-MsgGUID: UVvRdMwJSBSBM7VgVw3wMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59747781"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59747781"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:23:27 -0700
X-CSE-ConnectionGUID: YdT3cUkvSy2SczyK/JAdbw==
X-CSE-MsgGUID: fySixJrIT82bHj7AIUbwoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="173795173"
Received: from agladkov-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:23:25 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] lib/xe_ioctl: use valid type for bo
Date: Wed, 10 Sep 2025 11:23:19 +0200
Message-ID: <20250910092318.117177-2-zbigniew.kempczynski@intel.com>
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

Fix bo handle type as it is uint32_t, not uint16_t.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 62e9fe9ebf..edd36db9d3 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -514,7 +514,7 @@ uint64_t xe_bo_mmap_offset(int fd, uint32_t bo)
 	return mmo.offset;
 }
 
-static void *__xe_bo_map(int fd, uint16_t bo, size_t size, int prot)
+static void *__xe_bo_map(int fd, uint32_t bo, size_t size, int prot)
 {
 	uint64_t mmo;
 	void *map;
-- 
2.43.0

