Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A145C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BA810ED37;
	Thu, 21 Mar 2024 15:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="go25o/0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DEC10ECD4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035663; x=1742571663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tsgsdFrIeuNfetfqXDhhb5djgx3ha41vsuhMg5xTepw=;
 b=go25o/0K/L8LBaIweJrDHKKQ+8r8mWXMqxfhbF8RkV7j2PaHYysP+TXb
 tmW8KduCXFa8ICSOej6/5BDSNzNyQ8oUir55YTh+jyyBnxOjpQiPTQx7P
 xeJSTk25D3TRCD82nSuEVLVnZpQaDbrUmNlvUDNK7k9aianUKreShT16m
 ysjbxnrM1XR6nbv2eVAdePIWtk9LutO7tkfZPC5KQKC9uA6+g8JVWgZDv
 K79Rp8ebU/4SYWGe9QAEfZCeINc2ky0ptOYo+JI7Z/jBH7EEBIgFBw1c/
 +SpYdalAaqIZiOJJZSBDMBq6uQBTvnkWBj/BdK0BcR23XDcj3SCTdJteK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5885154"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5885154"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19197728"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:01 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v5 12/24] tests/intel: Introduce Render copy subcategory
Date: Thu, 21 Mar 2024 15:38:35 +0000
Message-Id: <20240321153847.1787625-13-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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

Let's put render tests under Render copy subcategory.

v2: Change functionality to render_copy to not break automation tools

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/gem_render_copy.c       | 3 +++
 tests/intel/gem_render_copy_redux.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 57ca2c9ec..91979ba07 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -52,6 +52,9 @@
  * TEST: gem render copy
  * Description: Basic test for the render_copy() function.
  * Feature: mapping
+ * Sub-category: Render copy
+ * Category: Desktop client
+ * Functionality: render_copy
  * Run type: FULL
  *
  * SUBTEST: linear
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
index 06777dd7f..681cb5cca 100644
--- a/tests/intel/gem_render_copy_redux.c
+++ b/tests/intel/gem_render_copy_redux.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gem render copy redux
  * Description: Advanced test for the render_copy() function.
+ * Sub-category: Render copy
+ * Category: Desktop client
+ * Functionality: render_copy
  * Run type: FULL
  *
  * SUBTEST: flink
-- 
2.34.1

