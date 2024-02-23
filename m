Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A73C5478C
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 23:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1782510ED09;
	Fri, 23 Feb 2024 23:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeASueSo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A1A10ECEE
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 23:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708730119; x=1740266119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GDuW+wbqxneDtcnjrqrW/y6OBG5MIms1NRLDmdlUX2w=;
 b=aeASueSo3aRiWkPkD/38D6L0T5IkjjvzIFvuNyUd7W9/SP0+yvTEDwvP
 feIEfeEMO5vz2lj0Mu6d2O8vSzQ424XFrEgQH0RUILm/kXY6zSYOmfJwD
 Kj0SM1zY56x5D3E6OSQhXM94NocYJ2V3H1GvgX6zsplhaYOVntBFyQCLK
 m8Z4/L5uVuuz50yiGKgaVRFXAg5xUobWLMGmSMuXo2S2HiGAnP83LavIK
 gHw7X0PicEEeeBrQrWrlaR+uRfQCkoVhjF0E+rI6oO6H8f7KS2POsiBWM
 Xui7vGqXV3cuo56bsK7sumtPoYzUaEQslDkcJdjLYIVBkHVdqQcepdBDO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="25545480"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="25545480"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 15:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6257164"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 15:15:07 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com
Subject: [PATCH i-g-t 2/2] tests/xe_spin_batch: Sync after vm_bind_async
Date: Fri, 23 Feb 2024 15:04:07 -0800
Message-Id: <20240223230407.1712361-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
References: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
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

Ensure that vm bind completes before the call to xe_exec occurs later in
the preempter.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_spin_batch.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index faf569baf8..3bdc1e5e20 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -202,6 +202,9 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
 	data = xe_bo_map(fd, bo, bo_size);
 	store_dword_batch(data, addr, value);
 
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	syncobj_reset(fd, &syncobj, 1);
+
 	exec_queue = xe_exec_queue_create(fd, vm, hwe, to_user_pointer(&ext));
 	exec.exec_queue_id = exec_queue;
 	exec.address = data->addr;
-- 
2.25.1

