Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7FBCCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 11:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3421F10E102;
	Tue,  4 Nov 2025 11:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQ3c1lSY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A8A10E102
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 11:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762257286; x=1793793286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4RB06k0KvxrFSzKuiR/tpDaPUeC8vOJk2U+ntymQgP4=;
 b=iQ3c1lSYQS4phdNc9bfhItE04mTHnBN0JXYRt55Qz0+vJIjSsfinfrAq
 eAmtiuke2zHGa41b2wMA3TLKkMGXJgcxn2n2mNtbqak/VCtfSvfKPJlQO
 gnhKN4lM/7zWVind3Nn9E6gF0JWuNsz2Y6yHyXnlr4Jq4ObXzP/O1AOU+
 7t9+Zm5KCDZ7uAPF+XjqA3lAoeXptQVP+rIH74uYVNL9/WvWdOeVh/YDK
 drrwZaM//tPu8LrbNSx7VSe6AeZ3yDR7KQIJx4iIJ/1l0cneW/y1d+zJd
 HSVWSCRVsCKTmmlbpqBvjoD8wcFL786wjXJ5ikkzJ6Z69ZsOOjTCy2ycf g==;
X-CSE-ConnectionGUID: qitd6NOTQROSnljh3B5BoQ==
X-CSE-MsgGUID: uwJjOCO3RKq0LZxV/5cHmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75459869"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75459869"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:54:46 -0800
X-CSE-ConnectionGUID: 5MtFVEwMRTerJp2WAD/fRQ==
X-CSE-MsgGUID: Hy951UZgROOUprND5xVuNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="217782750"
Received: from rvuia-mobl.ger.corp.intel.com (HELO dpiatkow-mobl1.mshome.net)
 ([10.245.245.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:54:45 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/1] tests/xe_exec_sip_eudebug: Band-aid
 breakpoint-waitsip(-heavy)
Date: Tue,  4 Nov 2025 12:54:17 +0100
Message-Id: <20251104115418.11917-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Both breakpoint-waitsip and breakpoint-waitsip-heavy are expected to trigger
a reset, but the reset is asynchronous and can overlap with test starting on
next engine.  Mitigate it by adding an arbitrary sleep until a proper
solution is in place.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  tests/xe_exec_sip_eudebug: Band-aid breakpoint-waitsip(-heavy)

 tests/intel/xe_exec_sip_eudebug.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.34.1

