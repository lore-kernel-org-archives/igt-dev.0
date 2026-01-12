Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC73C9EC82
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B0510E3C7;
	Mon, 12 Jan 2026 13:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SIrvj0AR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA3910E3C7
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222824; x=1799758824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bxJndHawZM8qHV2/mlo65xJwEnKoiPdoGRqgD9wHS+0=;
 b=SIrvj0ARJKoPX5Nkupt/JdTk6lR53R757WXzUGI5zbCL9gpJ7+5R26ps
 q5TvSa9ONgw8LcII55oWuRKHpsETnyhDNYP4h+qp8CFu5nMRS08Rs8MMD
 nwwxCGMIGPqydF6GkPV3Fy0aBt+smvEbuZtyxo0XEK5C2ScrauwlnEk9A
 xShElFxG9+6f9p06Gqzoe/9IqmMHYlcGjkAZwXSg410Dy2h554TJX2RQa
 HI+2puM7xLxs835H7tsYtC5jEmlvmcmU1ubeBNIz1CuNA8lSmCEZsNHZm
 oaDFfUlWCQsG/nwLW+NGqsRY3memowSMVmsn7BjvOJP5CSxoT8s3BEoPq Q==;
X-CSE-ConnectionGUID: TsCCS707SlKtP26UIR7HJg==
X-CSE-MsgGUID: UgzkgbqNS0STmYnXEjIpaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545512"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545512"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:24 -0800
X-CSE-ConnectionGUID: ic+y/zeXTA6svirIAug1jg==
X-CSE-MsgGUID: 7JWVshcySMKCFll4VxTAUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094909"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:22 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 01/21] lib/xe/xe_eudebug: Dont compare if everything
 filtered
Date: Mon, 12 Jan 2026 14:59:47 +0200
Message-ID: <20260112130008.1649357-2-mika.kuoppala@linux.intel.com>
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

If all events are filtered, we can omit comparing.
Otherwise client might not have had any events
and it will assert of not finding any.

Previously this worked as one event was guaranteed always
which was client open. This event does not exists anymore.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2abee7ba25..0f09bc8a19 100644
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

