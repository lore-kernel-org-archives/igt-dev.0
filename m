Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FBBCC6B3E
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 15:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0656B10E04B;
	Thu,  2 Apr 2026 15:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RVjcvnpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F168010E04B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775143711; x=1806679711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a44JzPuDF3oHk1/wIMykSPt+c67uQ79VgXtaYN8kzQ8=;
 b=RVjcvnpHrkCrJ8rb45SFSPLEOnNfoLdTv++F7UuNQjFjPSjO1N5+uYn1
 WUaWg0T/fPLQqRR0n/bBkyUlbFyaA5leABXbw14Zkr7d/X0ffHYcivXDi
 cLBMkFmJN0oytG+FTgM3hhFu6rcvmEUY552bJ2NJT1OHJ2c6rBozdj45f
 iQxkuposfud8lheqhm4FO1QkIq4v7hFXepM1rnN6AWqSia1CqPUTw/lZI
 WOBchWZUulKR0CgOBgNte4LgCH/hafEibfcpT/rn2mcAeAa5JLZ6PxR2J
 pb1BNRduZIe8o3N8xB7lN+0cFMDaaOa6Wr1zXO5x2lNY5qOdta3HPmUX3 A==;
X-CSE-ConnectionGUID: 7jCXPmwpT0+d44nAATAwPQ==
X-CSE-MsgGUID: waPv75CYQDmeMqYfu85C9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86508001"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="86508001"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:28:31 -0700
X-CSE-ConnectionGUID: Z8StNYj+SWuo9fpLoPd3lw==
X-CSE-MsgGUID: HncFhXW8TCWY4UeHaU1+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222641512"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:28:29 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/amd/amd_fuzzing: Fix compilation error on fedora
Date: Thu,  2 Apr 2026 20:54:39 +0530
Message-ID: <20260402152439.1691178-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix compilation error:

../tests/amdgpu/amd_fuzzing.c: In function ‘amd_kgd_multi_ioctl_field_fuzzing’:
../tests/amdgpu/amd_fuzzing.c:1103:13: error: ‘have_amdgpu_dev’ undeclared (first use in this function); did you mean ‘amdgpu_dev’?
 1103 |         if (have_amdgpu_dev) {
      |             ^~~~~~~~~~~~~~~
      |             amdgpu_dev

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Fixes: d512e54bbace ("tests/amdgpu/amd_fuzzing: Remove unused variable")
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/amdgpu/amd_fuzzing.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index 00717e593..9d7468ea4 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -1100,7 +1100,7 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 	 * Note: USERQ_WAIT has no timeout field; it is not a blocking wait.
 	 * It only registers the dependency.  We therefore only test ret==0.
 	 */
-	if (have_amdgpu_dev) {
+	if (amdgpu_dev) {
 		uint32_t timeline_handle = 0;
 		uint32_t timeline_handles[1];
 		uint64_t timeline_points[1];
@@ -1142,7 +1142,7 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 	 * Note: USERQ_WAIT has no timeout field and is not a blocking call; it
 	 * only registers a dependency.  We therefore only verify ret==0 here.
 	 */
-	if (have_amdgpu_dev) {
+	if (amdgpu_dev) {
 		uint32_t timeline_handles[2] = { 0, 0 };
 		uint64_t signal_points[2] = { 8, 8 };
 		uint64_t wait_points[2]   = { 8, 8 }; /* both already signaled */
-- 
2.43.0

