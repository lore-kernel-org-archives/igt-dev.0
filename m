Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8C4C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 07:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9829610E0F0;
	Thu, 29 Feb 2024 07:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiTgBdck";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8F910E0EC
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 06:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709189998; x=1740725998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=JhpCuRwivpsILa9RP4DLBlWTc269GcIonyt9ks6fU/A=;
 b=SiTgBdckEC2UsezewyIwdOIRJJ8znT9DWTbmCpmkFqV4vVxrKq+5K20r
 S7/5JUr2TKbfsT2wJRHo4D9O2VlMHgbTC31Ka4hJcjj9sQgpgYj+kUOBU
 y5FPHrDEoVBF6hkoFRStDNi0tpiluXL/Inkj9ecN3I/155Zd3w2VMxQ0D
 r6YhMg/UcP50CLl3eyDX+kSCMUxMSkGLvYwBOQE1oBY2gXrFAKKBnFXrm
 /TdU+bX89JzbOTFljQqH4pRj8twTjVvfF88yBtTfeMpii6kwVFzvuFAh6
 1Ulh+wPpeYwfSID7I8/6dndzM4/4l2fKi03JslAbbQnunzFv/4dOSJVNE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3755977"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3755977"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7640483"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:59:57 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4D080580E04;
 Wed, 28 Feb 2024 22:59:57 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rfaOY-00000002GEs-3r1J; Thu, 29 Feb 2024 07:59:54 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_evict_ccs: use a different name for
 evict on Flat-CCS
Date: Thu, 29 Feb 2024 07:56:19 +0100
Message-ID: <20240229065953.538861-5-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
References: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
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

evict sub-category was already used for VMA. Don't use the same
name for ccs-related evict sub-category, as we need an unique
namespace.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_evict_ccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 5d6c44a6b3ab..35ae8151aa80 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -7,7 +7,7 @@
  * TEST: Check flat-ccs eviction
  * Category: Software building block
  * Sub-category: Flat-CCS
- * Functionality: evict
+ * Functionality: ccs-evict
  * GPU requirements: GPU needs to have dedicated VRAM
  */
 
-- 
2.43.2

