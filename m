Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DB3C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 08:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC56410E881;
	Thu, 27 Mar 2025 08:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTPO642z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25A810E881
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743064973; x=1774600973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m1Xt3uzzhZfHDEQBedQxFNuqiFpOTJ3ud50y4R5ggOE=;
 b=WTPO642z9YClHdtm/gmmxPDdyE0oGyG0Ma0IURjCiGHOhu7C9pBOmzUC
 9j5/68jOOPPwZX/MxSUwbIT6xwV0+P9xUigIh6IxUnXLiT6i2JTIa4vUC
 LFnICg9vkh6XW5PfHgGEj01waqPP7XfhDqE72g8LtRz7VXjStcQ9Pj/Wx
 fV4i48ZFcNUSJuIdqnU4myzxX5zVL1cIXIUtzD4xQDuYAA7fSg9gx0XU7
 koz2IPbcCTK1WIy4JQqoAkw31X1lILIfbwGi8DJsWHR1cNuCaOYsaaVRd
 PYXulLNqzJeWEW09QnPt135HJhEAYaqf7vPozvOVaS/WOWNwDVvpdG9yy A==;
X-CSE-ConnectionGUID: PO3YwALZSn6/x2byhLKPjA==
X-CSE-MsgGUID: 4qGbrvPyS4agCWt2hU8kSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43539566"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="43539566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 01:42:52 -0700
X-CSE-ConnectionGUID: Uv1nJrr6QCi2KVXdXpfCoQ==
X-CSE-MsgGUID: lmWGNXjNSA+BIcrltDxDlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="129920454"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 01:42:50 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, ramanaidu.naladala@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com
Subject: [PATCH v1 0/2] Bucketize refresh rate tolerance
Date: Thu, 27 Mar 2025 14:10:24 +0530
Message-ID: <20250327084027.622793-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

Reduce false failures while preserving timing accuracy. Introduce
a small tolerance buffer based on refresh rate which accounts for
HW/SW latency without compromising validation on HRR panel.

Mitul Golani (1):
  tests/kms_vrr: Bucketize refresh rate tolerance

Naladala Ramanaidu (1):
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 174 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 278 +----------------------
 tests/kms_vrr.c                          |  48 +++-
 3 files changed, 57 insertions(+), 443 deletions(-)

-- 
2.48.1

