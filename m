Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E75CC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 07:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0E4112131;
	Thu, 15 Oct 2026 07:52:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129D810EB80
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 07:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792050705; x=1823586705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R0WmuWk/6VwGmV3kxBv0V2VKjJrzd8wK88ovfCk86h4=;
 b=D8ABkD4s8yg7tSqIc0wzELpR7W4cYV6AmonPZxM3Je7zBDXMrJ9srEVA
 JHr4tqRNTmODPhAaq685AmOLclxM1TQSHXdy6nbeOpa85Ik0qM1jXbGLY
 Bvjzszmy6m2ZuLk+LqDl3U6051qo1tlkUTCntNESTTHZhkzZUV30/L9oV
 R9/JErtOgdL/Api+d6Ox+e0qYo75h+uI8GjI5ydQEQplYydCCggQKi5VZ
 8TklI0tBVk9FN+V5XUfZAVv+UQLeYUphVSqnkBwdKUU/SUiblMsmRxN5s
 BzochVMyEYCS1VX140NxQAdzNjrTdfBDKJ6UFEXMGiXv9EeRgKZL1d9Ce Q==;
X-CSE-ConnectionGUID: VeSHEZ2UR+2P12JNrbZxWQ==
X-CSE-MsgGUID: ICAJQt91SMqMWGt7uoEN5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="799978"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="799978"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:51:45 -0700
X-CSE-ConnectionGUID: 3kjCLjtcQsGrUqE4pwK5cQ==
X-CSE-MsgGUID: k2J42lLXQBil3fmH2ZzBTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1716879"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 00:51:43 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 0/3] tools/vmtb: Parallel multi-VM migration and tests
 reconfiguration
Date: Thu, 15 Oct 2026 09:10:34 +0200
Message-Id: <20261015071037.10898-1-adam.miszczak@linux.intel.com>
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

This series extends VMTB VF migration validation coverage with parallel
multi-VM migration and reconfigures test variants to auto provisioning.

Patch 1:
Extend BaseTestBusyMigration to migrate multiple VMs concurrently.
Source/destination pairs go from the edges to the center
(VM0->VM(N-1), VM1->VM(N-2), ...).
Save and load use two-phase async operations: all migrations start
first, then each one is polled for completion.
The IGT workload runs on every source VM.
The single-VM (same source and destination VF) flow is kept.
For odd VM counts, the center VM is not migrated.

Patch 2:
Skip double migration tests when the debugfs 'resfix_stoppers' hook
isn't available (KMD no-debug build), instead of failing them.

Patch 3:
Reconfigure the tests setup:
- switch basic and migration test variants to auto resources and
  scheduling provisioning
- drop the 'full' migration variant; busy migration tests
  1xVF and 2xVF config scope by default
- add TestBusyMigrationParallel with 4xVF and 6xVF variants, which
  uses the parallel migration support from patch 1
- remove the manual EQ/PT override in test_2vm_pause_resume, which is
  no longer needed since the driver provides finite defaults
- limit TestVfDriverLoadRemove to 2 VMs to avoid exhausting host
  memory on systems with limited host RAM (<=16GB)

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Adam Miszczak (3):
  tools/vmtb: Support parallel multi-VM busy migration
  tools/vmtb: Skip double migration tests on no-debug config
  tools/vmtb: Reconfigure tests setup

 tools/vmtb/vmm_flows/test_basic.py     |  15 +-
 tools/vmtb/vmm_flows/test_migration.py | 235 ++++++++++++++++---------
 2 files changed, 157 insertions(+), 93 deletions(-)

-- 
2.39.1

