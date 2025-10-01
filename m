Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EF4CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B3A10E6DD;
	Wed,  1 Oct 2025 11:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuRrOvAa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD83910E6DD
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 11:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319718; x=1790855718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yvOYrgAvZKqTmM7ZRhazNw+aL93chbYOPYh44k+rreg=;
 b=SuRrOvAaih2ey3Kzg5fdhokQ8Cpi7S5kTg/tSbMpi4+xdrOqILMUBM2i
 y9Wu2MXQoDbp1qOO4DoSTXl0lmQVTrmrvwiaBbdclGqX8C0lvsUgtbuSo
 TQiYj0FJSb085pR3HsoQdVwuUgzM5wU2eKal+NtziEX4br8ofZ1NDFJEY
 IOqFEOaJwbmalm+cptgDgOPP7O3+4FKrckwiWEW3CuM3LxeEJT5BVAi7u
 EbPlTOcWkoozcsqjkyAEMKMGGzkvdh6M8Ipk35THsC+c4nOaUo0jPex+9
 Reiz3nKfWLIsb+jpp+r68OH+cijTiUINOLeOE5zCb3M3f4vp0+lwXC4/r Q==;
X-CSE-ConnectionGUID: rdg4ymJNTW2n4bqA7CHsfw==
X-CSE-MsgGUID: 8lB9TslsT72iskIREGIXiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73014984"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="73014984"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:18 -0700
X-CSE-ConnectionGUID: I0YA4j9wRJqQNdJUfX7DNw==
X-CSE-MsgGUID: WbAoV9UoSUmSbPPp92Aw9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209496245"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:17 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v9 i-g-t 06/10] lib/xe_eudebug: Repeat poll in
 debugger_worker_loop if interrupted
Date: Wed,  1 Oct 2025 13:54:43 +0200
Message-Id: <20251001115447.11843-7-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
References: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
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

If poll() fails with errno set to EINTR, repeat the poll by restarting
the loop.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 614f327ae..3656a20f2 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1104,6 +1104,9 @@ static void *debugger_worker_loop(void *data)
 		ret = poll(&p, 1, timeout_ms);
 
 		if (ret == -1) {
+			if (errno == EINTR)
+				continue;
+
 			igt_info("poll failed with errno %d\n", errno);
 			break;
 		}
-- 
2.34.1

