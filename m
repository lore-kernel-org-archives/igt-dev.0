Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DD8C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 05:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF70610E972;
	Fri, 28 Mar 2025 05:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C2wbwpCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E5810E972
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 05:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743138744; x=1774674744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pV3GafUAyVUap2Nuw0dTXBvjZmo6+EJPqlFu94hC+fg=;
 b=C2wbwpCqHlO0Fa3Zu1Woo4o+gXfnr7Xj/0w0o79Mk1Nx6LSBzBmGIeCo
 FrcUcKuQr9pY4BYOrj604I6+cEV8XWA32xbQAA6WlArNlnDaAmpreixT0
 8ruTLrDuG7mvdfBe/6tC0dKEVHmPyupe226fJ4+TKaARII/RvNXFqHZK4
 2jqSLD591pieepycwbul5r5lHT2d250dk+FlS688G0VlVYjyBrccN9laG
 f3xXbqyS4h532DASQVWXa3cHQoQTdldfHq9LarAmqwr9StUYxoLOi4LHU
 POL95eA54iTyxfEt6R4jbayJgTo1u4ABXAC3JppJmL1aOXasY8oEevNkQ w==;
X-CSE-ConnectionGUID: cRsoNuNSSkeGPc15rhWp6A==
X-CSE-MsgGUID: vrVPoQxtSKaQKkgCOdyA4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44374811"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="44374811"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 22:12:22 -0700
X-CSE-ConnectionGUID: yxcYEgWUT8embMvCbd4I8A==
X-CSE-MsgGUID: pVP0uuZDQC+YQM682CMRZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125098761"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 27 Mar 2025 22:12:21 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, ramanaidu.naladala@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com
Subject: [PATCH v2 0/2] Bucketize refresh rate tolerance
Date: Fri, 28 Mar 2025 10:39:56 +0530
Message-ID: <20250328050959.659508-1-mitulkumar.ajitkumar.golani@intel.com>
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
 tests/kms_vrr.c                          |  50 +++-
 3 files changed, 59 insertions(+), 443 deletions(-)

-- 
2.48.1

