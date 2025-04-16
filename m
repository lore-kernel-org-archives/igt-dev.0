Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCE2C369BD
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 10:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621C710E05B;
	Wed, 16 Apr 2025 10:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYjHU86G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0819610E05B
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 10:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744799261; x=1776335261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=36wPw2KYJjYZFe0Lt/oZycMmPhxXfBYPWnE7kNLmirE=;
 b=nYjHU86GUOwZMF/d5iVJkthlRm6UKGppgL5k6K78B/wYg8iNgI/WHs+o
 Ii/RLInfQwmpmhpGTzUu4XWLa5PN7cKjXSjPbRmIHqIsW7DdqENxLEZJR
 JqGBPBww9xjunjhSGhM0noMsj7U6m00yLSH81G25VXPRdY+kpLkm91K3G
 IFxUnp4KPy61ur7cQLU2V3gqvBsuWcuLdHGkjCj8QppZnIgY4tGznxe/z
 I8LCkL7mezCM8AbFj2CmtlnAuInuf3wh03cvDBUP7FF/LLPDKssYvKUYM
 Z+yYMZHxxDvfk2B5EWjMuiRnK+ZColp+lLjWb5fdQu1DLXCVk/EAZI5YM g==;
X-CSE-ConnectionGUID: 8xHKNwKKSFGmq8n8kvi0Vw==
X-CSE-MsgGUID: oJ5jfKNmTHu/DbCmyMNTgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46229289"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46229289"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:27:41 -0700
X-CSE-ConnectionGUID: GHTwcArESKmhb3k27+hP1g==
X-CSE-MsgGUID: UASmHpyoT5qHkJxap2vcoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="131334134"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:27:38 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, jari.tahvanainen@intel.com,
 aditya.chauhan@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 0/2]  tests/intel: Add blocklists and test_config
Date: Wed, 16 Apr 2025 15:58:04 +0530
Message-ID: <20250416102806.1362020-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

With config definitions one can use blocklist defining test cases
that are not supported by LNL and BMG platform on xe to generate
platform testlists.

Example use: ‘scripts/igt_doc.py --config tests/intel/kms_test_config.json
--config tests/intel/xe_test_config.json --intelci-testlist generated-testlist’

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>

Karthik B S (2):
  tests/intel-ci: Add platform blocklists to enable platform testlist
    creation
  tests/intel/test_config: Add GPU excluded platform definition for
    LNL/BMG

 tests/intel-ci/xe.bmg.core.blocklist.txt    |  78 +++++++++
 tests/intel-ci/xe.bmg.display.blocklist.txt | 158 ++++++++++++++++++
 tests/intel-ci/xe.lnl.core.blocklist.txt    |  85 ++++++++++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 171 ++++++++++++++++++++
 tests/intel/kms_test_config.json            |  10 +-
 tests/intel/xe_test_config.json             |  12 +-
 6 files changed, 511 insertions(+), 3 deletions(-)
 create mode 100644 tests/intel-ci/xe.bmg.core.blocklist.txt
 create mode 100644 tests/intel-ci/xe.bmg.display.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.core.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.display.blocklist.txt

-- 
2.43.0

