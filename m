Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE73ACAC5B5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFED10E721;
	Wed, 24 Sep 2025 12:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhNA/V3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C024310E724
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758717704; x=1790253704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eUh5vB6pkxdgD3ZxREvBZaY5buj1bZgCTXY+L1CcTXc=;
 b=jhNA/V3QUPXBnv3R8q8flByDJAQzRhariFqncKhv8eyylyGyrzIla7rf
 xNwgd2r7yk2FtogLt3q6et11Q41SJfZ6Ez//7qlsXhDjl/SjlBbD/YMe5
 RMdOZ/mjuFPlawEZGFjUxAgF2ccRrI4WEAiJL1DV08l6BfNqnIpP2p3bE
 DrXtLidBPT08UcrPk7+Trjhr0CTJCZguF2rhEf/ZIN2HGNkPHnBjWkZqZ
 e+cBn00w6l8hvTPxMUu3cunInTImm60BFgvpuYNaqdH9iTzDHD58m6Oqe
 5jmB7wVYjvtsZOXlV9zTxJr3Ano0u6fvyeFIK8SA4oZdJXEvi55JDDPFJ g==;
X-CSE-ConnectionGUID: NA0YlxjKToiwDy7laUYwbA==
X-CSE-MsgGUID: N28DHDEOT7eXaEmVxFc8Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61182088"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61182088"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:44 -0700
X-CSE-ConnectionGUID: hBiDSI2/Tde8fFCvabwIiw==
X-CSE-MsgGUID: P1n1IkKrTTC73/Fj8R8nMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177459877"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:42 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v5 i-g-t 1/6] lib/xe_eudebug: Fix safe_pipe_read
Date: Wed, 24 Sep 2025 14:41:18 +0200
Message-Id: <20250924124123.14792-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
References: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
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

In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
misleading, as the underlying error may be different. Do an early return
with -errno if the poll fails.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 667c31c6e..d29c82857 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -271,6 +271,8 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 		if (!ret) {
 			catch_child_failure();
 			t += interval_ms;
+		} else if (ret == -1) {
+			return -errno;
 		}
 	} while (!ret && t < timeout_ms);
 
-- 
2.34.1

