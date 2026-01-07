Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3224CF6BED
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 05:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC24710E027;
	Wed,  7 Jan 2026 05:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hu94z6ht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F5D10E027
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 05:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767763450; x=1799299450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HoDcYmFih7k2fu1ZBougeMfSdvPfoKunmxWEmfBm4wE=;
 b=Hu94z6htATlJB4jqLRWdehmnp76mw9Ft1dlOZ5rnrA87xcajeUC3/GT2
 mDIemc70duD10YsbLaXK8z/V3A0/C49tsPJSuJsIWcyHH6QAHKkRtkgIs
 n0h1XMt+jty4yEjhgIGI22Q1Ccn/oj6JcDyv7kFlNae6AienIrwOTaKBJ
 nwiBh9WutP7w4w8TBy8Wpt5+kDEwT5/eIEBHEb1YlcRi1csdZ5SIdx5Lt
 GmngP1cUFrOZ2s/Lxh7qWKFAmIdH9iHM/H4qZNg9iu6Z7oj0Qc9cKdYqj
 KIKMs/950a6Q9MGJn3pB4WP9eLLSu6jVzGlHK4fxQ7Twf+Flt7Zxp/RD9 g==;
X-CSE-ConnectionGUID: c5SvT/J4RGaESqR9z9G1cg==
X-CSE-MsgGUID: SzT23SCXT5eD8z0K+iIcGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68869466"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68869466"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 21:24:09 -0800
X-CSE-ConnectionGUID: J2fh+2GaSzyZVT8li5xPlQ==
X-CSE-MsgGUID: L8gtc5weQa+fGwfnwGN0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202047240"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa010.jf.intel.com with ESMTP; 06 Jan 2026 21:24:09 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 4/4] intel-ci: add xe_pat compression subtests
Date: Wed,  7 Jan 2026 05:24:06 +0000
Message-ID: <20260107052406.21678-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107052406.21678-1-x.wang@intel.com>
References: <20260107052406.21678-1-x.wang@intel.com>
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

Add xe_pat compression-related subtests for early regression coverage.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..3faf84ad6 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -204,8 +204,11 @@ igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
 igt@xe_pat@pat-sanity
 igt@xe_pat@userptr-coh-none
+igt@xe_pat@userptr-comp
 igt@xe_pat@prime-self-import-coh
 igt@xe_pat@prime-external-import-coh
+igt@xe_pat@prime-external-import-comp
+igt@xe_pat@bo-wb-comp-1way-bind
 igt@xe_pat@pat-index-all
 igt@xe_pat@pat-index-xelp
 igt@xe_pat@pat-index-xehpc
-- 
2.43.0

