Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C59EC369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 15:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3537910E6D0;
	Wed, 23 Apr 2025 15:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AteKNZbz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4600D10E6CD
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745420937; x=1776956937;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uZ5vUXcNWCBrQEu2MMs1MkkXUIhteAZVYS6tHN0aVTw=;
 b=AteKNZbzRpvciALY5QC2PdKNPxKl2mHIKSk430A14y7lXfa0Kglghran
 24sj6z6M+qFBhQRwFa54noCi5dUd16gLT9YT/1Dw9eLZLCrg4Hsf/DSMs
 3NO6bQW64hJeR6uO9NDKPnXIQqiQCGPi+++cxpU5i4a2E3IIPuCh9SMaw
 rKfVcFEaZI7BrNbA+TfbyziWI3TrA6a8ZIzWe5D35u44t1RV/lO7r3S6d
 TAyOW1x1ec7EJ6iR5FPhYyseiRQSKYOuCg0jPdcEPf7+We4MsJQ0Bx+CK
 IXa5QKC7TGPfesrkl7D9ApN31OQ2fEk5ItIp/M9mmRrl5y0rFhemZpGUs A==;
X-CSE-ConnectionGUID: /mIfTo4oSDq3GT0HMqSneg==
X-CSE-MsgGUID: iOAwKq3ESsKjaBg+zXe7VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46140845"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46140845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 08:08:57 -0700
X-CSE-ConnectionGUID: 58C1bIVuSOSJhULcL8qU/g==
X-CSE-MsgGUID: KLmn2SSrQuymh8edtCo5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132642212"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 08:08:55 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH v4 0/2] Async flips with tiled modifiers
Date: Wed, 23 Apr 2025 20:31:22 +0530
Message-Id: <20250423150124.2945350-1-santhosh.reddy.guddati@intel.com>
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

Async flips with linear modifiers combination is a corner and not practical to use,
update the existing subtests to use the tiled modifiers.

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: Split subtest to handle linear buffers
    separately
  tests/kms_async_flips: Use tiling modifiers

 tests/kms_async_flips.c | 68 +++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 16 deletions(-)

-- 
2.34.1

