Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80762C44515
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 00:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0227A10E23B;
	Tue, 21 Jul 2026 00:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5sJyFuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D8310E23B
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 00:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784593982; x=1816129982;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ilQ9tka1TleVGsnaoxrduNo+DfxQgEq1U/pHA9B79rw=;
 b=J5sJyFuIz6I5fquwvu87bb9cY0mqK5Bgv7krX5acJzQQxDYJyi7gtzDi
 /m6lnxdjfQuFUJTAMhDQ9z1N4WdVgO708IlUxnOPsC8NbgmnRqtwsK060
 HB47ccsEbfgbPvv7AsLSjQKfAXG43QqXH+KLOS7Do1HLL6ozySBlxzSA+
 CFbgd9AXknaei2aYEL+Fu74m38NhBwvc+DQBn8wT858DtSsnHlAcIDeUU
 RqWEJbVjS3Muf5PpHJ5preQfSjcivbYpeZhdsdj0P5yr+iAOa+MloZVcT
 /S/6DdRI8qvlyNnoKzahOoIUueA3yxZCfx6UNGO2HwRNkLNrfAnf8dCuZ A==;
X-CSE-ConnectionGUID: bltG8JFNTKO1nK18mhKq+g==
X-CSE-MsgGUID: 0/LfYz5kQBCRZFVxFoADBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85042950"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85042950"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 17:33:02 -0700
X-CSE-ConnectionGUID: 2dz2I32IRMeKS0MsgK+sOg==
X-CSE-MsgGUID: Fum0Th+KRJ+ymiVaA7CLEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="295818466"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 17:33:02 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: [PATCH i-g-t] tools/xe-perf/xe-perf-recorder: don't write OA report
 multiple times
Date: Mon, 20 Jul 2026 17:32:52 -0700
Message-ID: <20260721003252.2224870-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

Fix bug because of which a single report is written multiple times (rather
than writing multiple reports).

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/xe-perf/xe_perf_recorder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index f200fe9c9b..61c3f6945c 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -587,6 +587,8 @@ static bool write_stream_data(struct recording_context *ctx,
 
 		if (fwrite(data, format_size, 1, output) != 1)
 			return false;
+
+		data += format_size;
 	}
 
 	return true;
-- 
2.54.0

