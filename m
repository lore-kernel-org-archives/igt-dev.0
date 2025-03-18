Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ECEC282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 05:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A3B10E061;
	Tue, 18 Mar 2025 05:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcpQjpv5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A991E10E061
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 05:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742276752; x=1773812752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G6CKdoSEuhkGnn2nyCJ3jgOw+0h7UFKFN1Q+j8xrLGs=;
 b=VcpQjpv5sitCsNoi9xWqZe2vHQ55yjoZXsYjaitNwAs8avzIKODhTOFe
 QdQKK4ZBvd76K8jfwPwSpIf79mkFFmch9NpjIMEDDYh16vZ9SLU4urxzJ
 Zw+UFn/wY71stp169pI3XmVx8xqzlfrM243Syr9H0hWFvr0c7PWl/pBdk
 AMetzN2i0IzSweAZPhLhQELH4S8CV5Ko40wEYdZDlXoJNpNZ8xncyasCr
 TQVYqL8Upm4Qio3Qiv23G97AlkHzAAgexfMX3JOwHUVGWEG5fXq0+3C50
 elvETKQ+jd5QUbKGsTHg8J+R+ZkwOuZ+ASsy2I258uoYCEMzhsFzLY5yu w==;
X-CSE-ConnectionGUID: Cyli+u+1Qc6hucBjnCFVUA==
X-CSE-MsgGUID: riAw0ZSJS8mB5gkEfxi4uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="30983409"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="30983409"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 22:45:51 -0700
X-CSE-ConnectionGUID: k88AZ0gQQG2DlH8UoQ5yQA==
X-CSE-MsgGUID: ZVAowGZ1SoOsKpS6U5KX6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="122905253"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 22:45:49 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 0/2] Support for IN_FORMATS_ASYNC plane property
Date: Tue, 18 Mar 2025 11:10:43 +0530
Message-Id: <20250318054045.2611239-1-santhosh.reddy.guddati@intel.com>
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
and improve async flips test to add coverage for the supported modifiers
and formats.

Santhosh Reddy Guddati (2):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: use in_formats_async for async modifiers

 lib/igt_kms.c           | 53 +++++++++++++++++++++++++++++-
 lib/igt_kms.h           |  7 +++-
 tests/kms_async_flips.c | 71 +++++++++++++++++++++++++++++++++++++----
 3 files changed, 122 insertions(+), 9 deletions(-)

-- 
2.34.1

