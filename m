Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9568AC021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 06:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4671810E997;
	Fri, 21 Feb 2025 06:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZVAzlh8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F2810E0E8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 06:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740117620; x=1771653620;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EStZ3c/FyxRkp4u0zoRtUclvAFAtUkaywdgFzOVCCmw=;
 b=ZZVAzlh8rysVF/kBZ3cIJ0koYkK9jlriW9eptsq4KbjT/M535TDOReUI
 CWinb7KhlNzF6ty0lMsZh3RqU26o+hsQa+8sTd9+JNplrqr2+P7NIK1Pm
 YNjOe8/zSb599S6Ep6qv+YXZpq2K+yhV4X6vdUtSQyr37bfPRZX5hjLEE
 Kbwss2crgulIyR7y1kDPeFNGsP4VsQpejjz14McXruedHqfW9O/B8kNJh
 UqHxSWNpNSNH1rEFeM1zQb1Yf6CyCNYEZLwmjkyobLmw44mn6ACbfekbi
 zfiJ2b8azX/w1seHMCy2z8HjYkmriHuOiDwX9sv03Kf71DPMkp0Vn3XqP Q==;
X-CSE-ConnectionGUID: Cjlh1qJVQfGTN4dKqzjWPg==
X-CSE-MsgGUID: G5Ox40VCSAGpg9idQtaRXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28520834"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="28520834"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 22:00:20 -0800
X-CSE-ConnectionGUID: zuhWUUBQRLmWl/60p59ECg==
X-CSE-MsgGUID: nfbWL8IqQlih2phxrmptPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146173891"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 22:00:12 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/2] Support for IN_FORMATS_ASYNC plane property
Date: Fri, 21 Feb 2025 11:26:45 +0530
Message-Id: <20250221055647.2014355-1-santhosh.reddy.guddati@intel.com>
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

Use IN_FORMATS_ASYNC property to get list of async modifiers
and improve async flips test to add coverage for the supported moifiers
and formats

Santhosh Reddy Guddati (2):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: use in_formats_async for async modifiers

 lib/igt_kms.c           | 46 ++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h           |  8 ++++++-
 tests/kms_async_flips.c | 31 +++++++++++++++++++++------
 3 files changed, 77 insertions(+), 8 deletions(-)

-- 
2.25.1

