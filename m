Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332B21067044
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD92A10EA54;
	Thu, 12 Mar 2026 15:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzylV0Dk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C510EA53
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773329138; x=1804865138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5c3Nfo8QTO/72/X0RgxLVia67uwXXGomhYkwr4O1m4M=;
 b=QzylV0Dk1zRxqO6Fyfm7++Ppwep0suHPHFonX3aP8bsNwLM484bUeYZ/
 B5aP9JvgL5S2rWRgVgdWkthoxsIOIzQPEHve51hLxfaRdsPAr6dUWYUdv
 GN7BAU6a+58oiIFQjpBdJbmCTmHa/w0g6BNslsA46bD22GopFb6EDJalq
 eh/G1HxRrvGQywpHPGrVQCE/uj7B81aZpC2390NQCsiWBkGOAn6sJt7Jl
 KReNxBH2SR137n6FweQhQSb4FJhXr7AHCvKJpZW87toHT1+gDq0L4DfZN
 OOelir/06SyYJ/xjNu73RGcjOladzrLH6s8rKTEQ5pQiYmB8YitbU1gkM g==;
X-CSE-ConnectionGUID: /ixeEBwsS3OulK0IkC2buQ==
X-CSE-MsgGUID: ymQojC5KQVGLAG42qPRxvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85902418"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85902418"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:37 -0700
X-CSE-ConnectionGUID: gZQETQ4OQ6G28bhXQvIHdg==
X-CSE-MsgGUID: Lw70nATURH2edn81WRobqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225297266"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:35 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 3/5] intel-ci: Add VGA chamelium exclusion to Xe blocklist
Date: Thu, 12 Mar 2026 20:52:31 +0530
Message-ID: <20260312152233.3280893-4-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260312152233.3280893-1-mohammed.bilal@intel.com>
References: <20260312152233.3280893-1-mohammed.bilal@intel.com>
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

Remove VGA-related subtests from the Xe chamelium testlist as Xe
driver does not support VGA connector types.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index edc5039a9..80a0ee904 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -128,3 +128,7 @@ igt@xe_exec_compute_mode@non-blocking
 ##################################################################
 igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
 ##################################################################
+# Remove VGA-related subtests from the Xe chamelium testlist as Xe
+# driver does not support VGA connector types.
+##################################################################
+igt@kms_chamelium.*@.*vga.*
-- 
2.48.1

