Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAE8CAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 13:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB3110E315;
	Tue, 16 Sep 2025 13:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmzOln5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7D510E315
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758028154; x=1789564154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0o3G6B2kIkj4+Wchkdaq6bxxyg5cjmrQhIGqM09dNzY=;
 b=QmzOln5rOqx7ZhwtCMTUNBRWH+sEcKMMRNUI0S2rQsbrdaj0G4YTDzvV
 f/S4u9CGB+lsC6DzoUKEMfRcOd0jWIDPv9v/JMazy2iwLhPQLihCixhvA
 UiFUXIqWXjx6pygW6OkctAfIV56iQ32Jpe4eZ2icKADNKiSnIgnyRz17I
 dJlBNm1N00/U7BKkqmbmooa6Zb/LrZAk3GkbFcMfyMC40/1/9udDfs+7A
 0uvFYrQwv4a6wnR2aX2Vk2eOsK7vkmZbjWcXPMAZcRcGF4wU4fTQpUdNU
 Guel76hMVQ3MRxS952PMIBELs+f0jWZDwHzm5hG0tD7LinMoMDWthHtZJ Q==;
X-CSE-ConnectionGUID: lSlBlR/pQripq1caA7cZHg==
X-CSE-MsgGUID: s8cv5wAASDSYN1y3wYXuEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="70929019"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="70929019"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 06:09:13 -0700
X-CSE-ConnectionGUID: oFXLpQH5QIa9Y23NcpIBkQ==
X-CSE-MsgGUID: iZbY0hviTIm7faIpp3qerw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="180074629"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.193])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 06:09:12 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/1] Revert IGT_DATA_PATH env setting in runner
Date: Tue, 16 Sep 2025 15:09:03 +0200
Message-ID: <20250916130904.166885-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Setting path to data files like PNG images should be something
for test or library, not a runner. Also this works well without
runner setting it, which can be verified by running kms_3d test,
both in build folder or after an installation of IGT binaries.
This igt_runner enviroment setting seems redundant so lets revert
it.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

Kamil Konieczny (1):
  Revert "runner/settings: Add function to set IGT_DATA_PATH environment
    variable"

 runner/settings.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)

-- 
2.51.0

