Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BEAC3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 12:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF7610E7EE;
	Thu, 25 Jul 2024 12:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkThbIgU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22FD10E7EE
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721911830; x=1753447830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPNX8wzUrubNqwu7khnbdhluM6MuHdBnrPr68bWejNQ=;
 b=mkThbIgUtGu0sQJQrtv9j08UEvoOxO+M+ag2Z9+swfdbbk17Y7+v3GxB
 av9I1bVLCwNrWLlvn1wT7SxIhBcOcugLc9mQwrSKca6ro/fTJNxmbGmuA
 u5/UYx3cA3H+dr64qFUFO9MTesOOQDb4DB2quNgLe9/rhWLs8v4Gnhh6U
 IBImGYCwv4KDUltyIgaiJzirpr4OlmS5IztMN3GsheamYVIXwHctawxq3
 GsHMr1xtcdFg/E42l8cG9OjXnZLKJw5UH2lxAeUofGb2jpfZtmytfr7yd
 e+BdZQ5/IiKCe9uAGuA0S3YdYcPhIoVoKZI8ZQgl7BSYEmdvnngftwxVw w==;
X-CSE-ConnectionGUID: 27JWK/SiTny0sKJO9jKSmA==
X-CSE-MsgGUID: P0eEvFAnSEm4gErvrs7fDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19522060"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="19522060"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:50:29 -0700
X-CSE-ConnectionGUID: 4bPbTnqhQDiXYnhT13oSqA==
X-CSE-MsgGUID: JG1oYbU+RpyRYwxK8sCgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="53686337"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.225])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:50:28 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 4/4] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_wedged
Date: Thu, 25 Jul 2024 14:50:06 +0200
Message-ID: <20240725125006.30041-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
References: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
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

Test solution which should allow igt runner to properly
classify xe_wedged tests as success, so adding two into
xe BAT runs:

igt@xe_wedged@basic-wedged

igt@xe_wedged@wedged-at-any-timeout

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..4c53839be 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,12 +1,16 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@xe_wedged@basic-wedged
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
 
+igt@xe_wedged@wedged-at-any-timeout
+
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
-- 
2.43.0

