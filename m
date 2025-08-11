Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8230AC87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 12:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3079B10E466;
	Mon, 11 Aug 2025 12:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mR/4LMis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FC010E463
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754916652; x=1786452652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=liCBUzQG6o8kxSMR/uCvbom08iky5nAhj+uLst7zfQ0=;
 b=mR/4LMisP0CJEHqiwrDGa/ywMogzQhszHUGi19cSo6hfj4AHVzHwXg8M
 dlYbicBavgaC5GqkGXZWWyTtjyYaofo9wBpbKZTd8hBuEhltiz8yUMBDF
 w7xeshxzmNeCw8uKm5mqP2M9G4oqop4z+AzS+tcvxXI3luaiY8Jq+XKUD
 f5Oph615pmJUHSQkTBFsOzsZOBrUX116IfqoeAMopKAJGiL4rVE2852mO
 CDJn0L9xHkD//Yr64xD8R51/KFr2RA6jCMFHxkkkCZoSFmVdg7OyEvV08
 7RUKhKDGatSOEtvPbQNuB/xyavHWehScAXBAJgFlhHrLfZvIoOJOiyIYt w==;
X-CSE-ConnectionGUID: XVhzEh4FSf++KjQdqq0KRw==
X-CSE-MsgGUID: jW6PtrlgR0i+Qm0uLHSJOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68537490"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68537490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 05:50:52 -0700
X-CSE-ConnectionGUID: 41pCWvhQSru6wVqv8IA2yw==
X-CSE-MsgGUID: X1z21tqMSZqEuM9rx0B0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166265796"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 05:50:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 4/4] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 kernel commit 96b451d53ae9
Date: Mon, 11 Aug 2025 15:50:26 +0300
Message-ID: <ba7afed7dbbc4ee1d1599bd66a7f453f15df1b4a.1754916577.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1754916577.git.jani.nikula@intel.com>
References: <cover.1754916577.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Synchronize intel_vbt_defs.h with kernel commit:

96b451d53ae9 ("drm/{i915,xe}: convert i915 and xe display members into pointers")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index e9b809568cd4..92c04811aa28 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -446,7 +446,7 @@ enum vbt_gmbus_ddi {
  * basically any of the fields to ensure the correct interpretation for the BDB
  * version in question.
  *
- * When we copy the child device configs to dev_priv->display.vbt.child_dev, we
+ * When we copy the child device configs to display->vbt.child_dev, we
  * reserve space for the full structure below, and initialize the tail not
  * actually present in VBT to zeros. Accessing those fields is fine, as long as
  * the default zero is taken into account, again according to the BDB version.
-- 
2.47.2

