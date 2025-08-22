Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8697CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 13:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6444210E138;
	Fri, 22 Aug 2025 13:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPLFW0AQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233C410E138
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755870175; x=1787406175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8505f6E1MCxWiRIBXfDif6mtiiWIxCOvBi3NkuqMXww=;
 b=XPLFW0AQ+H6xuOStaoTAaSrtptojaxMW+hqCHLvGYiRaAyPpGHhUp9hy
 3YhgYdXhl2biW1eyGZyN43tMFRPyAGGV/396eMldCiOjlEIyIjDqy9YX7
 8Cgx1TMKliOpyODp3bUplZ2ypP0EtgCX+wIkrq41NVF6yklcihqfbul9Z
 hRAtYvP23x4zRB6IwC9THirrNfOzPPIiPAwBcuoIa3ZrxXiZvfZ7RKeLi
 /7oNBsz0Tt0WJ/Bz9+zlavMla5XDVrL8k2bYVv6BfR/fsP6A9txAoqWFa
 AvrrLWHiv4I+TIzJz2hGBYDj1T4SVvow1HnKtfqACnqToNu/CeYowLhnV A==;
X-CSE-ConnectionGUID: WgHdJPUETw6LvoTfM1/7Yg==
X-CSE-MsgGUID: BoBC5kECR1y8rHFrOT3gFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58323785"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58323785"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:42:52 -0700
X-CSE-ConnectionGUID: 0Af2JebkRoumRcOn+9d7kw==
X-CSE-MsgGUID: zRednbeOStaMpZZHZqiM2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="167941287"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:42:51 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe.bmg.core.blocklist.txt: Remove SR-IOV
 tests
Date: Fri, 22 Aug 2025 14:24:25 +0000
Message-Id: <20250822142425.491548-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
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

We now have support for BMG in drm-tip kernel, remove SR-IOV tests from
BMG blocklist as it doesn't make sense to keep them here anymore.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
---
 tests/intel-ci/xe.bmg.core.blocklist.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index a43e43a62..6207d6af6 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -1,8 +1,4 @@
 ##################################################################
-# Tests NA for Native
-##################################################################
-igt@.*iov.*
-##################################################################
 # KMS - Display related tests
 # Other Display specific tests
 ##################################################################
-- 
2.25.1

