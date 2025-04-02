Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4665C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 16:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA7E10E81D;
	Wed,  2 Apr 2025 16:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lv3JibYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D7110E201
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743610357; x=1775146357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sD5DIV++0mg4u1wrP0QGevl7eiJcIvsMK7jRDOQjtUQ=;
 b=Lv3JibYu/joClCgHKsSI7vtidEUUf4WGG+NrQ5FBVsDe7R9P4b0MxiFy
 OSacIQZqmWd+oAE6U0y+XRsthWK1/gRKATasJMVDisG9xoOL/dmaqsYmf
 fg3YGT1cIqRtGP2A+lJ2z+0JUa5XZBU2iA09aAqN53XoEZUvSDjD8xcJw
 cng/pgF2pX/ZNYz4HNSeKgCHfhXyPhO1d7w968YrWC43RHHG4zqyNAKHx
 ABFsTKcTprXaI1S5+SOOBkxfq0dLHQBLhK+8cqv2YaDMmAmwBwQcr+h2d
 gDGT1BTLN3wtLdP72+UTvoNsAI2fsiEiVKQGRyvUYC3002ymHlp2MOmfA Q==;
X-CSE-ConnectionGUID: cmXJHenAS/uBtMUaBpFXrg==
X-CSE-MsgGUID: npFtHVHARZ+OW//k25WPdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="32594195"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="32594195"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 09:12:21 -0700
X-CSE-ConnectionGUID: zzui7rlYQT2CMP0/9PO0yQ==
X-CSE-MsgGUID: 46BK7KbMSdOSFYJiwI+mBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="126503224"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.233])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 09:12:17 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v1 1/2] intel-ci/i915: Block more Xe tests in i915 runs
Date: Wed,  2 Apr 2025 18:12:05 +0200
Message-ID: <20250402161207.66601-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402161207.66601-1-kamil.konieczny@linux.intel.com>
References: <20250402161207.66601-1-kamil.konieczny@linux.intel.com>
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

There was recently added new generic Intel test
intel_sysfs_debugfs@xe-debugfs-read-all-entries which is causing
a valid skip on DG2. Lets block all similar Xe tests from i915
runs.

Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13983
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/blacklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 9917bf46a..1afea1c86 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -2,6 +2,7 @@
 # This file is for non-Xe tests only
 ###############################################
 igt@xe.*
+igt@.*@xe.*
 
 igt@meta_test(@.*)?
 
-- 
2.49.0

