Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF086C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 14:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7086F11A49F;
	Thu, 25 Apr 2024 14:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPSALCpb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECAA11A49F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055062; x=1745591062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ewYAwY60rjvezbnUrBm39/rZksA1LRa9X6mBK5tmpfw=;
 b=JPSALCpbsnQrLFYRKhzi/kWdaExk+Hhj/ZV5RFUlLEsXV1t3ziGN2Toq
 sx0jsOYH5OCOfGpX+RNXiTQ9QsE85nQQKeXgQu4lnbhUwXAGlsJevQZgS
 zI9mHqws6m/gWiQ2PAAMQX4S6/XntrL5pUvUClZOnP7YUn6juZ4dI+RUG
 tre7lBar4eZknE5wSNE7NNN+yf+sui9ge/fKNVcqZkJYsEg1p94CaR45W
 bzBSmklrFbHPkWTt90LRyQW6GYcJDg154FpI6nkXczwU5sXli7IqJZ7Qi
 R9PsxWlSBE7JXLw9ILbNO2OfJge82q1rekqrS2P3Pk4FBXfqO8I3m/eCD A==;
X-CSE-ConnectionGUID: hDMGfTWXSHumlYtlRwDkvA==
X-CSE-MsgGUID: 8r5w58NtQ5CZBtVaGoao0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13577899"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="13577899"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:24:22 -0700
X-CSE-ConnectionGUID: XMnRHZdRSNWvjCZ+sAdz4A==
X-CSE-MsgGUID: GRLUJB+9TGybuePyw2Ye9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25114728"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:24:20 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel: Put multiGPU tests in MultiGPU
Date: Thu, 25 Apr 2024 14:24:11 +0000
Message-Id: <20240425142412.3751980-1-katarzyna.piecielska@intel.com>
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

Some of multiGPU tests were having CMD submission subcategory. Let's fix
that and have all multiGPU tests in one subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>

Katarzyna Piecielska (1):
  tests/intel: Put multiGPU tests in MultiGPU subcategory

 tests/intel/xe_create.c     | 1 +
 tests/intel/xe_exec_basic.c | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.34.1

