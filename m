Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503CECD3445
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 23:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EE610E35A;
	Fri,  8 May 2026 23:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUkXK/4k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39AE10E031
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 23:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778283563; x=1809819563;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QeTwypUGSK1wasPJFjX7zclskZA4bQtVMhJuPT25Das=;
 b=cUkXK/4kHrgzzqDMxNMaWEcqyG3Wi0G7eTHqSINhO7HsRuyF2zzsJd3e
 41gs0yUUCmwTZFDx5mtC3vxFs7mx7zQGULwAVgLmaz2MJTkWMShTJ1zTN
 KHMJrZcJwLVRDaz2VbDt3zU8Fe1zRoXafSpnM5SSFYYd7jVWIaL1bh0QC
 TuHQsSw5koy6vdpuzp53jlfzXV7BZyAi5QrMM8CaGH9ictj3w6AkbLgs2
 IynY5Q7kVZxSs46OWM7HkyGkLNU01uloRNk/K6BWjYOv7k8OQ5EnBrYa/
 LMA5oN8v53HXqP7TAakwT6y7TCT83KwcowEOObbpx+DH37Of5arA6qbzm g==;
X-CSE-ConnectionGUID: x+Z3f2zvRb2Aw1fsK2PHYA==
X-CSE-MsgGUID: CDBt7othQYqZwRGcz5Kkng==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89852621"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="89852621"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 16:39:22 -0700
X-CSE-ConnectionGUID: oWMLktdSSKezjWf1Hix/fw==
X-CSE-MsgGUID: 6I8C8BmqRmu1a9AGpm/RIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="241253815"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 16:39:23 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v3 0/3] tests/intel/xe_exec_reset: Validate multi-queue
 timestamping
Date: Fri,  8 May 2026 16:39:16 -0700
Message-ID: <20260508233917.87720-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Multi-queue exec queues should use QUEUE_TIMESTAMP instead of CTX_TIMESTAMP
for the run ticks. Add the required support and the tests to validate this.

This patch series is dependent on XeKMD patch series
https://patchwork.freedesktop.org/series/164654/

v2: Change test name and add documentation (Stuart)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Niranjana Vishwanathapura (3):
  lib/xe/xe_spin: Enhance multi-queue switch option
  lib/xe/xe_spin: Add option for QUEUE_TIMESTAMP
  tests/intel/xe_exec_reset: Add multi-queue long spin tests

 lib/xe/xe_legacy.c                |  2 ++
 lib/xe/xe_spin.c                  | 22 ++++++++++++----------
 lib/xe/xe_spin.h                  |  8 +++++++-
 tests/intel/xe_exec_multi_queue.c |  2 +-
 tests/intel/xe_exec_reset.c       | 23 +++++++++++++++++++++++
 5 files changed, 45 insertions(+), 12 deletions(-)

-- 
2.43.0

