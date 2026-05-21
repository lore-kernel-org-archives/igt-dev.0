Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0EDCD5BA4
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 11:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0B710F2F2;
	Thu, 21 May 2026 11:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvtmlwQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E07010E37C
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 11:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779361235; x=1810897235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/7oTbMORAHwoOAp13/59otrgNCn1tfNqZ7B+hp52Pmo=;
 b=bvtmlwQjlhOy29Hz/BSXXkxWJK81wxqevC5R6OkCSpdxKVEz806AAmNK
 6rTFoNMSpN44yRU92KaPWLjQcQfBtsHEqNl4kkGRRw6L6MSzLUnh04bm4
 4ut8bSSMTp/SZ8amqLqDVukgvZKO69z+/iyEREv/MW5mLT31sGOln2Rl1
 9vIebz77gtIUpzosdDeCQ6Dl0K2sO/Sl+cIw40SmQwo4Ap1wI4avS0y3H
 meOrYGZdkxmZfU5YIBGCWa6L9vWZn/MH2f8mXtL2/k6QfbfPN4buynaQ4
 am4AZfs21fr0IOVaw/Bb7XHMOkGRlZRU9hbJX+JVECq3MFamCzu1TnSw1 Q==;
X-CSE-ConnectionGUID: iAhGbEF1SQmX05YtLVwpzw==
X-CSE-MsgGUID: uqtWNnMRRuCdGvaeZKKygg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80258211"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80258211"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:00:35 -0700
X-CSE-ConnectionGUID: QisTuUcmTFehfZVd03AzgA==
X-CSE-MsgGUID: PCH7xfhmS7SiZ5N1dgsH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="234155525"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:00:32 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 ramadevi.gandi@intel.com, ewelina.musial@intel.com,
 grzegorz.zuchowiecki@intel.com, himanshu.girotra@intel.com,
 pawel.drab@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] intel-ci: Add D3cold testlist to meson.build
Date: Thu, 21 May 2026 16:39:57 +0530
Message-Id: <20260521110957.794644-1-karthik.poosa@intel.com>
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

Add D3cold testlist to meson.build to ensure its inclusion in
IGT package. This was inadvertently omitted in the earlier patch
that introduced the D3cold test list.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 7ee1fa04f502 ("intel-ci: Add a testlist for D3cold tests")
---
 tests/intel-ci/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 2b3266bbd..91a29b734 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -25,6 +25,7 @@ intelci_files = [
   'xe.multigpu.blocklist.txt',
   'xe.nvl.core.blocklist.txt',
   'xe.nvl.display.blocklist.txt',
+  'xe.pm.d3cold.testlist',
   'xe.ptl.core.blocklist.txt',
   'xe.ptl.display.blocklist.txt',
   'xe.sriov-vf.blocklist.txt',
-- 
2.25.1

