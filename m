Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CF8CD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 16:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2AD10E0BA;
	Fri, 19 Jun 2026 16:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNAKVGkc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179E210E0BA
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781887377; x=1813423377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=015evuXYgEIH3ziaVOKX4zmHWvBtsXGLyHecm16QNyM=;
 b=HNAKVGkc0JJCAgO8Zv0U7ih/mJw9gXw1zfLELFwMcB6alYQq8bwD37qP
 Rs/Wr2ezC2gYAx34mb+HxKTGbC+GFpCQpVp0tEUbBlkHkZz62YcL8wuYF
 i4j2sk8EWc0CeXE4l1mZT7XfPp/493fAwRwi/ek+7iaOHPcfNSltjtKMn
 kIjxKliBCcoLud4p3e6sYO455UWjDHIAsb2/i0CUf5SIXRbkL6FnjvvlU
 Qwoggj6bwr34cm8ZlCALDiixogI16C9Bv55Y3LJ4+gxbNQQ1CruTwA6M3
 u76PmSBJgL0KlRk2QEEFzz7DpyO3nQoxCEzRBsDe59VWzH+ZzvjOQ/fp5 A==;
X-CSE-ConnectionGUID: xJ96gklkSG+bqDrn4Ynf7g==
X-CSE-MsgGUID: 9cqXEcszT2aAmEjgEMqmxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="94127854"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="94127854"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 09:42:57 -0700
X-CSE-ConnectionGUID: X9OY7wyQRgqgJk2A1RWpfQ==
X-CSE-MsgGUID: HUYDz8H+QnexKaEcKxCidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="248728000"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 09:42:56 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: piotr.piorkowski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v5 0/2] Add debugfs entry
Date: Fri, 19 Jun 2026 16:42:27 +0000
Message-ID: <20260619164229.639186-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Extend the root-dir subtest to validate additional Xe debugfs
entries. Optional entries are those that may not be present on all
platforms or configurations — their absence is not treated as a failure.
Validate:

Patch 1 adds validation for optional debugfs entries

Patch 2 adds non-empty validation for existing entries that
are expected to always provide content.

Sobin Thomas (2):
  tests/intel/xe_debugfs: Add debugfs optional entry validation
  tests/intel/xe_debugfs: Add checks for existing root dir entries

 tests/intel/xe_debugfs.c | 198 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 191 insertions(+), 7 deletions(-)

-- 
2.52.0

