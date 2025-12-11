Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0782D41D6C
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 16:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069F310E885;
	Thu, 11 Dec 2025 16:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7IlLqw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96E410E88B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765471233; x=1797007233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w9GQYxXPwG0AXrfzSUrbGGp5MfgU+Dir8sVqj6jCBsU=;
 b=g7IlLqw6+MywgU+sVSK4+bm3AAnujlYJkwV/dD93MeLzDZeOnG8aQKGM
 l9ZTo9hGhG6oBa07rlCpzXWVKpZO51DMzYmL/3rMDu9TSC8GR2xdLqojp
 KL2aF9/7IWzJ7K44EM/WA/HeQNZ3yQLyOnb+gxE5TqndqK5zpzuaqA7Yr
 gBbc+6wyt7DqlRHSrrvi5xJtgGIVHby2DWAItWVv7gPrpblnMNzHizYmz
 Bh434LPOPD+/CnjZZRhGpMF3Tc7NDE49egzFPJ6Abi5zd4EAp9RT/IbH2
 ChUSemzSJ971/UPd7j3QZkMLob/abxIz4Z0vEQKV0jqi18Rcj5xVLHuob g==;
X-CSE-ConnectionGUID: iQuYf9lSQAaxZg8VaXHowA==
X-CSE-MsgGUID: 6K0+Lm7xQ3y4aCOPQ7fEsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67500119"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67500119"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 08:40:33 -0800
X-CSE-ConnectionGUID: 4tztSwaPR8eH+H3pIF3Pbw==
X-CSE-MsgGUID: 7gmJkQI9Ti+aNUhnFkT0nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="201314916"
Received: from krybak-mobl1.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.5])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 08:40:31 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 3/3] lib/xe/xe_eudebug: Avoid matching if event is
 filtered
Date: Thu, 11 Dec 2025 18:40:20 +0200
Message-ID: <20251211164020.1065880-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211164020.1065880-1-mika.kuoppala@linux.intel.com>
References: <20251211164020.1065880-1-mika.kuoppala@linux.intel.com>
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

Bail out early if event is filtered instead of hitting
assert of not finding it.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 7c2c9505d..31e4f9c48 100644
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

