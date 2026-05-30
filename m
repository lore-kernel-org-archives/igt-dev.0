Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEFFCD5BD0
	for <igt-dev@archiver.kernel.org>; Sat, 30 May 2026 18:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5DB11295D;
	Sat, 30 May 2026 18:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxP7yaL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B61E11295D
 for <igt-dev@lists.freedesktop.org>; Sat, 30 May 2026 18:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780164468; x=1811700468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YekJ/xPA6ZZ/t8MveIzbt/+P8+S/nfmUQsqEa7FDj+M=;
 b=UxP7yaL+W5B63hNuGPESf3M4cCM9Ah/xBbQ8Oa9YbvhgFZ4uAqDfC7JS
 GRlud1CCbXHg2SNp+FRwb26p8IkETSf0zSVU8FP/v+KEb0gweD+BVUh99
 qkhwpX9RSXxUppjonAvSiHcdsCdI6QqGvwefmQz61iYXk/mcQM0PawaeB
 nmBDtRfd5lI3RRgt7dcdOG2oCCkPBGSJhtyFPT3QlGUQlYfD5ZxzXIi02
 OUVgmaf5Sd2i/edytJNUR2RqDQaxbpKD62gNgL1aBt7PucO7XXO7t4eJA
 wvkmxHxuyWvBwvZzWu2nTTzeYx7bE1h3wzyttDEB1wJ5Mpzzz7ym6WQAk A==;
X-CSE-ConnectionGUID: 5fbZBCUTSw61qnmw0MNMZQ==
X-CSE-MsgGUID: IQXHI68TTiKEZrOwnGVnZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="92099541"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; d="scan'208";a="92099541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2026 11:07:47 -0700
X-CSE-ConnectionGUID: QWl5ZtGySAW4l0Awbs95ow==
X-CSE-MsgGUID: vzCkmcIdS4qo6Kw7gPz3mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; d="scan'208";a="242341858"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2026 11:07:46 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] tests/intel/xe_eudebug: Add basic-vm-bind-ufence-no-ack
 test
Date: Sat, 30 May 2026 20:05:01 +0200
Message-ID: <20260530180502.1773222-1-jan.maslak@intel.com>
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

v2:
 - Add more synchronization stages to remove the possibility of the test
   being racy.

Jan Maslak (1):
  tests/intel/xe_eudebug: Add basic-vm-bind-ufence-no-ack test

 tests/intel/xe_eudebug.c | 150 +++++++++++++++++++++++++++++++++------
 1 file changed, 130 insertions(+), 20 deletions(-)

-- 
2.43.0

