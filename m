Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A3E109023D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 15:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E23210E89B;
	Thu, 19 Mar 2026 15:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEUpwhHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAB710E89B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773933349; x=1805469349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9IsjlK7KH2p3kNIZTcfKvuBc59gF2ZKQ5yZ0/xKyd5g=;
 b=KEUpwhHauuLBzRZ9XJl6Lcxzm5FSyDycAbF2daO5jYD8RK+0O3/eZ4Zk
 dFq07aDKlbODbVc1OalsdAtIezGkgTFqYJuza1l2iF44wAnlUlqE6UPfS
 0UZlmunClIVquYz6xZC8aKec21jIRLPPQQfzC7lw0DYmD2HDDGrY3OSud
 HASVqPqZB4I2UFuvITFZWtXS57C0e5Atq1x6VAj2y//8oTSHDQZr6X0x4
 YDZaejEUa/s3nFDbgIzmP86FnqP9vhKfBV3HZZF86bfbbvlKtowZCD3ZK
 wu1sEej1IqspjIESFVjfKhKHuRFRvk70uIma2Zht+B/i9tytmQT7AWODM g==;
X-CSE-ConnectionGUID: 6rybi3JgQCOYf+NAS2n2Gw==
X-CSE-MsgGUID: q2Wtfw1zSQG7li+wwH1eoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86085680"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="86085680"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 08:15:48 -0700
X-CSE-ConnectionGUID: q09OxiAvT0ifTG5hsG4xhA==
X-CSE-MsgGUID: p8YvtQhhRGGY3Y5vat405g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="253461137"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 08:15:47 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <ryszard.knop@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] lib/uwildmat: Move to a dedicated vendored library
 directory
Date: Thu, 19 Mar 2026 16:15:42 +0100
Message-ID: <20260319151542.52645-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

From: Ryszard Knop <ryszard.knop@intel.com>

This directory is in the igt tree for convenience. It's not immediately
clear that this is a vendored library, so move it into vendor/ and make
Meson add that directory for easy includes etc.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/meson.build                      | 6 +++++-
 lib/{ => vendor}/uwildmat/uwildmat.c | 0
 lib/{ => vendor}/uwildmat/uwildmat.h | 0
 3 files changed, 5 insertions(+), 1 deletion(-)
 rename lib/{ => vendor}/uwildmat/uwildmat.c (100%)
 rename lib/{ => vendor}/uwildmat/uwildmat.h (100%)

diff --git a/lib/meson.build b/lib/meson.build
index cd03e8f63..5c4829345 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -103,7 +103,6 @@ lib_sources = [
 	'igt_pm.c',
 	'igt_dummyload.c',
 	'igt_store.c',
-	'uwildmat/uwildmat.c',
 	'igt_kmod.c',
 	'igt_ktap.c',
 	'igt_panfrost.c',
@@ -132,6 +131,9 @@ lib_sources = [
 	'xe/xe_sriov_debugfs.c',
 	'xe/xe_sriov_provisioning.c',
 	'xe/xe_util.c',
+
+	# Vendored libraries:
+	'vendor/uwildmat/uwildmat.c',
 ]
 
 lib_deps = [
@@ -151,6 +153,8 @@ lib_deps = [
 	zlib
 ]
 
+inc = [ inc, include_directories('vendor') ]
+
 if libdrm_nouveau.found()
 	lib_deps += libdrm_nouveau
 	lib_sources += [
diff --git a/lib/uwildmat/uwildmat.c b/lib/vendor/uwildmat/uwildmat.c
similarity index 100%
rename from lib/uwildmat/uwildmat.c
rename to lib/vendor/uwildmat/uwildmat.c
diff --git a/lib/uwildmat/uwildmat.h b/lib/vendor/uwildmat/uwildmat.h
similarity index 100%
rename from lib/uwildmat/uwildmat.h
rename to lib/vendor/uwildmat/uwildmat.h
-- 
2.53.0

