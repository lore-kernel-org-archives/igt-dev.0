Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F74ED5B874
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 22:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D399710E54F;
	Mon, 15 Dec 2025 22:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QR23fnYs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F170910E54F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 22:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765838213; x=1797374213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hqZBfAyBiqT25O8ydQbDN1EwzhMuAYEKPELzss0zacE=;
 b=QR23fnYs5FTRnT3fLzkDn9IAAv3p3xCm+SbBfMAigMiCWsfXT0GOeSdY
 sACtDnA+JZ0BOD7TpDRJIYxe+bmYxSyqK3+L5q+g7aAN5jSox4nFsiCJR
 2gGzsZ/KIAZukMJJX9q3fQsCtO+G50X5oRStbtyW932xYHg2rTdzXSWpV
 jRrJO1DO3iMaAdF5BTEAeT/eNqxPOY31e1a0vRFDptkBz3Yctz8swUecT
 BwzebvcAOufU+kahM87MdsPgoMGh0kSAvwoXDC+uI5h0oQLhCLa/xd7d9
 fRR8DrLl7opPqKRabVFfHKSXaBK0D426AS0QnaBrfuflGzPA8rd0aMIbK A==;
X-CSE-ConnectionGUID: XXgZoaMJQYKJdP1PBFxpSQ==
X-CSE-MsgGUID: PUOuuIKJTcmArwDdaOSWDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78389424"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="78389424"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:36:52 -0800
X-CSE-ConnectionGUID: OSAYg2hkTWiKwKdsAlQM7Q==
X-CSE-MsgGUID: hU7aac4qSPGlpOh35NZvnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197740291"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:36:52 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 3/4] tests/prime_udl: Fix error handling
Date: Mon, 15 Dec 2025 23:36:38 +0100
Message-ID: <20251215223639.117028-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
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

Open function returns -1 on error so error check was never hit.
Fix it and handle it properly.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/prime_udl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index 117663a30..8dcbfa58c 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -47,11 +47,11 @@ static int find_and_open_devices(void)
 		sprintf(path, "/dev/dri/card%d", i);
 		if (venid == 0x8086 && intel_fd == -1) {
 			intel_fd = open(path, O_RDWR);
-			if (!intel_fd)
+			if (intel_fd == -1)
 				return -1;
 		} else if (venid == 0x17e9 && udl_fd == -1) {
 			udl_fd = open(path, O_RDWR);
-			if (!udl_fd)
+			if (udl_fd == -1)
 				return -1;
 		}
 	}
-- 
2.52.0

