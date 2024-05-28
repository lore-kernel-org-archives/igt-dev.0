Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA4FC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 07:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99B710E376;
	Tue, 28 May 2024 07:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARxgPLjh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B24910E2F9
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 07:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716883149; x=1748419149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vlq3rd2wXezCwqNz+4fwKZRxjog5mBq/cXWUy8gVJqA=;
 b=ARxgPLjh0GxqXPMHKepKrDh06ENHxHNQdQD124tIzdFvmNBJImzp8EM0
 4QgSqiaOlrx/2HShRILkgQ1TZvgpBdBDvL6B4zJ/pykUDEgAFslKUKKz3
 6/hHP1OT3GoqkMvpBcoA4Kq7fWzsYzAW42xmF6hVw3BvWstbbZuBLY5Wc
 7Dn8/8xumUY+rxH33LxEP8CTgmTVjDhrhwtQDySPjpfXwAJjNtFU6fZdg
 MoIAotFfuI7WauNll4VU0WJuIcsu2q9AyDcrNqy4ifbbiUU8SzvNcwROa
 rFjc8pXYbyXs18xyE1bwf0gE4Rs4t3FN91MZCvMOmOGazDDu3yXLrwQk3 w==;
X-CSE-ConnectionGUID: 9Nju0J51S7GAj7SIRRGBKA==
X-CSE-MsgGUID: lCDTJxZ1QwO8/xDMIkUiQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11722494"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="11722494"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:59:09 -0700
X-CSE-ConnectionGUID: GvRYKRjwSi2UA9QexJyFXw==
X-CSE-MsgGUID: 5G4n/+9IS6yg2UV4lBIErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="35045335"
Received: from dgoldx-mobl1.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.249.36.167])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:59:07 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v2 1/2] lib/igt_chamelium: check drmModeGetConnector()
 return in wait_for_connected_state()
Date: Tue, 28 May 2024 10:58:54 +0300
Message-Id: <20240528075855.463729-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528075855.463729-1-luciano.coelho@intel.com>
References: <20240528075855.463729-1-luciano.coelho@intel.com>
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

The drmModeGetConnector() function can return NULL in some cases, so
we need to check the return value before accessing it.  This is not
being checked in wait_for_connected_state(), so fix that.

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Manasi Navare <navaremanasi@chromium.org>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 lib/igt_chamelium.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 016d5356630c..620fbbf7d94f 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -524,6 +524,11 @@ static bool wait_for_connected_state(int drm_fd,
 			drmModeConnector *connector =
 				drmModeGetConnector(drm_fd, connectors[i]);
 
+			if (!connector) {
+				connected = false;
+				break;
+			}
+
 			connected = connector->connection == DRM_MODE_CONNECTED;
 
 			drmModeFreeConnector(connector);
-- 
2.39.2

