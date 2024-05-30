Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42603C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 08:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8576C10E116;
	Thu, 30 May 2024 08:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKc/6c58";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54D010E352
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 08:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717059564; x=1748595564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fcAgw6ewqOuwFDp26s9ZkYIc6VxQhGPeCx1Ljks1QyA=;
 b=HKc/6c58YslWL75hL1FvwXbzcfyvke/8hrLCcQPaIXIdyrin5Filgs4h
 GBfYV5Bvw9M/lhgA4AOKojyfk4SaPeu+7nP82htW+ET6REcdv+EPkde1y
 wUq7lRxFdxE9FuQLSNfaUaOfuYu0UPW4rfy8C55IJRqCo5ZvdIqxaHuyA
 mEB9FFGzYKsO9sqn0nL7ZXyrEkrRlozPUGZIWwkJEVqsFbmCaSTyoO4xG
 HmLHd2U+7I408DEpLXrCjV1Udw2Dyoc0Qlx8wXnlVDXgZLEwhs1bEwADF
 vLQBEhdFX7BE1RmdTrJhpKh9RkePBT7bQLFY1YSjULXlCK1M4vgaiYOaX g==;
X-CSE-ConnectionGUID: IvOe/DbIRWCiFeWSaeh7HA==
X-CSE-MsgGUID: EevE5B90S0yMZQpmqsxB2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24134317"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24134317"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 01:59:22 -0700
X-CSE-ConnectionGUID: rwd7ccyGQwKWxub2GGbR2w==
X-CSE-MsgGUID: /7QKVI/ASFORYU3mugTdnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40621909"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.249.36.158])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 01:59:21 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v3 2/2] tests/intel/i915_pm_rpm: check
 drmModeGetConnector() before use
Date: Thu, 30 May 2024 11:59:08 +0300
Message-Id: <20240530085908.564733-3-luciano.coelho@intel.com>
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
being checked in init_mode_set_data(), so fix that.

From the bug report:

Starting subtest: module-reload
Received signal SIGSEGV.
Stack trace:

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Jani Saarinen <jani.saarinen@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/intel/i915_pm_rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 0ea5fbd8afd9..e0f395fa8a84 100644
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

