Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F321CC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28B110E42C;
	Mon, 29 Jul 2024 16:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdhbQQb1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C777B10E425
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268967; x=1753804967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OS6qIpk8BaRm73Dmu98o50ELksDkME1hvZDkUPtajJs=;
 b=DdhbQQb1sR0fD5fvFbw//dwCUf6gwMHZJ4QjFgWBbRPiCyMXCouOJ7+v
 u38zmR8Ma3WvddqyzjbnP/GkCV7JDfoQED/S2s5nQ0x3M/L9L+3tUDDiR
 Z4ownldBcALbu97DgB+IYnX0mDM+KwlSBY3glx38ICKcuB/iAZ6slYw4n
 NaNeCtltN3kYr/BmQNYG1T14f1sWjpiEqjUd/1NMqze6aUEWfDEGbq730
 w4cIyvOE6HXch2n5BOXKD6BcgbQqpIOywmZaXaW569+4KTeRzXyxmc75t
 oGTpNEUyQgYoPX6CHROjk2Cvc97bWEsSWQxb3JoeBBYCdsHkOzROKcnoe A==;
X-CSE-ConnectionGUID: eOLmG45VSGOeEHR7WJ0ZFQ==
X-CSE-MsgGUID: jDTqZswESk2hGWpl8MhHoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426827"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426827"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:46 -0700
X-CSE-ConnectionGUID: KcMIIOI3SFuGVz5GlFNbhg==
X-CSE-MsgGUID: lOVUZRjOTMyZa1x1gfHi2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737296"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:33 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 05/66] lib/xe_eudebug: Add attention events support
Date: Mon, 29 Jul 2024 18:00:58 +0200
Message-Id: <20240729160159.37036-6-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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
index ca030704b..801317a23 100644
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

