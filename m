Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F2CD1D88D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 17:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412E510E0F8;
	Tue, 15 Oct 2024 17:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSVJFWgk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BB710E0F8
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729012701; x=1760548701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QFXJpZvJPqJ2QIygluwPGh6EgmdQ+H0jcZrW6VWpZvU=;
 b=RSVJFWgk36CaNvSDcRYMIMzkbGAQhNBy8Z2JHnSTH5xlOoLw4L/+Q2gy
 9CXxSTxDGSfZaIfQAjNC1Eg6JC7BQo2eJ0V1hCdHcUprIhU3smxcwOj2t
 PvLWx93sNL+ACfd4I9JBwFo7ngAijxx3BGXi7cz+moCO6PBR63Vcga+E1
 9QkJ70VK+CLmHurYFhDEB0wOr/iD0X8EOlqfM5hRtHwMKNOTxB/2yoYHC
 36JLF2I008g7uJcE8gXlyVnpQ4mxqwPbTBJnOQ35NMpTHWkjTbzUvDe68
 UI04JuiacCbcSob5PhbcLOCbWJ5OfS2HkRvFHrIarfIURtVX13fkFeOHl Q==;
X-CSE-ConnectionGUID: 7wD/B1p6TCe6lrd6L6btNw==
X-CSE-MsgGUID: USNapa4RRNyimyl+7Bm7iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28516934"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28516934"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 10:18:20 -0700
X-CSE-ConnectionGUID: 2bKneCkASmaKPMvAahwJzw==
X-CSE-MsgGUID: KdoZB2pdTdCSxjv9NgXQ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="82765419"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa003.jf.intel.com with ESMTP; 15 Oct 2024 10:18:18 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 1/2] tests/kms_flip.c: Updating the skip message
Date: Tue, 15 Oct 2024 22:48:48 +0530
Message-Id: <20241015171849.1733664-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Debugging would be easier if we had logs available for
test failures and skips. This patch rephrases the skip
message for better understanding.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_flip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index cbabbe74f..88cd41083 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1896,7 +1896,7 @@ static void run_pair(int duration, int flags)
 
 	/* If we have fewer than 2 connected outputs then we won't have any
 	 * configuration at all. So skip in that case. */
-	igt_require_f(modes, "At least two displays required\n");
+	igt_require_f(modes, "At least two displays with same modes are required\n");
 
 	if (duration) {
 		duration = duration * 1000 / modes;
-- 
2.34.1

