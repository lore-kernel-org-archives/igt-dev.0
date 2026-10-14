Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AC3CC6B1D
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 11:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1969E10E12E;
	Wed, 14 Oct 2026 11:51:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D9910E12E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 11:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791978653; x=1823514653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eJ4zExG1OgKmKooyv4GRweCPe72QXkS3eETKVEec+D8=;
 b=bRaJC7xhMAbou5qrAqnQS/ribmS1v1E7OgvPktLoTVlLI1W88+2K/60+
 BP7QdXYVNJC6p2fOUUSEKdEkuod1L5euT7UNpmz/Va3hiYBqRjgBy3K1S
 HK8aguibvr2rzzE60ogjBtUiw+cmvqOyEC4BtsqxgxVVAnPnDYrkttHDD
 0+tRtOGmx4vWoebbjc2/jakv8KYrGqgX4txwVgFA96F8talny8hNYXrlz
 fRQTllHCkAwhS0hMAgMldnHddYqcNvb953x5pTXLCp5zOVDmSjXg/a4xd
 cPmgJx5Qggp4xqk7M6tJiuHcUQTksdQuWcQR3Scx33LWgGvouvrUwbg8A w==;
X-CSE-ConnectionGUID: 9hMYi96UT3iJ4xZwwDbjFw==
X-CSE-MsgGUID: uPWNF1DbRjuMXnDjmw32tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="820297"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="820297"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:50:53 -0700
X-CSE-ConnectionGUID: 2vTlaC+nRAKdOw8YCzPkpw==
X-CSE-MsgGUID: jdXDHL+oSDGUyfTE4Ap2MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="3259541"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa011.fm.intel.com with ESMTP; 14 Oct 2026 04:50:51 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] tests/intel/xe_wedged: ignore expected CORE_COMPUTE error in
 dmesg
Date: Wed, 14 Oct 2026 17:20:47 +0530
Message-ID: <20261014115047.352174-2-mallesh.koujalagi@intel.com>
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

Wedge tests intentionally force a GT reset failure, which can trigger
a CORE_COMPUTE hardware error (SIGID=203) in dmesg.

Ignore this expected error so igt_runner does not treat it as a test
failure.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_wedged.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 4f5197e2a..fe8ea6969 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -54,7 +54,8 @@ static void ignore_wedged_in_dmesg(void)
 				    "|EngineClass: [0-9]+ [a-z]+"
 				    "|EngineInstance: [0-9]+"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
-				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error");
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
+				    "|SIGID=203");
 }
 
 static void force_wedged(int fd)
-- 
2.48.1

