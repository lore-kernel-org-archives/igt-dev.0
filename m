Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6861C52D6F
	for <igt-dev@archiver.kernel.org>; Sat, 24 Aug 2024 06:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9005810E1A6;
	Sat, 24 Aug 2024 06:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7hgTJTy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AB010E19E
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Aug 2024 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724480718; x=1756016718;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mfrm3PYgJ+oT5dkfDADhNRFPU02j2h8R23y8R9fePCU=;
 b=L7hgTJTysbB4MNUWrxxamrbEo11TYfL2SJXpfV0eP8rf+qV3i+C8FZrd
 f1izFkVcEaVMHgj2xwPv05tMGhTJSvn+jFwOwbgtEKwUbkcS7POQl6Bow
 LZkb1mVRDONA3nW9diGhFR3Uo98fkFgBx5zMpDAsuiLIyDTfV5Ljku/pT
 pKgETm7ZHL6QLWh5TxKUZTnCDUmo8D5sHHLxv5wk/pEV42PWZmJJGyW7o
 EFKNsfA7HEnQQoNZ+YAG7PZODFGICBgiYPC2hux/RA4Ap6BLb//szb7fr
 AEiUOCxK8TvZSMUbHDsJ6CnPqAbYC4kgX+YvlDxHUlTpwGc5sN0S42qjs Q==;
X-CSE-ConnectionGUID: KeRvVYYATLqNp52VaL9uOw==
X-CSE-MsgGUID: E5g14LFCRA+qIHpM9Cbd+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23099884"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; d="scan'208";a="23099884"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 23:25:18 -0700
X-CSE-ConnectionGUID: 5JlCl0IER8qCD3TptqMdYw==
X-CSE-MsgGUID: xdiJe/ddQnGOx8yGQ60M5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; d="scan'208";a="62003936"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 23:25:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/5] Simplifications and refactors to xe_drm_fdinfo
Date: Fri, 23 Aug 2024 23:24:59 -0700
Message-ID: <20240824062504.1122536-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

While reviewing previous patches to xe_drm_fdinfo, besides the review
comments I felt like we could further improve the tests.  Handle them
here.

Tested on DG2 and apparently everything still passes.

Lucas De Marchi (5):
  tests/intel/xe_drm_fdinfo: Use usec for batch duration
  tests/intel/xe_drm_fdinfo: Half the execution time
  tests/intel/xe_drm_fdinfo: Remove unused flags
  tests/intel/xe_drm_fdinfo: Use enum with expected load
  tests/intel/xe_drm_fdinfo: Rename and reorder tests

 tests/intel/xe_drm_fdinfo.c | 247 +++++++++++++++++++-----------------
 1 file changed, 132 insertions(+), 115 deletions(-)

-- 
2.43.0

