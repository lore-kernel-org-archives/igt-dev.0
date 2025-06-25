Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29974C7115C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 12:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB0710E700;
	Wed, 25 Jun 2025 12:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9KHaTnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37D510E700
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 12:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750853908; x=1782389908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ixrVOnY8Vdq69qv+1tg6YVZtqKxmYuIw9UwfywC3dGI=;
 b=S9KHaTnB9WetRTdnPE41IAgk1aFT5Kif78SkTpOj4Q7/+3vHr3ZZ21ai
 mfO2EkB1hH1jV1WuJAW0zLZSYYersR6cBZc2z6bpCQyb7CdbUqf3d3qRg
 87RIsKQUxf4434GHoJ/aU2kNkn4b3jze7gaUiDExwlA64uudrBAuMqXbd
 GKWJviE07btBNUgOea4ii5Zt92tNbegmuybHgliOalkprWRc2Pu0DMbST
 tSgN7sbWeGk6gUhG9map/21CbYP+i5BZmSsUjdbBKZLmW1lIyIbnQzWLl
 3b7GdFCnkGh5UY8JvkUUcMSjxBXn+2/yujB1qdaf2zCgF7A7uCZHe6HSw w==;
X-CSE-ConnectionGUID: zrLgsC+uTeW0B5zw0Eniow==
X-CSE-MsgGUID: y9JmwKBqQG+uCADMpdfY4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53260759"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53260759"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:18:27 -0700
X-CSE-ConnectionGUID: Nf3mBP2PROW62PURygoVsg==
X-CSE-MsgGUID: IFUIgAdFSGi9f4Zfg2IiQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151714830"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:18:26 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH 5/5] HAX: Do not merge
Date: Wed, 25 Jun 2025 18:04:02 +0530
Message-Id: <20250625123402.3929358-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250625123402.3929358-1-kunal1.joshi@intel.com>
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
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

---
 tests/intel-ci/fast-feedback.testlist    | 6 ++++++
 tests/intel-ci/xe-fast-feedback.testlist | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 82395e7ea..c32803014 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,5 +1,11 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
+igt@kms_link_training@uhbr-sst
+igt@kms_link_training@uhbr-mst
+igt@kms_link_training@non-uhbr-sst
+igt@kms_link_training@non-uhbr-mst
+igt@kms_linktrain_fallback@lt-fallback
+igt@kms_linktrain_fallback@dsc-fallback
 
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9d180d87..4d15145b5 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,12 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_link_training@uhbr-sst
+igt@kms_link_training@uhbr-mst
+igt@kms_link_training@non-uhbr-sst
+igt@kms_link_training@non-uhbr-mst
+igt@kms_linktrain_fallback@lt-fallback
+igt@kms_linktrain_fallback@dsc-fallback
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.25.1

