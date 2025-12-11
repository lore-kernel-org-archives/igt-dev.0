Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFA4D3E79D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 07:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A592310E6DE;
	Thu, 11 Dec 2025 07:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOBIdn4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39D710E6DE
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765438289; x=1796974289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cP8BxuhLgVuR6dhHm3DF2TKNFqoL937dBQr4TCdN8+4=;
 b=HOBIdn4NWz1Tkl16amyBbTOeYZjdVGtrq5gjudyAG9EMI5cQh64Ozpgz
 DyyIcDDYWwlaT3GlWwRfg3++/4DJjdppjlqpHNhJU1kDPqeU/nWcmz6vU
 s5U65Bdf0xpjV3XdCXRzmtVtYneTRhn2cYXIPq4poOfy3P+RZjFZ2ZZNB
 TKd0bfi7QYjtGwWAzBwU5p1NDyvMSfUTeS+Ru2hP6ihwKSmDi0QmEI2+j
 NsxjCGMMv/0seOWHLoEzBSCcjqG+tkId8m5gSNKItFQ1APb08GMlG3Xsd
 oVB0TZ8Q3nkxPgJlnVciFR7Nekamcb9usKHlzlfiquNxzylfEyGLHNURa g==;
X-CSE-ConnectionGUID: yoqO3kz7Q/KCM98be63SSg==
X-CSE-MsgGUID: 862hHQIjTaSwFHpITFf1cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78528870"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="78528870"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 23:31:29 -0800
X-CSE-ConnectionGUID: VLUnuIT7SZ6g9+lf1aqMYQ==
X-CSE-MsgGUID: xu973zdmT7+5UPqQzDI2gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="201824626"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 23:31:29 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v4 0/2] tests/intel/xe_pat: add helper funtion to read PAT
 table
Date: Thu, 11 Dec 2025 07:31:23 +0000
Message-ID: <20251211073127.178934-1-x.wang@intel.com>
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



Xin Wang (2):
  lib/intel_pat: read Xe PAT config from debugfs
  tests/intel/xe_pat: sync with Xe PAT debugfs parser

 lib/intel_pat.c      | 113 ++++++++++++++++++++++++++++++++++---------
 lib/intel_pat.h      |  20 ++++++++
 lib/xe/xe_query.c    |   4 ++
 lib/xe/xe_query.h    |   4 ++
 tests/intel/xe_pat.c |  38 ++++++++++++++-
 5 files changed, 154 insertions(+), 25 deletions(-)

-- 
2.43.0

