Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D020C3DA41
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 15:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1722F10E820;
	Wed, 10 Jul 2024 15:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3JA+X27";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D82210E820
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720625099; x=1752161099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=18wIvZJJW2LQdybgsK6AXK6nLJEiKOafjfiHYCfjBGc=;
 b=C3JA+X27L1EFILixtqYXBJzIazTnMkEhGJp8flClLiI6tzsnvl05AK+k
 61ZpPgmTMiA43rOlTvoFR5F2B1/e22X/fq+pmoezqVMXrZAHinoRfkpeU
 cobAe9NwAycu5hoBJ3o85vzACJLDgOE3lT35ADuRuRmqIb9Jh5gkcbKb+
 oN8vw4oLKgZ/L1RrETF7LZhq7XbEvNpblG19jwqJrHm/ZeUuPOa5gUYkS
 /Cdn73/x82/SrqtXJlXQN1auTbkNA9tfXVSDlUVWmc2h04G5h6GGDGr3A
 MbRFSz9iYgtxNTh+hNFG03m2wL5hId3eHsgAJQvQnurUITXCcNY9gYSPE A==;
X-CSE-ConnectionGUID: HvNm1S+iRaGQ+3xHmV8prw==
X-CSE-MsgGUID: SPlC9TJyQliAY0q99kkUcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="35387282"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="35387282"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 08:24:59 -0700
X-CSE-ConnectionGUID: akZFhiM2Q5Wtd7bDwnG2xw==
X-CSE-MsgGUID: Lf5n2ZbESeeXt+kiHXGZfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48007716"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 08:24:56 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel-ci/xe.blocklist: Blocklist SR-IOV
 stress tests
Date: Wed, 10 Jul 2024 17:24:45 +0200
Message-Id: <20240710152446.827476-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240710152446.827476-1-marcin.bernatowicz@linux.intel.com>
References: <20240710152446.827476-1-marcin.bernatowicz@linux.intel.com>
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

Blocklist several SR-IOV tests that are identified as too stressful
or time-consuming.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 828baf324..dd7c05041 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -83,3 +83,9 @@ igt@kms_prime@.*
 ##################################################################
 igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
 ##################################################################
+# SR-IOV tests that are too stressful or time-consuming
+##################################################################
+igt@sriov_basic@enable-vfs-autoprobe-on
+igt@sriov_basic@enable-vfs-bind-unbind-each$
+igt@sriov_basic@bind-unbind-vf
+##################################################################
-- 
2.31.1

