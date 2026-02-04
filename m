Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245BFE83EFB
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 09:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C176D10E59C;
	Wed,  4 Feb 2026 09:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVUiE2Yl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E37110E59C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770197233; x=1801733233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EAvr0JobgBqJiMIDWO1TzQJakm2X4ZV7wbCpIL2eTD8=;
 b=CVUiE2YlJjEaVhhmO9i65LOTV4BqVXs45VQY/OkFoyjBtagVnc0O2Z2g
 TIXjdkTwdpW41Imz2a5QUDUFMvc318bUVytUHLsZl35N6pgk6pfsiIxP1
 hrl/22teRQ8xXPkAjRzaVKK/JbyX17A2FZRX+H5jg3uWjiYfx5lgd0Tcn
 JcZUki6oxZClnbPdVeQHRfwvuk7wInYotAJiU9CkMBIZacAcOm96QQY6q
 +qotMPzjEoFQ29zrynkthwd4cZZpeX6MhuKkrVSkNrFQZdnbSb9jeIZlR
 QMe5yyIQBSodV119E7eQ9Ler60IsQ6DHvC4BQqx2TVe3KiJGhLKLCxWPH A==;
X-CSE-ConnectionGUID: EFmvjxCXR6m8HxeJCnYGvw==
X-CSE-MsgGUID: 1rxHlpBBRX6rKiy4TvhDrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82813032"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82813032"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 01:27:13 -0800
X-CSE-ConnectionGUID: D8zNv/INS76iwb+ss9frag==
X-CSE-MsgGUID: OpaKJAb/SGGY/BmBVIIssw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="247703076"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 01:27:11 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/intel/xe_exec_multi_queue: update test doc
Date: Wed,  4 Feb 2026 10:26:53 +0100
Message-ID: <20260204092653.112994-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260204092653.112994-1-pawel.sikora@intel.com>
References: <20260204092653.112994-1-pawel.sikora@intel.com>
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

As 'Hardware Building block' is not being used elsewhere,
change this documentation category for the test to 'Core'.

CC: Jari Tahvanainen <jari.tahvanainen@intel.com>

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 9a0274496..4a0e88402 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -5,7 +5,7 @@
 
 /**
  * TEST: Basic tests for exec functionality with multi-queue feature
- * Category: Hardware building block
+ * Category: Core
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: multi-queue
-- 
2.51.0

