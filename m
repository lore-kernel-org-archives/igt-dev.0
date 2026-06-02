Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC60CD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 12:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F011210F077;
	Tue,  2 Jun 2026 12:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PM6B/O2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9000E10F076
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780404500; x=1811940500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VVyzU7DLMaYpStM657fchxGYWaWEhKnd51ViqUC7HlE=;
 b=PM6B/O2DU0Qh4z3WucHIADY6VghZw8jEplSfcGGTPK369EtwRnQdxB/o
 2xJq22afGT+IYKdOM/l3TFto0xESvXSESRioQzurB4O05drYOeHLGqMpG
 WosfGMoxZYyWSlj5/VJh663VAePZo22jkmF8iZxhVIU0avNyZXSblHmSl
 gV/A1ZqRituBzrFdslKMm/+hlsqcAWCI+Yak465ZxwSvXOiAt6tJgPvtH
 8pJvJe9ELSDtqgfR93zICvBTV6qSA850D3rZtPdhsGbWhPfZ5y9jzKHoX
 acvb70Aw6rAdIhEfS/ZdWC+j33jZMUiTnihTT3iOhCl0TjJkAgPyBw/Rv A==;
X-CSE-ConnectionGUID: 5Y9zKNrgTa+6PY/VXiZlNw==
X-CSE-MsgGUID: DlMOJvVzRRKmJgD3Iq+9Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81368211"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="81368211"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 05:48:19 -0700
X-CSE-ConnectionGUID: gv8NxiUeTRWLmqNm9gXbRg==
X-CSE-MsgGUID: dyUwPjNPTWyWaGvYw4LayA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="248971386"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 05:48:18 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] runner/resultgen: Fix fd leakage
Date: Tue,  2 Jun 2026 14:48:09 +0200
Message-ID: <20260602124809.111457-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Close dir fd before exit from fill_from_attachments().

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Fixes: d34395a7ede7 ("runner/resultgen: Insert attachments list into results.json")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index aeec9eb08..1ee167fb0 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1230,6 +1230,7 @@ static bool fill_from_attachments(int idirfd, struct json_t *tests)
 	tmp_tests = tests;
 	ret = nftw(".", ftw_attachments_list, 4, FTW_PHYS | FTW_DEPTH);
 	fchdir(dirfd(currdir));
+	closedir(currdir);
 
 	return ret ? false : true;
 }
-- 
2.54.0

