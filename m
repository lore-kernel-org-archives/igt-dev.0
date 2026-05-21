Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744AACD5BAF
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 17:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179E210E4AC;
	Thu, 21 May 2026 17:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lusdg5EQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A2710E4AC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779385720; x=1810921720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sOuGEWmBh0EdYUqKiZU90l59KVAw7qlq1P56i6x1lxQ=;
 b=Lusdg5EQLZaz5H0ITti9SVVa+TjB1FC7a4RYupoLUPwGZWwpLMiay2Si
 Jq9kT8RfnvrVubfbTXo8s7hS3X3gxKrZh9YtwXeCYHNlzhstD0T4fjAwp
 Wb4Ck6sfgUXGc9+acg3eNkm6BSEbNfaXIs9DAIKSnsJ0IG0kmwugpnZa9
 7troeuXEbIQaLone1RDpxyUBHOopdZcv2aUMsJyDgVtaGD6a+iRSuyff0
 5CNnk16EyYshpptsVHE7PHMYBDdhpyxeArowcHYk5DjChP/NIAabNNHAo
 KQ0ZA8lsExmKYXsA4mVU9jWcDXarvP0/hRxc9NlwCMrqaEdXP3sVuD9/B g==;
X-CSE-ConnectionGUID: sUS8eM1SRQSU9I2dpW0CYw==
X-CSE-MsgGUID: yaJMhbCfTBmcCproVbYvPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="97883808"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="97883808"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:48:40 -0700
X-CSE-ConnectionGUID: OJ9UjhDZSxicmVHWtrLltg==
X-CSE-MsgGUID: 99XCID1/Qby5saM2sCCQHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="244612386"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:48:38 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 3/5] tests/prime_udl: Fix error handling
Date: Thu, 21 May 2026 19:48:18 +0200
Message-ID: <20260521174820.167237-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521174820.167237-1-kamil.konieczny@linux.intel.com>
References: <20260521174820.167237-1-kamil.konieczny@linux.intel.com>
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
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/prime_udl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index b1524e6de..5d2c952d5 100644
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
2.54.0

