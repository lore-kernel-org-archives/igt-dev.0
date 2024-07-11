Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8B1C3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 11:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E96610EA20;
	Thu, 11 Jul 2024 11:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTZ/AMB6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A11A10EA20
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 11:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720695750; x=1752231750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aSQ1J+N6wNq5VdRp7fQ8hRARNEq/IpoXel57ixohtWU=;
 b=WTZ/AMB6DfydzT0BmdmiBKmf4F5CDJxOfwTO4VteTpUhxoH5p9EGFrAG
 YT0cFiqql3yXCY3hj/+ZiC4eZD1M3AIxg5ruZwjM5tGsCCtM9NQuF2eHg
 QW4p98VpYAU8oTjmkPDGOWxnUAFzbYpyiSrIWSuymvimaXF5vGVH7pK89
 yYqmisPN9CR68SsZin49GxU6bJE34IIGWsNE+gcwgdQQOA0o4h84BiA6D
 Y6FKIND65YxDvg9ZIUfzLcUUN/wAEM0wIrhohTLhhUkXWly06v4WllIjo
 9t8GWxbi0CWZucWhi3UcfJkGM0hqCpPUMiLMLHrGGaQfwgqLKyXCANh53 w==;
X-CSE-ConnectionGUID: w86hY/PPTu22beoGdDnxCQ==
X-CSE-MsgGUID: D/0QOWV3RWGKUnIADQ1/EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="40579894"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="40579894"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:02:30 -0700
X-CSE-ConnectionGUID: 5JCKKyUSRRCtGNOYDAFoHQ==
X-CSE-MsgGUID: dP0l+jvVSUC55FD/BHi+Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="53700008"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:02:28 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/2] lib/igt_fb: Calculate fb size according to display
 requirement
Date: Thu, 11 Jul 2024 13:02:10 +0200
Message-Id: <20240711110210.207882-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711110210.207882-1-zbigniew.kempczynski@intel.com>
References: <20240711110210.207882-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Minimum page alignment may vary from display alignment so lets pick
maximum of those to satisfy its need.

Note for scanout Battlemage requires bo allocation in 64K contigues
pages alignment whereas normal objects might be allocated in 4K page
increments.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ab162a5b74..030b4db84d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -956,7 +956,9 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
 	}
 
 	if (is_xe_device(fb->fd))
-		size = ALIGN(size, xe_get_default_alignment(fb->fd));
+		size = ALIGN(size, max_t(uint32_t,
+					 xe_get_default_alignment(fb->fd),
+					 xe_get_display_alignment(fb->fd)));
 
 	return size;
 }
-- 
2.34.1

