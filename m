Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE7AC27C43
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 08:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2862910E3DC;
	Thu, 30 May 2024 08:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlFB4Lyo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D5210E116
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717059564; x=1748595564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vlq3rd2wXezCwqNz+4fwKZRxjog5mBq/cXWUy8gVJqA=;
 b=RlFB4LyoaNy0l4+XnRQllJFefguuusswM2YrVkmAC7t/mp81dVsvRETZ
 ZShP6VxBTBjgyzT4tWPUbGJ3DFkwHFpG8PlqbgIKCprrv4zHe2nsPcaXK
 itF5lAo75A7ldd/mpCQ+H7NE7LUwsy8UBvzQJfK8W1FxcnwtQ2rI0nZRY
 accuVgQx4HFpqzlREslDDp+V+G0OYLeOCJW/yFXZruX/+SauWfeIbwlGO
 m31djVbnQotri9W69cNVAWcff2yyt79xAe7U0DsE6l442HvQdrxGzJ27M
 s2dxZ7b46MqG+q1lWsGcU4N/73JoumfLZ5PVCctAEFXUz2k2fttPGIGTQ A==;
X-CSE-ConnectionGUID: I4sQ8LL0TwuSq8M/imnJgg==
X-CSE-MsgGUID: fAsYC4voQziwvWK2bam5kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24134316"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24134316"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 01:59:20 -0700
X-CSE-ConnectionGUID: YZvU6lu5TP259KXxqxIilQ==
X-CSE-MsgGUID: 7e0X+8zpSpaKSCpSp7CDtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40621906"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.249.36.158])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 01:59:20 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v3 1/2] lib/igt_chamelium: check drmModeGetConnector()
 before using
Date: Thu, 30 May 2024 11:59:07 +0300
Message-Id: <20240530085908.564733-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240530085908.564733-1-luciano.coelho@intel.com>
References: <20240530085908.564733-1-luciano.coelho@intel.com>
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

