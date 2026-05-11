Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7771CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 12:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826EF10E717;
	Mon, 11 May 2026 12:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjpwz7rw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61F910E6FE
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778504208; x=1810040208;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=6/Ly3QZY1MZ/F9QRFr7hOKd/0ve7TqKTiyB8Q4t7Ja4=;
 b=fjpwz7rwMcSmftAy12hXQTnwIilEn+bDiVA72n3W9J/W7P2RkZovhLiQ
 hcde89g9wUnnSApxB799E+/8qaBBlVC7XJFD/usy+rSsNpRKU/539pFti
 IU8c3ljLKko/wC8h6YnkSdZWs+/57nfdeGM487opRxso35GUe5jHeeEov
 n5pd7VBIWJ08JWX3z8dOVl/ueYU01TfGWYnA0JZsxPSRrUkMhl9Cg/5IN
 0s64AerFiVkivIFh/AP1sFPRo4YY6UUV6jfRiTX/lKQP9Wpkps3bLLym9
 6ZiE1SvarHZtl+3r8YkzsJXIaNSU8WPKFc1Fv0rnUFJsR2u1+3GTUtSK6 w==;
X-CSE-ConnectionGUID: zzsVdSmyT86teP1foIM7og==
X-CSE-MsgGUID: VsiSjcA5Rz6ohjcsmKXX9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104847974"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="104847974"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:56:47 -0700
X-CSE-ConnectionGUID: 8h5E4herQMOuPUgbYcs/KQ==
X-CSE-MsgGUID: /0A4wwLpQhG8nxOhW0SV1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="275575378"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:56:46 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 11 May 2026 14:55:23 +0200
Subject: [PATCH v3 1/2] lib/igt_core: do not reset errno in igt_gettime
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add_timestamps_to_logs-v3-1-041130e1f7ef@intel.com>
References: <20260511-add_timestamps_to_logs-v3-0-041130e1f7ef@intel.com>
In-Reply-To: <20260511-add_timestamps_to_logs-v3-0-041130e1f7ef@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>, 
 Jari Tahvanainen <jari.tahvanainen@intel.com>, 
 Mateusz Grabski <mateusz.grabski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=743;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=6/Ly3QZY1MZ/F9QRFr7hOKd/0ve7TqKTiyB8Q4t7Ja4=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqAdHDzuQFZs0TqzYG9OTyjQCArzM18rMLN078D
 Sxr5YlV/HKJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCagHRwwAKCRAjYrKT3hD9
 1wKsC/wInBPDQzsuruSRDWzGn1ZbYEfsqNE0yE/uEpvwBNXXaKAvJJikZDHrFS21Rn+OWlW94eX
 mHp+l2VBHiTejmjJdGbfZRdmTqzh4rKy+Bi348uYNpgYrPezahHdFC69zrhlLQqagLMYH6JmWKT
 2l7Y4RNdh/SoKGhxtC1aqBjdkjP18+tkeGs61WrYzH1TAH1G5rZPGqudllbc6em8iOZfJ1qunp0
 nkCM2xCvc1KaGuzozWzdmzUMjCsnRXB9SyBmbi7hhioZRzOtR6YSmuLgJpcZqUChYVy3y6ahIE3
 xI/i9VgoB93Gf3KTVuEe3o1jkrU1SHDxUSS74UYrnPZgP0DJ14n4d3rD6ZBBlyskBmSSkR6GJ6r
 ekDkXzqI+mung4SxeSyjoG6sFCQn2p85wHer2ElnVr5m8nZm5JF0I3l0yNO8Xc/qh68kXznusND
 2GHTBZZJWYjwvn2+KxHS81rZuigZI4QNud6kUdsI9u15z3romvo2Z7v6oGQUVffYh7T0c=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Resetting errno before calls makes sense only if we are not able
to distinguish if following call will fail. This is not the case
of clock_gettime - it's return value is straightforward, -1 means function
failed with errno set.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/igt_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 4f79c02948ab..5a0ab4361eaa 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -719,7 +719,6 @@ double igt_time_elapsed(struct timespec *then,
 int igt_gettime(struct timespec *ts)
 {
 	memset(ts, 0, sizeof(*ts));
-	errno = 0;
 
 	/* Stay on the same clock for consistency. */
 	if (igt_clock != (clockid_t)-1) {

-- 
2.54.0

