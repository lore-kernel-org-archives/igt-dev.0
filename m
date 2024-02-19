Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C065C48BC3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 14:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD0D10E271;
	Mon, 19 Feb 2024 14:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdVfdo0n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AD210E271
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708353312; x=1739889312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AMoUpbVwiHdRyY8MzTrGBkDCmaGJmYIDH/jboh7rpgo=;
 b=QdVfdo0nXHJJz398aNW+qoUeATTQjGFecctBYHsLbHGKVL+OIdpAObrk
 Zf8DQhsv3tJEvwDsoA+Wl6aQcJmF/r3M6b6mQLiT3TlE4MBdsR74IK6HP
 AtK3Sz6ZaEOIL0/TZrLwusW+wx88g7Kmq/k/B4EWPVcPVbB6qcsZtdrXP
 asuNJai4BnR9PPeiCne2YQtQZMMWrN4DhjTROnFWhnTWSCqeZbCeTFfwt
 uJ4gtCuVV8FYhjTSgT6Xike/TE8NoErN9Emb0R484/y4RyqUC/JxBfJgq
 0C4KYyrOWyez3lxN5MHwBbDIPg6jic7jeEKmPpaF6OgdEDc+PizBiX7VC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="12983828"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="12983828"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 06:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4545795"
Received: from laileona-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.20])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 06:35:11 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v3 0/2] Add tests to query firmware version
Date: Mon, 19 Feb 2024 14:34:59 +0000
Message-Id: <20240219143501.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This tests the kernel series https://patchwork.freedesktop.org/series/129640/.

v2: Address comments on HuC test
v3: Refactor tests, put branch first

Francois Dugast (2):
  drm-uapi/xe: Add test to query GuC firmware submission version
  drm-uapi/xe: Add test to query HuC firmware version

 include/drm-uapi/xe_drm.h |  32 +++++++++
 tests/intel/xe_query.c    | 143 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 175 insertions(+)

-- 
2.34.1

