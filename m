Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D72C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 15:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7014110E166;
	Mon, 12 Aug 2024 15:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIuh9/IH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D3F10E166
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 15:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723477665; x=1755013665;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N3MNW8/D6NaZpB3lIdXGVPI77YFhUKxWT4SDPjxW4QU=;
 b=MIuh9/IHxsIdbfNjq8hbr+5kZrKOShKMPFutjCwkunEw+Hu02QUqZsiB
 WzEjvZvzMXyll7Yqgep7cTOwOOVHAkKpAa5ieUva1c3ejHqotpLQHnPyS
 3mZBB0a6NtWom+h25IVRREHObA6ZXp75Dgq7T1CI8t+QhITh5TNMj2ZXi
 8wI26vzObm51brx8Gb0ZTsurnZ+nVk9RoUAwyIoIU3Y160Tzs+DKYfcjk
 EbVRoSDVm8+Da8QcKpmaKWI+rEUOVkTP97ig5qsBLddnCCY6Aiv4Uzqfl
 O8L+lMKZvQqxh6fyeTf8lgzDtbrOmK6jM7TEeHoKHnpAemflKpijDQDeb w==;
X-CSE-ConnectionGUID: tBM3qlDsS0+JzYKunu85fQ==
X-CSE-MsgGUID: BKBgxe/nTdqufgU/EiOUqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32217779"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="32217779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 08:47:44 -0700
X-CSE-ConnectionGUID: HPRBzAqiSvaFrKpoLkoPFQ==
X-CSE-MsgGUID: Z8vPOB0HTNeTlnBKA/kYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="58250326"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 08:47:42 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t] lib/igt: Fix double include statement
Date: Mon, 12 Aug 2024 17:41:41 +0200
Message-ID: <20240812154139.54404-3-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

igt_core.h is included two times in the igt.h header. Fix the header so
that isn't the case anymore.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 lib/igt.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt.h b/lib/igt.h
index 7af3d10cb..58c39e098 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -28,7 +28,6 @@
 #include "i915_3d.h"
 #include "igt_aux.h"
 #include "igt_core.h"
-#include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_draw.h"
 #include "igt_dummyload.h"
-- 
2.34.1

