Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21231C19F4E
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8C110EFEB;
	Fri, 26 Apr 2024 09:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McZxTZHo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DC810EFEB
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122116; x=1745658116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XkSkorV/4HsbWzciPqFsdP3sppPSqNpFMTZHlXSgPHc=;
 b=McZxTZHo6YSI593An3GJur/8xhq8Li8o8pCHJZ7Uiu7K/lWTq5xCiY7E
 pB07GhYMmj+K6S2m3OSmYh61QYNefC7ZqeTxgBCug22Js6vAq5rdzjTXp
 TRM/p7BqC9anxJ5BudWhto+Cc+BBmWWujl5Z4Cgs0RZOIY1NOi7i1876C
 jgZsAICAeSg+NSHbnUDWbvlsE3E3fQ2GTLvZFLun5lXARF2TjvAiwSHoG
 p5o/Sgga0Pa3eAJtjXQaPOUr2SLlFV5rXkxgyZDdylnh1zYcsnFn8EPZS
 QMhLetb7fj4QS/CYZqKMVLS6E20W6IFjh/OmwJ99oZw9+qZrfV4Xmrypk w==;
X-CSE-ConnectionGUID: jTaf/7FcTe2ilCipU3t8Ew==
X-CSE-MsgGUID: fwPC4FKSRdyf0UjBVSwXiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9717786"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9717786"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:39 -0700
X-CSE-ConnectionGUID: 9oHm0onQTPG/+tYblSPs2Q==
X-CSE-MsgGUID: MAy/VYI5RpmOMOADDMV9WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25402844"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:38 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 04/10] lib/intel_bufops: Drop tilings restrictions
Date: Fri, 26 Apr 2024 11:01:11 +0200
Message-Id: <20240426090117.78060-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
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

Different platforms supports different tilings so instead of asserting
on buffer creation path move responsibility of passing valid data
to the test. It can use intel_cmds_info to iterate over supported
tilings so this is better extendible and requires fewer changes.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 43d6dd5b43..3bf89798ba 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -898,9 +898,6 @@ static void __intel_buf_init(struct buf_ops *bops,
 
 	if (compression) {
 		igt_require(bops->intel_gen >= 9);
-		igt_assert(req_tiling == I915_TILING_Y ||
-			   req_tiling == I915_TILING_Yf ||
-			   req_tiling == I915_TILING_4);
 		/*
 		 * On GEN12+ we align the main surface to 4 * 4 main surface
 		 * tiles, which is 64kB. These 16 tiles are mapped by 4 AUX
-- 
2.34.1

