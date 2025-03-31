Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6109CC3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 13:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBAD10E403;
	Mon, 31 Mar 2025 13:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dS3SoQnz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7597E10E407
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743428215; x=1774964215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xM/LS1jI3qSmORV68rkRx1pQpCVhvZLlBGIW47aw3gw=;
 b=dS3SoQnzZXdXU6rmeyMEG3Sxrql4ED218Q09UKFB04xiSxH1LD/f4aq9
 lsTIaABNSXX1crAl0AlorMjQZ5acvTYe24LJBz+V80BJol7WlJu1FX/tl
 SrIY+l+c+PSwjPQF+7RS09LUsDKDxkxU/dZEWDAHPcQMOvO/c8ALibxGw
 HbFpfHce4PnNV7AhJ34wY8LY5uwDCPCPv92KMiv+HbEidaiUkRCG62KIY
 eocwtuWOKFYRePJKvZOYW7E1K3t/jTk8BqpWS1dpjTsyKiZFim5ErB1d/
 GujUJ38CE596zdIURUqHc+ta2YhTk/mCBDxnWrPSAFtuhSNFwUxEHdo0M Q==;
X-CSE-ConnectionGUID: 9P4GO/pzRzO2hoaiSo9FRQ==
X-CSE-MsgGUID: KSmqGuR5Rr6/1yLXm2W3dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43862970"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="43862970"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:36:34 -0700
X-CSE-ConnectionGUID: EEbZ5F2PTDOjA08c1tE1CA==
X-CSE-MsgGUID: /CCADlAWRLqIzmqDCUqiOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="149267432"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:36:34 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t v2 2/2] CONTRIBUTING: Add guide about igt libraries
Date: Mon, 31 Mar 2025 15:34:24 +0200
Message-ID: <20250331133424.35873-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331133424.35873-1-kamil.konieczny@linux.intel.com>
References: <20250331133424.35873-1-kamil.konieczny@linux.intel.com>
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

Add some general guide about adding new library function and
a few guides for their usage outside of tests.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
---
 CONTRIBUTING.md | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 8370451d6..d4efa61f5 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -38,6 +38,34 @@ The Code
 
 [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
 
+IGT libraries
+-------------
+- Tests and benchmarks are the main usage of IGT libraries, so they
+  could use test specific macros/functions, for example igt_assert,
+  igt_require, igt_skip, igt_info or igt_debug.
+
+- New library function could be written when it will have at least two
+  different users, for example if it could be used by two or more tests.
+  In some cases single user can be accepted, when it is very likely it
+  will be used in future.
+
+- In a new library function():
+  if it uses some of the macros igt_assert/igt_require/igt_skip then
+  consider to write also __function() with the same functionality but
+  without them.
+
+- Libraries and igt_runner
+  Runner should not use lib functions. It is crucial for CI runs so using
+  libraries puts a risk of bringing changes meant for tests which in turn
+  could break runner.
+  Note: You will find places where igt_runner uses lib functions - this will
+  be on ToDo list to be fixed.
+
+- Libraries and tools/
+  Tools should try to not use lib functions. Any abnormal condition should
+  be simply reported by printf or fprintf to stdout/stderr and then tool
+  should exit gracefully. Do not use igt_abort nor igt_assert, igt_print,
+  igt_debug nor other testing/printing macros from igt lib/
 
 Sending Patches
 ---------------
-- 
2.49.0

