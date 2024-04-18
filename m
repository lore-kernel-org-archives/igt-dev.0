Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784CDC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 15:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0981B112CC8;
	Thu, 18 Apr 2024 15:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSvz44BL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CB9112CC8
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713453463; x=1744989463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6klLX3Qqv7/at4X+2C0QK3pqWYWDbtpT5y1d68Wzeg=;
 b=KSvz44BLgq+SnQWofuujah0dNppW54aiYg5o1jZiVdHcUrry3SHLCqWf
 qTG5+y21QemIKrxo3nthUBbuwSgo6EJxn/55t3GikZyPC2Gi9D4FkSI5S
 uPgtvsnEqjYyBnZT/CUglyYQ+UvPSNUrwiHWgp3OwHyPF4NUvkjErOCoK
 QrTo2mQEH7eMTNeSWwlFHhvzfGUpKLcMpnTDdTd/GlZYJ+vbv+ngJer37
 gwPiGTnKySotbjns0y2R3GUNUzlvGnJ6aweuVy7ljYgtYuJyI2VfohBTe
 /Zs9RtyH1EA7UQt9QSH98+YgQGxyJDfpNSGRF7DuSpLYoT2/fuWW/I0hl A==;
X-CSE-ConnectionGUID: m2nNPNCfRc+lVllZKGeu5w==
X-CSE-MsgGUID: sKG0zCZTRD2iKgurVtKTRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26465825"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="26465825"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:17:42 -0700
X-CSE-ConnectionGUID: jOX0ZXytSVCKc3uPs+xUjA==
X-CSE-MsgGUID: Wd0p9qUyTpe3yHa3LPU7ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23463423"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 08:17:41 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 7/7] HAX: Do not merge
Date: Thu, 18 Apr 2024 20:58:17 +0530
Message-Id: <20240418152817.2352850-8-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240418152817.2352850-1-kunal1.joshi@intel.com>
References: <20240418152817.2352850-1-kunal1.joshi@intel.com>
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..0fc41236f 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,9 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_big_joiner@basic
+igt@kms_big_joiner@invalid-modeset
+igt@kms_big_joiner@basic-force-joiner
+igt@kms_big_joiner@invalid-modeset-force-joiner
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1

