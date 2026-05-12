Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C252CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B7C10E0E5;
	Tue, 12 May 2026 12:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAHcO2BU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740AA10E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588512; x=1810124512;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NhRPFcfF1+F164bPId8qpEIwQDG1mjU7OMMgMXSaQ3E=;
 b=CAHcO2BUEUUDh7YtOuaL8XKVuyOMsPRrc2PBLs5I3yfqqtLToOxEzk2i
 SostkQsBFxE5O7lZDyQTec2cv+RqfDB5s2sxxgtVBPpmb/D4ole3GWK1w
 6s1aJDbIWTudlJdM5vMMIqrUlBx356WofezdpukQN1N8pcz2j7mcjfYGC
 MC1AQAxn86CKKFje+wcHlnNy+q4fxqAHbAUJb41nbNILzwTGMhxyT8JbD
 1XJ9xhHOkgsoVWlQ6pRjpdS4ma9Zykj27w8l6QHVeaGSWkwr+bLWEzeNE
 oERmfrGghMBi+KbWxJ/EMiO0ggt5ApERG1maaycrNDu4X2Ke4ifoFl4Q+ Q==;
X-CSE-ConnectionGUID: kX9ZU6cQTEmfcDtDpN6Btw==
X-CSE-MsgGUID: k0r/IR2VQNqyNE3GvkIkHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79525663"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79525663"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:21:52 -0700
X-CSE-ConnectionGUID: fGrpZ0lJQaWTJQWtJBj8+g==
X-CSE-MsgGUID: 53djOqlUQyeK2UUdip/xMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="235091348"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:21:51 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/25] tests/kms_async_flips: Use correct format_mod list
Date: Tue, 12 May 2026 15:21:19 +0300
Message-ID: <20260512122143.11013-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

kms_async_flips is trying to iterate the async flip format/modifier
list, but it then mistakenly looks at the non-async format list.
Pick the format from the list we're actually iterating.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 305bd51904ce..2c39574a079b 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -1026,7 +1026,7 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
 			uint64_t modifier = data->plane->async_modifiers[i];
 
-			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
+			if (data->plane->async_formats[i] != DRM_FORMAT_XRGB8888)
 				continue;
 
 			if (modifier == DRM_FORMAT_MOD_LINEAR)
-- 
2.52.0

