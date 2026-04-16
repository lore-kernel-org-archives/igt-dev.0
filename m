Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803C2F8A145
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3333110E84B;
	Thu, 16 Apr 2026 09:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGG4JLvR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9310210E84B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776330749; x=1807866749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Vsp3Lx/eqg/NywmzEgGcRjTJPo1A51T3S+bAoMQEac=;
 b=jGG4JLvRncbr5QIv38ouqr9mrgIlTtexhqARL0vFt7n7r05Wtw54L90c
 TEQxnLFj0NPiKXb9L/ifgIq0XzwnFQ8XNo2F4w3bqoruf5dvD3Me53hIe
 fAtx5HttSpj6+j3Yn2eGUFjeBhWPxaquz5S6fhs6lPDzMDMn8w/DQD39o
 a3XhkOfd4pNSPKHb9jluMpwIUa0EThTXpZ/03v0T7kl6LUjgiblrbfvLA
 dgYxvRollao5WTTP++5i4FCT1AeqYcTbh1Xnk0WiJmHa3aepgCc4jCWwt
 NCC92l0fq4BAzVNUHQfZYuwGlFcU0V2QGW5ShyxjGhDLRsKHqOLV9L6zR g==;
X-CSE-ConnectionGUID: xuz4zw/kSCeLBkw7JCDcrg==
X-CSE-MsgGUID: /2ab5bTPRUKdDTMYrfif4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99973300"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="99973300"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:10:54 -0700
X-CSE-ConnectionGUID: /Ldbs/sAQeWSSfTfHJur+g==
X-CSE-MsgGUID: +NO9Qc6aTXu9LWXccHaMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230608735"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:10:53 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 0/3] vmtb: SR-IOV VF migration test suite
Date: Thu, 16 Apr 2026 10:35:41 +0200
Message-Id: <20260416083544.2441874-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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

Introduce VF migration (save/restore) validation coverage by adding a dedicated migration test suite.

At a high level:
- implement VF migration test scenarios (vmm_flows/test_migration.py):
  idle and busy migration, double migration, checkpointing and auxiliary subtests
- extend IgtExecutor with new mappings for IGT tests intended as busy migration workloads,
  covering subtests from xe_exec_reset, xe_exec_threads, xe_ccs, and xe_compute_preempt
- add IGT/gem_wsim workload descriptor files, providing few workload profiles per platform (BMG/PTL):
  short/long preemptable and non-preemptable GPU batches, and an idle-with-contexts scenario

Most of provided test cases support parametrization with various VF/VM configurations.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Adam Miszczak (3):
  tools/vmtb: Define IGT tests used as VF migration workloads
  tools/vmtb: Provide VF busy migration IGT/gem_wsim workloads
  tools/vmtb: Add VF migration tests

 tools/vmtb/MANIFEST.in                        |    1 +
 tools/vmtb/bench/executors/igt.py             |   96 +-
 .../resources/wsim/bmg/idle_ctxs.wsim         |   22 +
 .../resources/wsim/bmg/long_nonpreempt.wsim   |   18 +
 .../resources/wsim/bmg/long_preempt.wsim      |   17 +
 .../resources/wsim/bmg/short_nonpreempt.wsim  |   18 +
 .../resources/wsim/bmg/short_preempt.wsim     |   17 +
 .../resources/wsim/ptl/idle_ctxs.wsim         |   21 +
 .../resources/wsim/ptl/long_nonpreempt.wsim   |   17 +
 .../resources/wsim/ptl/long_preempt.wsim      |   16 +
 .../resources/wsim/ptl/short_nonpreempt.wsim  |   17 +
 .../resources/wsim/ptl/short_preempt.wsim     |   16 +
 tools/vmtb/vmm_flows/test_migration.py        | 1199 +++++++++++++++++
 13 files changed, 1469 insertions(+), 6 deletions(-)
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/idle_ctxs.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/long_nonpreempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/long_preempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/short_nonpreempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/bmg/short_preempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/idle_ctxs.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/long_nonpreempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/long_preempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/short_nonpreempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/resources/wsim/ptl/short_preempt.wsim
 create mode 100644 tools/vmtb/vmm_flows/test_migration.py

-- 
2.39.1

