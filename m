Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E297EEF325
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 08:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B3010EB93;
	Thu,  5 Mar 2026 08:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcQ+F+ma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA26010EB94
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772700110; x=1804236110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ie48/sPW4Fc2Y+5P6dzTYIadXJ7aS9zBpsSNrpJsnaI=;
 b=fcQ+F+ma6kxi8PeDQfquMc7xM25wBB8nkqfsUnA1jyyfEQRAp9h+48ZO
 AH4r0ZTGj9ZS936KBpO4s2gLimYQmP5GcdP9JYK8RB5JxAtHmDR17oC1v
 wpreNiPRvEKOAn70sTsN9HXk+2ZzwvaLgdzVb/D1/CXRbAGMo2AeUxzY/
 CjPn9H2p6hSIS/7Uc4nG7TTdyw2u1KnX0yF7jiP6QenQp1p+WPHEchn0J
 X3zrkNO/eIGkVBqYHLMPwAAXW7m0J3G6+R63Qz4z0m/I776cK0YE498a7
 fOiGUbwHX71PCgNrVUQhERDd9IpUF50Bi69alwrGBTmwocEvYoNNhdUlG g==;
X-CSE-ConnectionGUID: fW+wLepWRouT7lJgq7Eq4w==
X-CSE-MsgGUID: o0h0xLl3SrKFLkXHdC/jVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77624267"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="77624267"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:49 -0800
X-CSE-ConnectionGUID: +W8+ao7ER+KtoOkGeHAiaw==
X-CSE-MsgGUID: mycNE3LkRGGMGOIx3ew8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="214673600"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:47 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kamil.konieczny@intel.com, ryszard.knop@intel.com,
 karol.krol@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v5 1/6] intel-ci: Remove chamelium testlist symlinks
Date: Thu,  5 Mar 2026 14:09:01 +0530
Message-ID: <20260305083906.3098168-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260305083906.3098168-1-mohammed.bilal@intel.com>
References: <20260305083906.3098168-1-mohammed.bilal@intel.com>
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

Remove symlinks before splitting into driver-specific testlists.

v2:
-Remove symlinks first before renaming (Kamil)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/i915.chamelium-only.testlist | 1 -
 tests/intel-ci/xe.chamelium-only.testlist   | 1 -
 2 files changed, 2 deletions(-)
 delete mode 120000 tests/intel-ci/i915.chamelium-only.testlist
 delete mode 120000 tests/intel-ci/xe.chamelium-only.testlist

diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
deleted file mode 120000
index d7c492973..000000000
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ /dev/null
@@ -1 +0,0 @@
-chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
deleted file mode 120000
index d7c492973..000000000
--- a/tests/intel-ci/xe.chamelium-only.testlist
+++ /dev/null
@@ -1 +0,0 @@
-chamelium-only.testlist
\ No newline at end of file
-- 
2.48.1

