Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FD5C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 11:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E758511340E;
	Wed, 17 Apr 2024 11:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvvJz+lW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615D910E1A2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 11:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713353556; x=1744889556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NTA49wQuf48pmHhgsG18SSQ4kmpnqSkgm49zXF325I4=;
 b=dvvJz+lWYGRe94ovqyO+n8rMevofKvncp8Lzh3lnV/s9LEdsT1BlGuTo
 Uu9gcnM4gGJMfuXODZlsb0RrZ3KQo+UdSfCijcmNjQFC+pCIsMHrsbJSe
 WxrK0P6L+pF+OtQtAKFxVqt2KaP72NfNS5uToaK5TePmJm/y2t2Kif5U7
 o80yZrl+/MEUb/nFj3u7h4d3KViqr0rlfFPNLq3RH6v0NkVRpPHhBhus0
 gQCeiVUK8zGHMhFxl7LK7OOySge48GIcEu2q9IpYRIUsSzEYp/f7AUWJn
 2Zvf3pnYjTLKS8+ofyfIL6UMSa7RV0ViUEszwRF6hY8ZxcbUTRUN+tSKD w==;
X-CSE-ConnectionGUID: wS2jPQhdSxOCJ5EoobB79w==
X-CSE-MsgGUID: HC5gYOWzSSuHxsG/MvTtoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8719248"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8719248"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:32:35 -0700
X-CSE-ConnectionGUID: OK8iW1F6Tzy3q4J6Py8OnA==
X-CSE-MsgGUID: ieu/fMN3Qk2jNSd8yHAKhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22658077"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 04:32:34 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/6] cleanup and fixes for kms_big_joiner
Date: Wed, 17 Apr 2024 17:13:20 +0530
Message-Id: <20240417114326.2245087-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

fix and cleanup kms_big_joiner test

Kunal Joshi (6):
  tests/intel/kms_big_joiner: fix crash in multi joiner test
  tests/intel/kms_big_joiner: add missing commit after reset
  lib/igt_kms: add support for forcing bigjoiner on particular connector
  tests/intel/kms_big_joiner: use kmstest_force_connector_bigjoiner
  lib/igt_kms: remove unused igt_force_and_check_bigjoiner_status
  HAX: Do not merge

 lib/igt_kms.c                         | 115 +++++++++++++++++++-------
 lib/igt_kms.h                         |   3 +-
 tests/intel-ci/fast-feedback.testlist |   5 +-
 tests/intel/kms_big_joiner.c          |  28 ++++---
 4 files changed, 109 insertions(+), 42 deletions(-)

-- 
2.25.1

