Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A18C25B7E
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 07:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7B410E377;
	Tue, 28 May 2024 07:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHgcvSgD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BD110E2F9
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 07:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716883150; x=1748419150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tp6a6NRel7gpw3D5CpQoU7Wf6aHMJHM1kq2a/05uvSg=;
 b=KHgcvSgD0LMQ4id9jZm81fV9ctfCuepIv1OTOQ2i/Xl52uWNkXkCbPN0
 j2ZmT6P9WlCifBKjtQjIFZVg/jqBIGXc5rNtkeXMGYCb4McHOVU01CmQ3
 UYMjm7/z9+iASDlU3DbVFIRrvddxfFjQyp76/ZhcqKgRu8yf2vpyBqt+V
 vcqoC1cNU7MlPs8RikH993Rw/mGM1ux4JjJq+tYHQH5nSpBmOXhOtuUZ7
 NNnU5Lvts7xGdqFebNHbdHQxKBT8HgW/VhKaTYNBg9jBtNOABK2JrBpgZ
 nwTnu2ibz0cewx180sWXqfFrXqkrAEyTy5EUsH0NAycupcHBv7I1lVfLA w==;
X-CSE-ConnectionGUID: z2Sti6xGTo+cRa3QylLyMQ==
X-CSE-MsgGUID: mV95lIgZR1CHish756wbqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11722495"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="11722495"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:59:10 -0700
X-CSE-ConnectionGUID: eBadtYRgRK6PupYVXUGpWA==
X-CSE-MsgGUID: Vg7vKkfqRsO2MJ7KoiVPjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="35045341"
Received: from dgoldx-mobl1.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.249.36.167])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:59:08 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v2 2/2] tests/intel: check drmModeGetConnector() return
 in i915_pm_rpm
Date: Tue, 28 May 2024 10:58:55 +0300
Message-Id: <20240528075855.463729-3-luciano.coelho@intel.com>
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
being checked in init_mode_set_data(), so fix that.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/intel/i915_pm_rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 0ea5fbd8afd9..3b4034f24a57 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -515,6 +515,12 @@ static void init_mode_set_data(struct mode_set_data *data)
 			data->connectors[i] =
 				drmModeGetConnector(drm_fd,
 						    data->res->connectors[i]);
+			if (!data->connectors[i]) {
+				igt_debug("Could not read connector %u\n",
+					  data->res->connectors[i]);
+				continue;
+			}
+
 			data->edids[i] = get_connector_edid(data->connectors[i], i);
 		}
 
-- 
2.39.2

