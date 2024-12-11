Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923AAE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 11:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D65510E607;
	Wed, 11 Dec 2024 11:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEaOmp/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B151B10E3E2
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 11:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733917272; x=1765453272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8JqjZYotPhiKmyRRW+oLMUzQ04iaQ/tU49B67OiJpXA=;
 b=kEaOmp/d0pMMQjKvVkDBk4TkMMdPLvm7AzaBeRBnYMXiHEkpBdFS6Gl5
 G2z562LimMsL3Cg19WEJJl5ItkgyhDhf2xNfjUJh8RR5FtsAL05VhPhqD
 PhwGG/yDPGWY7hYojhS6qLnRVNC4rUTFdB5Dcgjmih55kGUU6d217R2Sq
 fkf4sIRSpy5M3Wa7JUMASKQXE6/p4mdML7wUPfFIBeAfEKu2ZEfjUjYUU
 ZlimNyJJG6XeP6koZomyfvLMqzf2i84b+J1xhDmsQQ9GgW8gCNUUN7gOv
 AjiuHnAY5IoL/bFB09q4plFrKM9tQ6KXTxhyBsyvVT0ikmagyHCU8FUxV w==;
X-CSE-ConnectionGUID: J0cqBMTxTHmAPyY5OVWDuQ==
X-CSE-MsgGUID: LrAf+xrRSVeXJj+OcGC6eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33625091"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="33625091"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:41:12 -0800
X-CSE-ConnectionGUID: o9bhi+d6SeSdvLhiqMxr4w==
X-CSE-MsgGUID: 2Hn8gftYTGWqpovaBa+vNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99857098"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO dgrzegor-mobl2..)
 ([10.245.244.142])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:41:01 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 3/4] lib/xe_eudebug: Use xe_engine_class_short_string
Date: Wed, 11 Dec 2024 12:40:43 +0100
Message-Id: <20241211114044.210562-3-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211114044.210562-1-dominik.grzegorzek@intel.com>
References: <20241211114044.210562-1-dominik.grzegorzek@intel.com>
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

Replace local function returning class short name by library function
defined in xe_query.h.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index f2483028f..24062e399 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -16,6 +16,7 @@
 #include "intel_pat.h"
 #include "xe_eudebug.h"
 #include "xe_ioctl.h"
+#include "xe/xe_query.h"
 
 struct event_trigger {
 	xe_eudebug_trigger_fn fn;
@@ -124,18 +125,6 @@ static const char *flags_to_str(unsigned int flags)
 	return "flags unknown";
 }
 
-static const char *eu_engine_class_to_str(uint16_t engine_class)
-{
-	switch (engine_class) {
-	case DRM_XE_ENGINE_CLASS_COMPUTE:
-		return "ccs";
-	case DRM_XE_ENGINE_CLASS_RENDER:
-		return "rcs";
-	default:
-		return "unsupported class";
-	}
-}
-
 static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *buf)
 {
 	switch (e->type) {
@@ -176,7 +165,7 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 
 		for (i = 0; i < ee->num_placements; i++)
 			l += sprintf(buf + l, "%s%d pad%d, ",
-				     eu_engine_class_to_str(instances[i].engine_class),
+				     xe_engine_class_short_string(instances[i].engine_class),
 				     instances[i].engine_instance, instances[i].pad);
 		buf[l - 2] = ']';
 
-- 
2.34.1

