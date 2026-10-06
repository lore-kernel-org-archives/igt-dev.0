Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1204CA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 18:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F98910E3A1;
	Tue,  6 Oct 2026 18:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUKs/qT8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895E810E3A1
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791310669; x=1822846669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n0K921q16BQKB9L+0mKVTYEPUBlihuckraF7fF9pGgM=;
 b=nUKs/qT8HmYWZp45qUDTCnyJv9LYx8M81/FAeWFs70jFlARw+aSJyuay
 RWYYAtH0UKLtnit8Gtlqyyh7yBvcBLyizj98gYQw8a2z0iKraee0rU2er
 wcyPvKiK/ylRgIwDxVxhXhzAUe7QOLdmwtTDAmjOEHh+ZQ96K1igYTaOU
 nYANk9Qa62lyBw8PTht2uQ81D94zFD2xZIskVbO1ai0QqXVwdqbpewooc
 KfM25FlQBIemp8edlmrdxOTnustzx1ySEnqjuIzvAak+LkToCQAqtdTsI
 MbkcFD2lxZLCKR6mjNEakDDUnD5btDe2msBudSZdJFdF43dyZrXQRbxmM g==;
X-CSE-ConnectionGUID: 1eqa0eaORCa0OtlK0FEmzQ==
X-CSE-MsgGUID: yOZ7AAJJQFGuv3Yxr7bw1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="95828408"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="95828408"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 11:17:49 -0700
X-CSE-ConnectionGUID: r0qV1xk2ReWS11flcUkgCw==
X-CSE-MsgGUID: UizhNxy/R0+Mu+gQlLykuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="305176332"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2026 11:17:48 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/2] tests/intel/xe_exec_atomic: Fix bind sync and queue leak
Date: Tue,  6 Oct 2026 18:17:31 +0000
Message-Id: <20261006181733.1291713-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

Two fixes for basic_inst() in xe_exec_atomic:

Patch 1 makes the exec wait for the VM bind. The bind and the exec
shared one syncobj that both only signaled, so the exec could run
before the BO was mapped at the batch address.

Patch 2 destroys the bind exec queue, which was leaked once per dynamic
subtest.

Shuicheng Lin (2):
  tests/intel/xe_exec_atomic: Wait for the bind before the exec
  tests/intel/xe_exec_atomic: Destroy the bind exec queue

 tests/intel/xe_exec_atomic.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

-- 
2.43.0

