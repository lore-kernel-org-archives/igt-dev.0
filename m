Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4319EC54798
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 23:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC2510ECFD;
	Fri, 23 Feb 2024 23:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTVjXZcL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A65610ECDC
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 23:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708730119; x=1740266119;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wVtkUK5HAkhCl3+178x8QHjWomkRzsxVjmbQ5m3761c=;
 b=GTVjXZcLMef7GB3MyMtnzZkW4u+GBebuRujzbqig7aZBF3d9IufXLhGD
 mNJwraOJbIyZNEEAQ+SSjjQu4f++iZ2DRHwKDcnMPOI1J1UZcytl85YUq
 aX9XaTXxz6qy/Lmrltp2zoPcENFfCLbBlpzILDmLRlxdkdYSeLPphbmFf
 TnUAMfTCTW4LlPg5zbVuG0NVg7KTXthMzAEZtmNENTbgeRj962laZCRof
 vcQDX11X3tQKV5M15Zcm2ZTAbxKg3Ool8fQaDqFSbp+YEx7FWyayVP4jS
 nWFhOeKLHfDcxosRwi1Y8Reuf2nKcW5qVbsb7L6s1T74dxSHQAdH43xrh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="25545477"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="25545477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 15:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6257139"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 15:15:06 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com
Subject: [PATCH i-g-t 0/2] tests/xe_spin_batch: Miscellaneous preempter fixes
Date: Fri, 23 Feb 2024 15:04:05 -0800
Message-Id: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
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

Fix the usage of xe_vm_bind_async in the preempter in the following ways:
- Do not attempt to use the gt_id as an exec_queue ID.
- Ensure VM is bound before calling exec.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>

Jonathan Cavitt (2):
  tests/xe_spin_batch: Correct xe_vm_bind_async usage
  tests/xe_spin_batch: Sync after vm_bind_async

 tests/intel/xe_spin_batch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1

