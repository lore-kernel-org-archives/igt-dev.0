Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD5BC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 09:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABCD10E1B1;
	Thu, 17 Apr 2025 09:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKNHUb/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341BB10E1B1
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744881443; x=1776417443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3jOlLtQDRdl/XCmqyAFaK6+HrNWwOIq3xIQ2Mrg0BIA=;
 b=WKNHUb/RqKRgNn2bGgiRJnQYyHReRIxx1QegHTvgqJec8fwzADKPneV1
 M9PXKp+o8r3qax15oibneCkhmoDVDBk5QX2IRrdL36wMrBW4Z/NJ21vxX
 dhm4SI1n4EIwPIrW7aXzMZk4yV2qbPCusTdFP5P34DthHvxyBc6Vi1Ze7
 5a1TfAhlcTXwcRS88HpVnvW+Z2izhlUXOFdUHVDz0jZfAIDAaZbIjqces
 M0UxXQ9qbMeKDbQn/xyFub+uVwr+x716v7HYXAcoq/dJJGUGUskkwBP/6
 KOTtyRjYuIiFeUHAwgnoh/T73fGiYVc5R5dH8iw/rmGiXGDqOHY/Hg+3A w==;
X-CSE-ConnectionGUID: yyyXINp2Skilgq4iGJeoeA==
X-CSE-MsgGUID: V9pqR+L3SR6w9XF2Gw4WEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63996140"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="63996140"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 02:17:23 -0700
X-CSE-ConnectionGUID: XAzeTzHxTaGg5+gMUaQCSw==
X-CSE-MsgGUID: wg9fCQ60QiqpvMdHZmvi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="161792638"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa001.fm.intel.com with ESMTP; 17 Apr 2025 02:17:22 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	ramanaidu.naladala@intel.com
Subject: [PATCH v4 0/2] Bucketize refresh rate tolerance
Date: Thu, 17 Apr 2025 14:45:11 +0530
Message-ID: <20250417091514.1794527-1-mitulkumar.ajitkumar.golani@intel.com>
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

 tests/kms_vrr.c | 93 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 7 deletions(-)

-- 
2.48.1

