Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C027CC25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 08:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30EF10E268;
	Thu, 23 May 2024 08:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETDAilka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276B9892EA
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 08:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716453882; x=1747989882;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pVM6I+VEKag89+kBLorQs6zxOQUziMQHphm13fxn5CY=;
 b=ETDAilkaK4TMn/SAvdDFbO/AXqdRAg/0mKQCC8KpnrBEovgVTtCPzZ3t
 0K6BzOIsqc6QaurbiP3PQqdvTrlSZdpeECQG+tLEuIOEYqFMk+ZGsXZbx
 tBU3AzmbZyzU/Zj3nvQnJFbuVkWfNMmRqiYvGteznK+zz2xZo4+fTAvNL
 hiMIJ5gVhVViCcHpBnFtcC0D9vHjBXl2t6JqXhRcDI6cinES/Dlctkcnc
 Hg89Nrti6UjDmuaL32oSw7GQvfPCQcYboq+EFzcbt8+ioDBH2y5OZaA0B
 x1KxNHP6H3eHW2AT1hNiMx4/r/Z7TgC17w2MUZ/1ZkIRcdnsQrGukxjQQ Q==;
X-CSE-ConnectionGUID: /kYcUAl6SxCwHDIwbgU+sg==
X-CSE-MsgGUID: sEmBIyrlSkKc4vyMcVZXrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16543958"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="16543958"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 01:44:41 -0700
X-CSE-ConnectionGUID: TAupZlUvTvW3mWLW/yBtVw==
X-CSE-MsgGUID: YuaMQg5yTfKq1awt9ZkiwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="64819787"
Received: from shrehore-mobl2.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.249.36.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 01:44:40 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel: check drmModeGetConnector() return
 value in i915_pm_rpm
Date: Thu, 23 May 2024 11:44:26 +0300
Message-Id: <20240523084426.284894-3-luciano.coelho@intel.com>
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
being checked in init_mode_set_data(), so fix that.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/intel/i915_pm_rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 52e00489da70..10a545f173de 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -515,6 +515,12 @@ static void init_mode_set_data(struct mode_set_data *data)
 			data->connectors[i] =
 				drmModeGetConnector(drm_fd,
 						    data->res->connectors[i]);
+			if (!data->connectors[i]) {
+				igt_warn("Could not read connector %u\n",
+					 data->res->connectors[i]);
+				continue;
+			}
+
 			data->edids[i] = get_connector_edid(data->connectors[i], i);
 		}
 
-- 
2.39.2

