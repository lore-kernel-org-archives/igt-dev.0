Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFEEC88E45
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 07:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD0310E371;
	Fri, 11 Sep 2026 07:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4IEcoWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF0B10E39C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 07:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789110871; x=1820646871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tfY/5OkG60SgqAXiWCcm1jf+VqLoidPRbW0fWEWMpb0=;
 b=O4IEcoWB8QLb2RBOlbBu72UNlDryz4z8b/HeSY8+AO9NWOzGR4DRsqXh
 sLvdfHq/yDlwOeipBA0ROCjAGm1W9tewBz+tBjjY/9kURdIuZawUXP2aE
 ESas+YJpI+WF/ABv1AcVTccSmr93y1qcSnRmlvxKsu+h6huvoNRXmbcuX
 6ho8Q7U1BO0SCh7ofkN9xEpp6q79G36mFKnq8s3V2zGxwZ6R1192mP/6Q
 217K7jxprTNQexz3FoXUKtKS0Wy6TfKVOltGuqHornsaVQQEuEPJNha3o
 d5LL/zo/4oDMm5J+qXDj8pm2YYN0cQKIEBkGejlWS1usnLu46bagRJKgP A==;
X-CSE-ConnectionGUID: 4dNUs3z3QGaVQvLJeh4sNQ==
X-CSE-MsgGUID: Rh1/ly4PSk6DQxcisCIb5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115112150"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="115112150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 00:14:30 -0700
X-CSE-ConnectionGUID: GDv38dsERk6bpIFY6XcQiw==
X-CSE-MsgGUID: l7Avfqz6RUeaVQJ9Ey7K9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275989691"
Received: from dut1231bmgfrd.igk.intel.com ([10.211.177.56])
 by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 00:14:29 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v6 3/3] intel-ci: add xe_pm sysfs coverage subtests
Date: Fri, 11 Sep 2026 07:13:33 +0000
Message-ID: <20260911071409.56112-4-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911071409.56112-1-shivtej.eknath.patil@intel.com>
References: <20260911071409.56112-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Add the newly introduced xe_pm sysfs coverage subtests
to xe.pm.d3cold.testlist so they are executed by CI.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel-ci/xe.pm.d3cold.testlist | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
index 783859fc7..e240fe7fb 100644
--- a/tests/intel-ci/xe.pm.d3cold.testlist
+++ b/tests/intel-ci/xe.pm.d3cold.testlist
@@ -9,3 +9,9 @@ igt@xe_pm@d3cold-mmap-system
 igt@xe_pm@d3cold-mmap-vram
 igt@xe_pm@d3cold-mocs
 igt@xe_pm@vram-d3cold-threshold
+igt@xe_pm@vram-d3cold-threshold-show
+igt@xe_pm@vram-d3cold-threshold-store
+igt@xe_pm@lb-fan-control-version-show
+igt@xe_pm@lb-voltage-regulator-version-show
+igt@xe_pm@auto-link-downgrade-capable-show
+igt@xe_pm@auto-link-downgrade-status-show
-- 
2.43.0

