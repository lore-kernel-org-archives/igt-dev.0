Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027C0C27C4F
	for <igt-dev@archiver.kernel.org>; Sun, 30 Jun 2024 22:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A1810E157;
	Sun, 30 Jun 2024 22:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXrm2DHT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CE410E080
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Jun 2024 22:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719788199; x=1751324199;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xg4jGSLk/uRHJm8MysH+GgmTz22SeSGOCN0V8+l0Qtc=;
 b=IXrm2DHT6eCoLnoMyRJdaz4bGML7xPflCXRuQDEF9tJEGp1IeRVe23Ct
 78PFlCH+jhcslQV2Ju//2EdeHkZ/e48OlYAKnGUUYxhmhmrujpziT9G8G
 uVs+vRnV7sQH9EvRQpEL72MQtG3wuQQOorCYs3gbl6OE3Ly6s2Fn9lK8i
 EXC0WlQSFPRvQCnObIkTkamgqaCkD5Nm+M/AAG90d2Fp6YA3hBe+PVGFf
 wohuHXQDBnyPt9PKc34uuxUsY3VPgy3szWyBVrDkGXKjmH4AOxL6sLjcE
 m99ZbYgPODH7PjZA1qd+rPETbeQBkk/+o1ZoFVjtvu3nlpQ7Yy2d2wSLQ w==;
X-CSE-ConnectionGUID: U/4jxWfmTFS2c0mVCMpoYQ==
X-CSE-MsgGUID: 3YIyE9FxS8O2+NZePf1mHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="20763780"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="20763780"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 15:56:38 -0700
X-CSE-ConnectionGUID: O6MULf3nQDK+EliJcLhAgw==
X-CSE-MsgGUID: 7u0P/n7KR5+fJ7YjLeDskA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="45216129"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 15:56:38 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 00/13] Intel Xe OA IGT's
Date: Sun, 30 Jun 2024 15:56:21 -0700
Message-ID: <20240630225634.2404840-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

The Xe OA lib's and tools have already been merged. This series now
contains the remaining Xe OA IGT's which are yet to be merged.

Ashutosh Dixit (13):
  tests/intel/xe_oa: Add first tests
  tests/intel/xe_oa: Add some negative tests
  tests/intel/xe_oa: Add "oa-formats" subtest
  tests/intel/xe_oa: Add oa exponent tests
  tests/intel/xe_oa: buffer-fill, non-zero-reason, enable-disable
  tests/intel/xe_oa: blocking and polling tests
  tests/intel/xe_oa: OAR/OAC tests
  tests/intel/xe_oa: Exclusive/concurrent access, rc6 and stress open
    close
  tests/intel/xe_oa: add remove OA config tests
  tests/intel/xe_oa: OA buffer mmap tests
  tests/intel/xe_oa: Register whitelisting and MMIO trigger tests
  tests/intel/xe_oa: Drop "xe-ref-count" subtest
  HAX: Add Xe OA tests to xe-fast-feedback.testlist

 tests/intel-ci/xe-fast-feedback.testlist |   41 +
 tests/intel/xe_oa.c                      | 4707 ++++++++++++++++++++++
 tests/meson.build                        |    2 +
 3 files changed, 4750 insertions(+)
 create mode 100644 tests/intel/xe_oa.c

-- 
2.41.0

