Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA4DD6B6DE
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 23:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252F110E814;
	Wed, 30 Oct 2024 23:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fa8VM7va";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C5910E821
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730329228; x=1761865228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c1qSI7279QcItpLkyOyzJJAA5hS6Uqt0s3VvvZZXW00=;
 b=fa8VM7vaihWsIsxhDdT5tgeCGjwXPf4yJXcsif0NOBEZNU+/cNJCsL//
 V0zlk3AYML2TMcrrS7o+0hbozd2MZnZ+fO1udw6G5tYAfuvJLt529PdYV
 9HPh/IE15L7ReMFpQnHxjRfEE1Bp41LA0TrfcLh7I0taz/CNSeFzZkWjw
 8+R0VWcehR+8y9cQcnx62uRuOVn/AkVtEYUXNepjAPGoB2wOowl60hMYQ
 B5vGfyfdgI3Yrie4PFV6ZCNxaaUq0SchGTFJJQafTkkJkpBwHoRo0nTYM
 ayXGvZi4VczNE+p7mgpUbAXw5HK6Bku6IomzgQQrDNVWINY6GKUJcP1wq Q==;
X-CSE-ConnectionGUID: 7sx/eopKTa+IGKrQG8S5SQ==
X-CSE-MsgGUID: pHXt/L/hQ/WgQZRbENkm7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33748299"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33748299"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:00:28 -0700
X-CSE-ConnectionGUID: jhEBbOYSQJugE+jeRk9+SQ==
X-CSE-MsgGUID: LPLfNUgUQWC5L02iRYi8tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="87015276"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:00:21 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 0/4] separate sync data and batch buffer
Date: Wed, 30 Oct 2024 16:03:46 -0700
Message-Id: <20241030230350.1681757-1-fei.yang@intel.com>
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
physical location, and that would cause a problem for verifying stored
data and comparing ufence value at the end of the execution. To fix this
the data used for synchronization purpose needs to be separated from the
batch buffer for instructions, and during the execution we remap the
batch buffer only.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (4):
  tests/intel/xe_exec_fault_mode: separate sync data and batch buffer
  tests/intel/xe_exec_threads: remove redundant wait
  tests/intel/xe_exec_threads: wait for all submissions to complete
  tests/intel/xe_exec_threads: separate sync data and batch buffer

 tests/intel/xe_exec_fault_mode.c | 70 ++++++++++++++++++---------
 tests/intel/xe_exec_threads.c    | 83 +++++++++++++++++++++-----------
 2 files changed, 103 insertions(+), 50 deletions(-)

-- 
2.25.1

