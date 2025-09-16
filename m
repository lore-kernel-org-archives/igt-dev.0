Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F449CAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 07:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A1810E6D6;
	Tue, 16 Sep 2025 07:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fc7bAlSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B8610E6DA
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 07:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758009392; x=1789545392;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MAX4IktFcCsic3RwwUl1gsgJVXD6rJG5+28qcsvw0Zg=;
 b=Fc7bAlSK15tumuRploXH+Jgr3UIu9ca5N+NU4AtdcpHta76gHVDKdLNH
 xGKH2dcOCQSqFmFPDi4PpklOPIWDQKNcPu7CGiRrkXk1rmXn/VbiGlMZj
 U5KFg2zFtHul5wvflWYP0WtNXcmIAOVIMOT0SLVQf6uf2kV4V0/wJP249
 gg1tZlTp3znnBdNt0mOh6uUAqsZjsqn1Imm15Ov1Xk3OdSWDpADK8LXLH
 NqXqZUwzwPdbO3nlrk5x62C6S2hjBG7YafTN8nvrmkeFmwQvZWpCP48hU
 1JjvOwt4V74XAg2vgiEz5kFSNPhww5Kj7SqVHsrzfmzPhlt7MDq+pdj47 Q==;
X-CSE-ConnectionGUID: ceYOkX85S9O+YsjkozTybw==
X-CSE-MsgGUID: ag8LdQTfRTSLKEyHVB3JYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="64101815"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="64101815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 00:56:30 -0700
X-CSE-ConnectionGUID: 0uMzy3bGRja/9pWQM0i8zw==
X-CSE-MsgGUID: aZ7rn6USTfCd3poDXfc3aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="212039599"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by orviesa001.jf.intel.com with ESMTP; 16 Sep 2025 00:56:28 -0700
From: pravalika.gurram@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t v7 0/1] Add pat-index-madvise
Date: Tue, 16 Sep 2025 13:37:17 +0530
Message-Id: <20250916080718.1733252-1-pravalika.gurram@intel.com>
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

From: Pravalika Gurram <pravalika.gurram@intel.com>

Add pat-index-madvise test to verify setting different
pat_index values for multiple VMAs. This test uses
madvise to set various pat_index values and
verifies that different PAT values can be assigned
to multiple VMAs as expected.

Pravalika Gurram (1):
  tests/intel/xe_exec_system_allocator: Add pat-index-madvise

 lib/xe/xe_ioctl.c                      |  29 ++--
 lib/xe/xe_ioctl.h                      |   4 +-
 tests/intel/xe_exec_system_allocator.c | 187 +++++++++++++++++++++----
 3 files changed, 180 insertions(+), 40 deletions(-)

-- 
2.34.1

