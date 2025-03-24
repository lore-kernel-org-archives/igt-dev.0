Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7282BC36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 09:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2813010E0BD;
	Mon, 24 Mar 2025 09:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G84jAegc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46CB10E232
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 09:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742807071; x=1774343071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G8PgcKHBWaP+jaSuZro+8x7dJIWG7UNEkFozZfkNPYE=;
 b=G84jAegc6cOeHGZZM22MxdBTAta5USmkyr3nmi8jgbT2uT0M2JMkDMnS
 flI6XMgOsYIHNIe+w65pcu1HAge6mIl1encOaUfINiZTJ20+USQk0LifO
 WmFKGbvh/1DT7khkgSvZ59H4b/Pu7Hh0w7ofv0kJBH/Q5MG8CRsQjEf75
 U+s6VCi6oavMNuHye25lZHSjdb+nfrmYUYmK14cXMrNY1X8KAcKufuasA
 9liKuXDVNawhcH4BbcbCPAezKLf6i8TH0FsM0o/4x8a4/QJMBzaz+bGX8
 y4eI6sgUHF1XIGxfvTvyoEBBzB4M2hrD9UahkOa4qrUaAeIHh1jVyp7xD A==;
X-CSE-ConnectionGUID: d83Eda/7RfOnsPnu3DJLnQ==
X-CSE-MsgGUID: x4AGYefVTnm1a5xyiVXMGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="54999681"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="54999681"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:04:31 -0700
X-CSE-ConnectionGUID: CVkWV9EdR928+LVGmjHvBQ==
X-CSE-MsgGUID: NM9Evn3jSgehD04GhLAGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="129097386"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:04:29 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/3] tests/chamelium/kms_chamelium_color: Set rgb_full
 to 1.0
Date: Mon, 24 Mar 2025 14:39:49 +0530
Message-Id: <20250324090949.614233-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250324090949.614233-1-swati2.sharma@intel.com>
References: <20250324090949.614233-1-swati2.sharma@intel.com>
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

Set red_green_blue_full[] to 1.0 instead of 0.5

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 355047ed6..4088e2eb7 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -342,9 +342,9 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 		{ 0.0, 0.0, limited_result }
 	};
 	color_t red_green_blue_full[] = {
-		{ 0.5, 0.0, 0.0 },
-		{ 0.0, 0.5, 0.0 },
-		{ 0.0, 0.0, 0.5 }
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
 	};
 	double ctm[] = { 1.0, 0.0, 0.0,
 			0.0, 1.0, 0.0,
-- 
2.25.1

