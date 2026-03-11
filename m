Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8C11062889
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 12:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E7A10E8B2;
	Wed, 11 Mar 2026 12:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3/+9A2T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A33210E1C8
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773231973; x=1804767973;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OA6c4DG1Ts+LxWtFi49SR5Kb5PvwqoXJYA/U8Vu9qmI=;
 b=L3/+9A2TPBYch5NfwHlPS/PLVH82r4AKbWort2POUKZnIl7O7YowUOdT
 0v0G/aPtdE1AX9C8JqUJTbI9MIdKjcbl00OeOkbBy2R1GR8aQBnMOUYFr
 mtIIVDzB/KNagqkWFO+TrR0irVS+rW/AVqtpR9VxuPCP93DVPQXFAEk5s
 NoklkiDIXIiRUGIRZ6wzdTK2e8siWOJ86p1xEIOQHMdrhsDWiT6uFtZV1
 +1SRla5eYJQDRICTutQctCrnXkBxF2IyJdng8b8rki97ot2IAwhAm6RZn
 WmelZS0ArG13bAgziBAXpLAFWOPxW1g9Y2ld540VDVItDXFKwT1KIPu4Q A==;
X-CSE-ConnectionGUID: MyWBfwJLQ364oqtSSUE/+Q==
X-CSE-MsgGUID: Npm2IabbTmO8xTesvKEEZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74335546"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74335546"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 05:26:13 -0700
X-CSE-ConnectionGUID: Xmf7FuzeSKayHtQSZZg4Bg==
X-CSE-MsgGUID: I77s4z9MRSuoV8QfAbcI8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="225148297"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2026 05:26:10 -0700
From: aditya.chauhan@intel.com
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/ci: Add NVL Display blocklist to meson.build
Date: Wed, 11 Mar 2026 17:56:06 +0530
Message-Id: <20260311122606.42223-3-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311122606.42223-1-aditya.chauhan@intel.com>
References: <20260311122606.42223-1-aditya.chauhan@intel.com>
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

From: Aditya Chauhan <aditya.chauhan@intel.com>

Fixes: 04db3b26c52b ("intel-ci: Add NVL display blocklist")

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index a1e9dff55..2e40b2179 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -26,6 +26,7 @@ intelci_files = [
   'xe.ptl.core.blocklist.txt',
   'xe.ptl.display.blocklist.txt',
   'xe.nvl.core.blocklist.txt',
+  'xe.nvl.display.blocklist.txt',
   'xe.sriov-vf.blocklist.txt',
   'xe-sriov-vf.blocklist.txt',
   'xe.sriov-vm.blocklist.txt',
-- 
2.34.1

