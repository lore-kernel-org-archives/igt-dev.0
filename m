Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664D9D5D69F
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 01:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8E610E139;
	Fri,  8 Nov 2024 01:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JG1EBDa3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DEB10E139
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 01:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731028045; x=1762564045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eOeSese85Faq+iGZaKEKk09J2JdtjrAFCsW/FX/vkHk=;
 b=JG1EBDa3C2cHN+B0wln2czkV33hVMbW3ao4yLSRmbuV29e/x7wxIrmVW
 rP+rdWMdOVOPR5WMWGKaV+xPDGawqS7IIllRGfyanlO5wVzjaetrFvLZ6
 VA084MzW5vn9Gvu0uuFxmjxm/CUMxYTpITnHoA+kBav9uvHOr82c61Gux
 f/bB3NU1OyMyuJ+90TMYilKy9H4veNdElab7xx28wltS+2vxVS9vowdqq
 MR1GMcz9KNIR1XmnJtBDCYsI5w2wE0pPe186yvsbAWwpukIBwAJn+Mr9U
 f9bhz1zo3Vh3j8YlJpCE8DuEhmj0V3Be966dCRJXCYdTACANorJs/cfh9 A==;
X-CSE-ConnectionGUID: DzZTXSMESDCWULhPtcTHeQ==
X-CSE-MsgGUID: ip8PkRUeQEasROUgcVBX6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31009601"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31009601"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 17:07:25 -0800
X-CSE-ConnectionGUID: heL0jRPBSBOknbqxR7E4oA==
X-CSE-MsgGUID: 3Y/wg4/5THaDUoQ5d+QyuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="116191489"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 17:07:23 -0800
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t, v2, 0/4] separate sync data and batch buffer
Date: Thu,  7 Nov 2024 17:10:37 -0800
Message-Id: <20241108011041.2257553-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

In INVALIDATE cases the test purposely remap the data buffer to a
different physical location in the midle of execution to exercise the
page fault handling flow. After the remapping we lose access to the old
physical location, and that would cause a problem for comparing ufence
value at the end of the execution. To fix this the exec_sync data needs
to be separated from the batch buffer for instructions, and during the
execution we don't remap the exec_sync data.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (4):
  tests/intel/xe_exec_fault_mode: separate exec_sync and batch buffer
  tests/intel/xe_exec_threads: remove redundant wait
  tests/intel/xe_exec_threads: wait for all submissions to complete
  tests/intel/xe_exec_threads: separate exec_sync and batch buffer

 tests/intel/xe_exec_fault_mode.c | 66 ++++++++++++++++++++++++--------
 tests/intel/xe_exec_threads.c    | 65 +++++++++++++++++++++++--------
 2 files changed, 99 insertions(+), 32 deletions(-)

-- 
2.25.1

