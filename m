Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C652CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 17:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5C610E4AC;
	Thu, 21 May 2026 17:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUITPBvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14DF10E4AC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 17:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779385724; x=1810921724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9/F9KeHYnX0KCpMC5M+hcFbL9UpgTImL5p0UUj3khs8=;
 b=dUITPBvoTB9RqLPK/PDO/3HtxvAqZrQ6wbMREv1zVd3I5JlqHBtZKhqL
 CNa0mEJ5oTxtNVqhvUf/N+MgUtq/rnzuutOPAN+122YudbEz8B2gHmapI
 qGKt6UDVikOO+UD45gFxWTY/hvM00LBB2GWBdx6xWQ7LkmOo7uq9yxHG7
 Saf+ipwaJ/bCAA6KHUwabraRan1YT0vkPTsjDqjMxXOFZKuLYRmE3WVFD
 nNW3hLpDKnFr9V9ix2RAH0yEzIdXMmtY7tlxV98blJKfuUnHcmPp0DUOM
 JkAGRnS8pCxa8+RebpsylzYH7ImF/vfz31f7CjSVL2cUWszUBiBHrwGjW A==;
X-CSE-ConnectionGUID: PR/hA306SzebgSnfME3bCQ==
X-CSE-MsgGUID: H6SY5jfWSSGQQ9wc9GL9+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="97883818"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="97883818"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:48:43 -0700
X-CSE-ConnectionGUID: +wJXIh5OTFGEqQLgDkl8pw==
X-CSE-MsgGUID: PttVXRg9T/aD00DIjJ3lKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="244612394"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:48:42 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 4/5] tests/prime_udl: Fix i915 device opening
Date: Thu, 21 May 2026 19:48:19 +0200
Message-ID: <20260521174820.167237-5-kamil.konieczny@linux.intel.com>
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

There are now Intel cards handled by Xe driver so make sure we
open one handled by i915.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/prime_udl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index 5d2c952d5..db83152fc 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -49,6 +49,11 @@ static int find_and_open_devices(void)
 			intel_fd = open(path, O_RDWR);
 			if (intel_fd == -1)
 				return -1;
+
+			if (!is_i915_device(intel_fd)) {
+				close(intel_fd);
+				intel_fd = -1;
+			}
 		} else if (venid == 0x17e9 && udl_fd == -1) {
 			udl_fd = open(path, O_RDWR);
 			if (udl_fd == -1)
-- 
2.54.0

