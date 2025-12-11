Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F35D41D6B
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 16:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD9710E87E;
	Thu, 11 Dec 2025 16:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSaFXVBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7592310E88B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765471233; x=1797007233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oQari+CNKg8a/THXDG2J64WTLWM5ko+ssn9Z99o+6n8=;
 b=dSaFXVBhF8x2ryNfXQkDEyMByesnVa8IydTsMCFisFNGIPHHbuCxlVq8
 R2JfpmR2DV1bXwRMS1Aib2g+NJmtr0iCLiif/d25juySdZGL8UflTzLt+
 9mJ+a2FxJNAbJOgmVS434YZMn0LblpsXAKN+Gu9qczqR0bCYoLuIhaw0C
 /NzEMDOaKFNPLA1K+klZtpNcuQ2hmC8Rozvwde2+/l5zS738KUP1shY7k
 9N6LXvQgpu9BT3hIhyS2ssOIUhqQIYwZl3wYduAlcqR4QpUlZ9/kEJDLJ
 UxxOQZzYtC2bw/1FWgCRQLvDgf4Lytqj56JOvYt06tjN9F132ib15PeYA Q==;
X-CSE-ConnectionGUID: aVXCWbHwTlCStbBwWHHKKQ==
X-CSE-MsgGUID: 32PHSU3fRZOTXtqjbRv/EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67500102"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67500102"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 08:40:28 -0800
X-CSE-ConnectionGUID: PJdGK8XjRDeJblUXIKHcMQ==
X-CSE-MsgGUID: LwWzvHVwTGOihIsiN/QQKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="201314891"
Received: from krybak-mobl1.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.5])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 08:40:26 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 1/3] lib/xe/xe_eudebug: Avoid comparing if everything
 filtered
Date: Thu, 11 Dec 2025 18:40:18 +0200
Message-ID: <20251211164020.1065880-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

If all events are filtered, we should omit comparing.
Otherwise client might not have produced any events
and compare will assert of not finding any.

Previously this worked as one event was always guaranteed
to exists (client open). This event does not exist anymore
and thus we need extra care here.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2abee7ba2..0f09bc8a1 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1021,6 +1021,11 @@ void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *log1,
 	igt_assert(log1);
 	igt_assert(log2);
 
+	if (filter == XE_EUDEBUG_FILTER_ALL) {
+		igt_debug("info: filtering everything, skipping compare\n");
+		return;
+	}
+
 	xe_eudebug_for_each_event(ev1, log1) {
 		if (ev1->type == DRM_XE_EUDEBUG_EVENT_OPEN &&
 		    ev1->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
-- 
2.43.0

