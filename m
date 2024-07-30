Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38387C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C1110E512;
	Tue, 30 Jul 2024 11:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuWIerqY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B234310E510
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340020; x=1753876020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ke1k7HWWJ3GWX/rZq9wl6t5gin+yTSc4Mcpcd/FweBA=;
 b=kuWIerqYHl3gg4hxmeDlMNTCN5Avm+4a3NcVjh65dZfubdSwkp5eWMV5
 oNy/vfEwQs3iER6VYuKgNWIZ7bsBfvG3lExJ2kPVtYGKSReJ5YnqK4UKE
 Pa9ZbupaZA1a1+A4UY/U3wmdtxULq55+PArwxX+RV5mjitjbdduPH0KkG
 nGVcRI8fY8uhYA8IfOge5NNg7Gmtp24W5i+jBYG/AIDVjhaUg4ejZVf1C
 81/BAlRqJA9n3oijXNUw+6nOc6pcOwYP7Oda3nT5v0zikbuzCHRh2BbbL
 phuYxPousiRlImCvGspiB5ct6Da++5pGFKeZyatKX2rCSKgrgx5h/ikQv w==;
X-CSE-ConnectionGUID: gsqIvOgfQNCy3ScZzKUZBw==
X-CSE-MsgGUID: sNLnLICiSyydH80YOUppWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937156"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937156"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:00 -0700
X-CSE-ConnectionGUID: 2uvf58PBTCyvBOG3gBxMKg==
X-CSE-MsgGUID: QBgDOixfTT+2iCjnC7XAuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216435"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:46:56 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 06/66] lib/xe_eudebug: Add attention events support
Date: Tue, 30 Jul 2024 13:44:23 +0200
Message-Id: <20240730114523.334156-7-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Respect attention events in eu debugger library.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index c84c9d9b7..8a57aaae3 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -54,6 +54,8 @@ static const char *type_to_str(unsigned int type)
 		return "vm";
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
 		return "exec_queue";
+	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
+		return "attention";
 	}
 
 	return "UNKNOWN";
@@ -105,6 +107,15 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *b)
 			ee->exec_queue_handle, ee->engine_class, ee->width);
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
+		struct drm_xe_eudebug_event_eu_attention *ea = (void *)e;
+
+		sprintf(b, "client_handle=%llu, exec_queue_handle=%llu, "
+			   "lrc_handle=%llu, bitmask_size=%d",
+			ea->client_handle, ea->exec_queue_handle,
+			ea->lrc_handle, ea->bitmask_size);
+		break;
+	}
 	default:
 		strcpy(b, "<...>");
 	}
-- 
2.34.1

