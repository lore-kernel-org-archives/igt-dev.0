Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60314C25B7A
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 08:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CFF10E388;
	Thu, 23 May 2024 08:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncr+c/IQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5BF10E268
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716453881; x=1747989881;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+9lQki9DQVkIKGuCT4J4UUnB2D/9JjJd9xvbFkAT8nU=;
 b=ncr+c/IQObSQ9qBEDCf2lVUBnz/g/xVcygCrWact5PMBdyhcRaqorpUG
 DSiE+K6MSrdbutXsyVdF6WkGpzklq2GmHEAz7djQKhBF6/GUmDzeCd49w
 pfl+ytCkOT9rrrMvTP5ZUdhbQ4jhqc1Y5ZM+MAwx8sAXf1987Ps3D2tUS
 N9bNq3DgHs5NKaEUMjPDeicA5iWOGe4dqMkrtXnypcYlCIB9slam3bYSn
 ApcG77LYkt9P6kdECOD6fqwtxV+LUqX+0JBOQO14n/Cor6mL8bhD4hcwQ
 az6wL5F63P2LlzUNV93WvACuZPYGgh8PrV38barMEYBVZV7ZH6syDQQtC w==;
X-CSE-ConnectionGUID: ZGsxLsgsS8yWCFI1WT5emw==
X-CSE-MsgGUID: zaR5IwarQH66GO+kcjUz8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16543954"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="16543954"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 01:44:40 -0700
X-CSE-ConnectionGUID: dbAAPGcnTNCFZ0/FVflxKw==
X-CSE-MsgGUID: M8pLYQ23RD+XeczJoKi4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="64819781"
Received: from shrehore-mobl2.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.249.36.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 01:44:39 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector()
 return value in wait_for_connected_state()
Date: Thu, 23 May 2024 11:44:25 +0300
Message-Id: <20240523084426.284894-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240523084426.284894-1-luciano.coelho@intel.com>
References: <20240523084426.284894-1-luciano.coelho@intel.com>
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

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 lib/igt_chamelium.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 016d5356630c..b1478654d02a 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -524,6 +524,9 @@ static bool wait_for_connected_state(int drm_fd,
 			drmModeConnector *connector =
 				drmModeGetConnector(drm_fd, connectors[i]);
 
+			if (!connector)
+				break;
+
 			connected = connector->connection == DRM_MODE_CONNECTED;
 
 			drmModeFreeConnector(connector);
-- 
2.39.2

