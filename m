Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3432CC79FB7
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 18:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE0810E186;
	Mon,  5 Jan 2026 18:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYI6o0w+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5982910E186
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 18:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767637185; x=1799173185;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sE2cunr5w7ez4Azwxvxq0O/MP4pyI3CkP+0ZyJW017c=;
 b=nYI6o0w+Eh+MxMwAuS9qP8n+NpthH8MEAIvZY1zQkB3SnFRZoFsw7mni
 N0ZZGFIOtVl3BqrbMsFNMMwxhhWB6zpIg/zdWK1HpS4qvejI41MzDbGrs
 xp9heWQIfHEcF8ZzxINs4vZmt13ARXbFKmsMEtCU/fCotj9fuFIM9f3B4
 qo8JwysEYmus9ebGQ+/YRFasz/DqIhRQ/RVrps2rhspGfLI/ZJW1TC1LU
 x8pJBtOdPZgEGVaUSfsUlO3QjNfYzyPr8cVELoQg0IUWpKP2Yrsi447BG
 Gj2Ps6a0r6L0gYTLFoowFFsqrhOlIQ6jBmtR1yDwzok6yMCfJh7bXb3xo Q==;
X-CSE-ConnectionGUID: eLoZz5Y3TFmisTBGwzC03g==
X-CSE-MsgGUID: Q54eQW7DTHCUBQge5iSlfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="91658688"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="91658688"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:19:44 -0800
X-CSE-ConnectionGUID: 3kJ9lPxTQEGNaeYBgjZgzQ==
X-CSE-MsgGUID: v9g10WHrRVab2WGKoOaY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="225996197"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2026 10:19:44 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH] lib/intel_pat: include fcntl.h for O_RDONLY
Date: Mon,  5 Jan 2026 18:19:32 +0000
Message-ID: <20260105181936.231376-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add the missing include to make builds reliable across
environments (e.g. container/CI builds).

Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines/1577836

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_pat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 127f2160a..9815efc18 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <fcntl.h>
 #include "igt.h"
 #include "intel_pat.h"
 
-- 
2.43.0

