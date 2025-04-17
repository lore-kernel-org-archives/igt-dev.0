Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3074C369C7
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 09:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAD210EA7E;
	Thu, 17 Apr 2025 09:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASba2Nc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC5A10EA7E
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744883478; x=1776419478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8f9NSJ4FZCElZG8gi2NW2tm7caFCLnb5bb7oDMJvOC8=;
 b=ASba2Nc3FSXt9GVSYhqD1v/ETxgwPR70+p1pVJ/Hgo62QMC5910BjZ3v
 8vm2c2hjBqG02Mt+hELlplOxyzWB0HcgqhsHgCVspJS4eEEv11nQJmyGp
 3OzKsh+4Jdh70EcjecPs8vy5WAnexZuwiHc7qfuz1WVztVz83STT39gIe
 m+3TTeJ7G2JqnW8K5ElMgSsl8B+UQArktq97jjhfu9XTv5hAi3yx8hIFi
 WkRMXiJAdk5SdOr1hZm/72NY4z2CSySTqb9h6RK9cABn722wxpfKwpT4D
 pbYH4Yl7C5OlOF93j3znbqlSAFLHkjYL1YqzaWPacEBaO7uGwUs5PrmAh A==;
X-CSE-ConnectionGUID: /kxLcbIWQlOrujWXFYbJhg==
X-CSE-MsgGUID: 8zSislUOT7e8BdX2Cn1CuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45695993"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="45695993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 02:51:17 -0700
X-CSE-ConnectionGUID: gBTW7YyoS06+l4a95ZxWtg==
X-CSE-MsgGUID: RIkLXEG9Qs2Wa8cPxEJPLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="135564763"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2025 02:51:16 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	ramanaidu.naladala@intel.com
Subject: [PATCH v5 0/2] Bucketize refresh rate tolerance
Date: Thu, 17 Apr 2025 15:19:05 +0530
Message-ID: <20250417094908.1795432-1-mitulkumar.ajitkumar.golani@intel.com>
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

 tests/kms_vrr.c | 95 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 7 deletions(-)

-- 
2.48.1

