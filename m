Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98157C0218A
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 03:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5366110E092;
	Mon,  3 Feb 2025 03:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BT4KiAIs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A2A10E092
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 03:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738554721; x=1770090721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dagw6bDldL5S+q6a20yNORXnk0iSbCwfOA07oWa1fuE=;
 b=BT4KiAIsHc6mwNYoSW3wrRZKike5+7wlwu8Iw7u5lR1j8xDHJAA7eMqn
 oAByYHe6wtlNp6ShmH1fpRzFk6GKA+Wysa6HASwl9KbEEUNAFoTxXpfJP
 e/3C6VIEZXozuqHkIOI5N/MGpDh7ZgL/lPmYoN74jU62rqDKzZ1snk0Iq
 n5ie6AcWnYEl7Kp9ZwfrRa/yMGQtY95AknbLbLWAQ42AxYc5rE4NdF/WL
 V+3lxO20hd6+JbSTLj3OAMEQBI6x2daipmFr4IZTc4tjx8czWD+uD2FAE
 QYmYWZAZYMyLCu1lnBG2GuPSIhGKZeRQP6dPuwLhykS8KWhVCyymMj4CW w==;
X-CSE-ConnectionGUID: xZTXB/FPR8epdim0SSrXgA==
X-CSE-MsgGUID: 6KY5MylMTDSVEC9ge4zO/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38274506"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="38274506"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 19:51:59 -0800
X-CSE-ConnectionGUID: 7WL/AnicS6WB45ZC9Fd4YA==
X-CSE-MsgGUID: odXFhlBWQBC7w+Jv3Oo9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111035969"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 19:51:57 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jari.tahvanainen@intel.com, kunal1.joshi@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_test_config.json: Add GPU excluded
 platform category
Date: Mon,  3 Feb 2025 09:18:26 +0530
Message-Id: <20250203034826.28283-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
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

This category provides a list of GPUs not capable of running the
test/subtests.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_test_config.json | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 7886b6f58..e11c7f4fe 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -52,6 +52,11 @@
                 "description": "Defines the test category. Usually used at subtest level."
             }
         },
+	"GPU excluded platform": {
+	    "_properties_": {
+		"description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
+	    }
+	},
         "Description": {
             "_properties_": {
                 "description": "Provides a description for the test/subtest."
-- 
2.39.1

