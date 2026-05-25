Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7255ACD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 14:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CD510E390;
	Mon, 25 May 2026 14:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e74/IeNv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54B010E390
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779717720; x=1811253720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fqFcQHgyovSbJwVxtLPAGhWkt4LnAbZm5+IKL6y4snE=;
 b=e74/IeNvmvioT3gvI5LkKTp0MVi1er8iTtqPYKChdXIgyafE5c9C3+5r
 AmKSicWN83Gt9Ur7coKZoaDEDTGaWz1FEyfl1fpbZZERWETJGb1f/VFTv
 yoJBIqmEGNRwwyVjZKyKvjGlAGcVi6z0wn5Oate8WLkjitR+GosiNL4Vn
 m0fyyWNicGybeyWviEMYFMKg4MksbGkQToRUL7lwGykfl7GoAeBvh2frF
 Wjnfzdk7zvGy9G6kokoOpbEMOIHSpU7OdfIQUFAgsx2q/h7f24lVGr5P7
 EXIP+EDw0YVKoaT1vmXCgKWDVCGrrLbIadyfU7RepsphWtBmixrRIm84Z A==;
X-CSE-ConnectionGUID: lLpTnl9oSsOQvWzzL6ySXg==
X-CSE-MsgGUID: nY1Fb1/oSbGVA4+oLoVNzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="97965933"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="97965933"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:02:00 -0700
X-CSE-ConnectionGUID: g3EISiXSSgK1KRl3Wr/8Sw==
X-CSE-MsgGUID: Nhvq12c4SbO4yG5OiSKEUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="240573404"
Received: from tmistat.igk.intel.com ([10.91.34.58])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:01:58 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] intel-ci: Remove SR-IOV tests from NVL blocklist
Date: Mon, 25 May 2026 14:53:39 +0000
Message-ID: <20260525145339.74568-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.43.0
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

With NVL being marked as SR-IOV capable there's no need to block SR-IOV
tests on this platform.
Remove SR-IOV tests from NVL blocklist to enable testing SR-IOV within
core runs.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel-ci/xe.nvl.core.blocklist.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index ea47d3b85..bd19dafe5 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -1,9 +1,4 @@
 ##################################################################
-# SR-IOV/IOV tests are not applicable for native
-# configuration and will be run under its separate configuration
-##################################################################
-igt@.*iov.*
-##################################################################
 # All Display related tests are being run under
 # separate display configurations
 ##################################################################
-- 
2.43.0

