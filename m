Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6788C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 04:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5886910E0E6;
	Mon, 11 Mar 2024 04:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQz2nsJU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A0E10E0E6
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 04:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710132458; x=1741668458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sqtGRsthLSF0Ba18BWUVU5eUYqlqDdPuZGgvRddFWc8=;
 b=aQz2nsJUjZpMHSafrNaZ1e9BTgj3y/FR5BgudmKNVQmpJiB4sGVdBbc5
 TxR4JYnRdqv/8m9pxIUbyhwZG3TgIBM0H4eu/w1DYN7RwFyeYlHgMNeie
 D1dduAz0X+Ph0oMJlUOrlhjZ/0BL29STUpRVveEGJshLIgVovE75CPk+5
 gqkflNbajrUBpZf750jyyZ8FhzDpmPej5RQHwkKJ9vryJh66XnJrUOC1D
 BCmfTLHuQXAN4Xgix3tjEzY3HVgfMTDQ9Nvp29nUiKYPKwXdJDgc2T74Y
 NmJkQn9ldX3s1OIg7lO8HL3bP9dvFYy7W4xN3hbPu5CCYGguuW40TDtmt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15339568"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="15339568"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 21:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="10925838"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 21:47:36 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe: Block pc8-residency tests on XE
Date: Mon, 11 Mar 2024 10:11:15 +0530
Message-ID: <20240311044115.3665980-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

As pc8-residency tests are not valid for XE, block these
tests to not run on CI.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index bc1325bae..f414017eb 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -71,6 +71,7 @@ igt@kms_pwrite_crc
 igt@kms_rotation_crc@exhaust-fences
 igt@kms_pm_lpsp@screens-disabled
 igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
+igt@kms_pm_rpm@.*pc8-residency.*
 ##################################################################
 # KMS: Invalid combo:- PSR + DRRS can't be tested together
 ##################################################################
-- 
2.43.2

