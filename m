Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C84BC3ABBC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 17:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441D910E6D9;
	Tue,  6 May 2025 17:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZP3VEc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBA710E6D9
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746552729; x=1778088729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f+y3lfkYzhvE+nv3WCY1rLBH51xW58RjylQeC1Hl2A0=;
 b=iZP3VEc4qMoYkCLTtY9/i6zzDw16KVw1AoCuF0Ucj0sdDv/e3ss389zK
 ZCQkp1NbLnHDQCNnUHKzIb0XHIcPufMFg+2J9M5cwO/BG9AT7Q3fXQdaV
 cpU6eMDH4rducTpAtoaTrVFrRqX9B5XodMmzbcqpzAURVUbkWfcR1IxbV
 /aXelRMkcM3u9+8Zi/ldoBsCaMukbdME6oj1nt7Ys86d2hNzd+CQPu83w
 ZNumo5rBsfPV5isAi9VYy31kTAPf78TIyXxBxGrAT7ZRl8tptFpq0auxZ
 UkHEjYKlTX2EXLjT5tzWQN4xbhViWLzwwtppVTZIJ2Mdn2ADeeZ5Cads1 Q==;
X-CSE-ConnectionGUID: RbyfVv6LTTmYUQK3rG1i+w==
X-CSE-MsgGUID: oAlBAbeFTYuiKOQ2UalhGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="65771939"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="65771939"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 10:32:09 -0700
X-CSE-ConnectionGUID: RRMMjkc5QD6rqQegITYd3A==
X-CSE-MsgGUID: aPlhzu5YTe6eXaqA0q9+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="136198202"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 10:32:07 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/2] whitelist for HDCP panels
Date: Tue,  6 May 2025 22:53:35 +0530
Message-Id: <20250506172337.2985430-1-santhosh.reddy.guddati@intel.com>
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

Add whitelist functionality for monitor EDID checks.
Introduce a whitelist mechanism to handle specific monitors
that are known to face issues with certain features, such as HDCP.

This change is intended to skip test on those panels which are
blacklisted.

Santhosh Reddy Guddati (2):
  lib/igt_whitelist: Add Hdcp Whitelist support
  tests/kms_content_protection: Whitelist check for panel support

 lib/igt_edid.c                 | 27 +++++++++++++++
 lib/igt_edid.h                 |  1 +
 lib/igt_whitelist.c            | 61 ++++++++++++++++++++++++++++++++++
 lib/igt_whitelist.h            | 15 +++++++++
 lib/meson.build                |  1 +
 tests/kms_content_protection.c | 31 +++++++++++++++++
 6 files changed, 136 insertions(+)
 create mode 100644 lib/igt_whitelist.c
 create mode 100644 lib/igt_whitelist.h

-- 
2.34.1

