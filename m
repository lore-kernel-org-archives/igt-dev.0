Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FD8CDB46F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 11:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C6910EA9A;
	Tue, 23 Jun 2026 11:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVYEt2l7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA0B10EA9A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782213316; x=1813749316;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PfDzO2zpejofmuqWdeotn0qmoEFVQUZNMzCCFT4W8R4=;
 b=QVYEt2l7glWg3wPVOw/xOaTjyebJHOdv9pxtwBFdSBzH6e/cqKrZnImB
 za0A46T+iqjEQ5kSBSmGOYhQCAtnGZU2IGGUVs4L3jyxkVbyEFy4EZ7I8
 qFqq/2NpKv1j0S7E7SzzR5MXE2KLOZ48iq4kO41zhk9sxSu7SKX4E7cXa
 tsFBjAjGrUm1MUjB1T8XOmgP1UaLdnd1/QsE15203vE2uGF2Pvjs+bPuc
 c4V3EVWyPdtuL3C2ZtQ/38H/AujrbjFRvd02HHYDf/ug6nZ3hlv25TB/E
 4dOZrfY3HFVjGk/lm/lYnBD/Y5T/5Lj5IJ0pCk9ujRjH3nWaBXm6NYGqA g==;
X-CSE-ConnectionGUID: +2eVSnadT7CgN3MW3Pwh4g==
X-CSE-MsgGUID: E7PGezu4RyWHjFSNroML8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108496947"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="108496947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 04:15:15 -0700
X-CSE-ConnectionGUID: FmsBz+5eSXOUm68sp9kQNg==
X-CSE-MsgGUID: PsAp7HecQGOZTwjfX+W/vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="249610549"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 04:15:14 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com, kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 1/2] tests/intel/xe_exec_multi_queue: Rename MultiQ to
 Multi-Queue in docs
Date: Tue, 23 Jun 2026 16:45:12 +0530
Message-ID: <20260623111510.1651747-5-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623111510.1651747-4-priyanka.dandamudi@intel.com>
References: <20260623111510.1651747-4-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Update the test documentation in xe_exec_multi_queue to use
consistent "Multi-Queue" terminology instead of "MultiQ".

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 82c9aefcdf..9b41f87c75 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -6,8 +6,8 @@
 /**
  * TEST: Basic tests for exec functionality with multi-queue feature
  * Category: Core
- * Mega feature: MultiQ
- * Sub-category: MultiQ tests
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
  * Functionality: multi-queue
  */
 
-- 
2.43.0

