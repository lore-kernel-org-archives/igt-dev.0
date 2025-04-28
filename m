Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727E5C36005
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 06:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF1910E1D4;
	Mon, 28 Apr 2025 06:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQgq4sNk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F54E10E1D4
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 06:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745821194; x=1777357194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jca05oKhWrtBrGD74mgTqZpe4MlNboj4ObKTtYSqkr4=;
 b=NQgq4sNkc9umbiEBeTI5krSjRk73+oR1K8mp5SsSEOTuUkVwhySZcZdj
 ihRMAlv/sv1yRJvTXkhAXlZzm4zxH2gqwOeBnjvPkMZtTQ1xyN7c/3gGH
 W+TFvB6IOm9E/a/9b3caONyvdiGPMOtVHVDVHj6P4xKRx/5rzIFSfGpuo
 QMTP+8oo3eN0zUY4eFYf51ms2sZ7B2+I/q+/lfwLqYJhLkNn+f79zXAqX
 36wYImqvhDem6qfGnfvR6A85pzVXEJpBbTWZfmILErvlMQXw0Hfi4MeBu
 9UjcNVjsE9M/z+o0qv2UH4DZKX1UvZva62ka81vyI+6kb8+prmDTZmOqE w==;
X-CSE-ConnectionGUID: RRSHNTO2Qy+tLzeynB/62w==
X-CSE-MsgGUID: Yjg8GmhwRtC/ekZ/caDJwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47284175"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47284175"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:19:51 -0700
X-CSE-ConnectionGUID: 12xcYGsnSE+OwRzqPsA7jg==
X-CSE-MsgGUID: ZM/+sWsLSVqbzHcqbPtu/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133911107"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:19:48 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, jari.tahvanainen@intel.com,
 aditya.chauhan@intel.com, jan.sokolowski@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/intel: Add blocklists and test_config
Date: Mon, 28 Apr 2025 11:49:37 +0530
Message-ID: <20250428061940.86004-1-karthik.b.s@intel.com>
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

 tests/intel-ci/meson.build                  |   4 +
 tests/intel-ci/xe.bmg.core.blocklist.txt    |  78 +++++++++
 tests/intel-ci/xe.bmg.display.blocklist.txt | 158 ++++++++++++++++++
 tests/intel-ci/xe.lnl.core.blocklist.txt    |  85 ++++++++++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 171 ++++++++++++++++++++
 tests/intel/kms_test_config.json            |  10 +-
 tests/intel/xe_test_config.json             |  12 +-
 7 files changed, 515 insertions(+), 3 deletions(-)
 create mode 100644 tests/intel-ci/xe.bmg.core.blocklist.txt
 create mode 100644 tests/intel-ci/xe.bmg.display.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.core.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.display.blocklist.txt

-- 
2.43.0

