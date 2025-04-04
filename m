Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A59C3601A
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 04:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DF910E009;
	Fri,  4 Apr 2025 04:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G71HTZRQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A095410E009
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 04:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743741569; x=1775277569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sOQgJBCfupxR7ePrqpAbY2GHloEUqehHBb4V8jLHZZU=;
 b=G71HTZRQTkgtVnFNfB/27TRUKklh9syOObFAXF7+b3Jq8X1uISaC0rJI
 bmI4oOvY/E7IrbgxEcAmO9KXX8Fs4sLsbjUkDEZV8r79/KLUlMBWzgPou
 lihtKz7TJ6iwHg3Y7smBTGEXykHPygJl9vbO9yEbZDY+Lnq1gWYRt/em4
 qym5ggJ4vzyq2q6rOTz+NhrGQgXpU9GtiGLuIQkQsTCYg+0NDb4RcWb7L
 cQTLsTzwCo5pS6DXvCesprHNeqIWxRnQ5SSF8IcNfdQuMVA9UHshgTAPh
 cZJZzAXDTyXMvjRbqARsMMlkbcl67+NmwZ9WaOxHGKLwLgr4BQW7pKjB5 A==;
X-CSE-ConnectionGUID: IuHB1rkrQFCGg6qZMG5RnQ==
X-CSE-MsgGUID: rxSJIFIfSU2hsan51iSKiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45294687"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="45294687"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 21:39:27 -0700
X-CSE-ConnectionGUID: 7zgE2BiZTRSDXpRE9YMsJg==
X-CSE-MsgGUID: DUMNMIVzQWujD53N9hxSRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="128062171"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2025 21:39:25 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, ramanaidu.naladala@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com
Subject: [PATCH v3 0/3] Bucketize refresh rate tolerance
Date: Fri,  4 Apr 2025 10:07:05 +0530
Message-ID: <20250404043709.955109-1-mitulkumar.ajitkumar.golani@intel.com>
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

Mitul Golani (2):
  tests/kms_vrr: Bucketize refresh rate tolerance
  tests/kms_vrr: Increase readability of kms_vrr

Naladala Ramanaidu (1):
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 174 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 278 +----------------------
 tests/kms_vrr.c                          |  70 +++++-
 3 files changed, 75 insertions(+), 447 deletions(-)

-- 
2.48.1

