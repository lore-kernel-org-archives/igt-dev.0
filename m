Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B52D25932
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 04:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFD010E13F;
	Tue, 27 Jan 2026 04:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSHDPKxp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0211510E13F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 04:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769487134; x=1801023134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZBmxFBAasNq92f1ln3FUSW2E65C2wOtTiX5B1A0C9PA=;
 b=dSHDPKxpJyyaz6zf+nQZzWcnujDHne7i1XUlAu+oQ8amm3w4fwd4m9iB
 kTG8qNSDSc4C7BSlaUXdNTdO8yF9kyP2FcFtKuxid0bCDtTNeu6uw6+t/
 y3xtFLbjLUphHKsszMkAVXmQT7k7htxpFTkqTHe9H5T9RF+PfMfHEJ+DX
 0WWZNVeLp8GuCnvkA/A4OYidUJWMLKH9BSuovUQID+2kuX2IjzXnfgvnS
 YigC7He+/oCy5nODxpnTUS8AMh4ET0fMiqNiYLz5hQscCpJ6ouUGUzioR
 tvsUDEOSWuhGa+/KmD9HHhO6qVzlrSa1n7oZjlRe0N/lmJIQNY2YDLhGy Q==;
X-CSE-ConnectionGUID: MPF8lS+/Q+WcoawwivdZaw==
X-CSE-MsgGUID: u067oYwRQoSPtzoIz5Sr1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81783906"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81783906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:12:13 -0800
X-CSE-ConnectionGUID: Lv+ly2UuSuC5ixSkM95gWQ==
X-CSE-MsgGUID: ALZaAcnFT8CgV4uxQ3bN5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="212724465"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:12:11 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v7 0/9] Add writeback changes for intel-supported formats
Date: Tue, 27 Jan 2026 10:02:24 +0530
Message-ID: <20260127043233.254107-1-sowmiya.s@intel.com>
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

This series introduces validation for writeback functionality
across newly supported formats specific to Intel platforms.
existing functions with limited format support were retained
for compatibility. After validating new formats introduced by
the platform, additional format support was added to the
writeback test suite. Subtests leveraging common framebuffer
creation logic were consolidated and dynamic subtest generation
was implemented to efficiently handle format-specific variations.
Add negative test cases to validate format and mode.Refactored
existing test cases to improve efficiency.Add helper function
to get the default format.

 lib/igt_fb.c          |  39 +++++++-
 lib/igt_fb.h          |   1 +
 tests/kms_writeback.c | 210 +++++++++++++++++++++++++-----------------
 3 files changed, 161 insertions(+), 89 deletions(-)

-- 
2.43.0

