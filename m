Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DE2C9EC87
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB0410E3C5;
	Mon, 12 Jan 2026 13:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DU1nmaCP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5815E10E3C9
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222830; x=1799758830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XB8e4Zo0RYoL3btZrYCo5mnPws5BjDxWTk9y8r+xYzk=;
 b=DU1nmaCPC5ooxCRk3DSIiS7CVPK3gTu5Z8Ghnh7GzrBJNZBZ4vleSjRl
 Rj7NQJOic8W5MhCOjxFAXUaLOYIpk1S0pKbJCfILH9a2RgddHC67l/sy8
 y9omds/OdCNTcffBx6WtgU354nPICjeSQVQOg8xWjgmfs+eLmnDJp7sQ3
 muR4Auphp7QJpdUuq1bFMSh0jjo70fkPg1gE2mrvAG4ffrBvKiA8TNYpL
 q7L6XTJC1fYr7FNEPT9YVevkzLw4LOLH9tqK9BdIw6fCtc/50Fe+ni45C
 hR/4UrX41VrFJ5AOe1L40l+Vh7D3UY7HQXOOBYt7WvT+TC3W1DYyiK+6x Q==;
X-CSE-ConnectionGUID: 0RquTPtJSPKHvjw5BIiMLA==
X-CSE-MsgGUID: KWMCVDt4SSmZN15yYeS1QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545521"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545521"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:29 -0800
X-CSE-ConnectionGUID: KmxXrtquQq20h0eeiRb+vw==
X-CSE-MsgGUID: R7YyD3/CTXifJAvr0uQwlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094929"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:27 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 03/21] lib/xe/xe_eudebug: Avoid matching if event is
 filtered
Date: Mon, 12 Jan 2026 14:59:49 +0200
Message-ID: <20260112130008.1649357-4-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Bail out early if event is filtered instead of hitting
assert of not finding it.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 7c2c9505d1..31e4f9c486 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1027,9 +1027,17 @@ void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *log1,
 	}
 
 	xe_eudebug_for_each_event(ev1, log1) {
+		if (XE_EUDEBUG_EVENT_IS_FILTERED(ev1->type, filter))
+			continue;
+
 		if (ev1->type == DRM_XE_EUDEBUG_EVENT_OPEN &&
 		    ev1->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
 			ev2 = event_type_match(log2, ev1, ev2);
+			if (!ev2)
+				igt_debug("match failed to find type %d, seqno %llu\n",
+					  ev1->type, ev1->seqno);
+
+			igt_assert(ev2);
 
 			compare_client(log1, ev1, log2, ev2, filter);
 			compare_client(log2, ev2, log1, ev1, filter);
-- 
2.43.0

