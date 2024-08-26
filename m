Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D9BC54731
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 15:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7DB10E231;
	Mon, 26 Aug 2024 15:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRxUWl9n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955A610E0DF
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724686021; x=1756222021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IChvShMt284/E8WYwjH/pMdpVjupeggGgdoNUQM0b18=;
 b=iRxUWl9nUYW2hIAsc6voV5X0EMUBR8FEdKC1aD3pEkyGmd4a93RgwGMg
 +ctPsWcP4rS2yPFg7dVYt+erE9wOdoxgUsRoCs7cofr/smgw1wuHl3NfJ
 gys7VqtR4z6ns1jFgIJfPxbMuulfP4SRMvm67o1tTdTLGNIB0L6pfI46q
 RZl12FTz05H+6j6lhRiOtYOVAP7s9Fv5dfSDN2Z89yOZZlTGQS0G4ReiN
 aRiev74j7vWBiCZmMdsBOsBeQ+W3oHpp6DMgaY7b2hP0I4Y7uWqoS/xKT
 iyX0LwJx9CnQ9Y/KdBbWZ+0pUH1UIB4tDIPXtOtJFZUo+hNEn9DKL2NE4 w==;
X-CSE-ConnectionGUID: VGkVQYmnRxGYV3yEsaxR8Q==
X-CSE-MsgGUID: Ji5xl2XdQqCyUNEeDXlLqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26013834"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26013834"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:26:59 -0700
X-CSE-ConnectionGUID: DJeru8g8Qkm0rIGVwtNvbw==
X-CSE-MsgGUID: AtyEWOAWROmo/GMTovH3ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="63074292"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:26:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 1/6] tools/intel-gfx-fw-info: Re-format with black
Date: Mon, 26 Aug 2024 08:26:51 -0700
Message-ID: <20240826152656.1306490-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826152656.1306490-1-lucas.demarchi@intel.com>
References: <20240826152656.1306490-1-lucas.demarchi@intel.com>
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

black tools/intel-gfx-fw-info

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index b0d41bbae..35555aab5 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -150,10 +150,12 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
     description = "Dump GuC/HuC firmware information"
     parser = argparse.ArgumentParser(prog="intel-gfx-fw-info", description=description)
 
-    parser.add_argument("-x", "--raw", action="store_true",
-                        help="Also print raw header content")
-    parser.add_argument("-c", "--checksum", action="store_true",
-                        help="Also print checksum")
+    parser.add_argument(
+        "-x", "--raw", action="store_true", help="Also print raw header content"
+    )
+    parser.add_argument(
+        "-c", "--checksum", action="store_true", help="Also print checksum"
+    )
 
     parser.add_argument("filename", help="GuC/HuC firmware file")
 
-- 
2.43.0

