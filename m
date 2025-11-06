Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040CFCCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 15:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852EF10E935;
	Thu,  6 Nov 2025 15:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CE+sZiRg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4990C10E935
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762443268; x=1793979268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MD6E2OvQd9z6Zi+ADmlmNZSdzLrgvcmBfsr5S2AhXlY=;
 b=CE+sZiRgHRDbGKQn74fIzNsL1H4RsoXPkoTzUMVF31ErLIaYuVD8XaRB
 3Ug8SCF+BiLt65sTk9/6lLnI/AMDdF5f8UIisYjbw/2xoCIZ0n2gUC+1h
 NjKIPzuTWTRYxOr64JUeMni4D4h3MGI9/ais3u1rZis2GwbW0yjB07FAH
 wQJoIw5kz+SWD84eQLQicvqHJizA7PhceFshVUfqIJJMeJzfk+nFiy+Pz
 C829O8//oC/EJjcY/7oR9DoIQlzGQ/kU5RXcXFVbFahcD6U1+acqFJk4W
 JwxRhgkiQDDx/gbqvnW4Maae1aeWE6tnxoMID7qh0QiqivAaNE9x+wD3N Q==;
X-CSE-ConnectionGUID: 2Nw5fxkFSGuc6mVLesi1Dg==
X-CSE-MsgGUID: lvh+vh12QPKH2V2o1uAmhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64677550"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64677550"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:34:28 -0800
X-CSE-ConnectionGUID: tNdTaHP2TlCSafUgcduXkg==
X-CSE-MsgGUID: iJZrg6hfQAaZGgyE25C3/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="191883162"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:34:26 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, balasubramani.vivekanandan@intel.com,
 kamil.konieczny@linux.intel.com, shekhar.chauhan@intel.com
Subject: [PATCH i-g-t v2 0/3] Introduce NVL-S and CRI platforms
Date: Thu,  6 Nov 2025 21:04:16 +0530
Message-ID: <20251106153419.1741989-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.51.1
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

This series adds the basic platform enabling patches for NVL-S and CRI.

Balasubramani Vivekanandan (2):
  lib: Add Crescent Island Support
  lib/intel_pat: Define pat indices for xe3p_xpc

Shekhar Chauhan (1):
  lib: Add NVL-S support

 lib/intel_chipset.h     |  6 +++++-
 lib/intel_device_info.c | 22 ++++++++++++++++++++++
 lib/intel_pat.c         |  8 ++++++--
 3 files changed, 33 insertions(+), 3 deletions(-)

-- 
2.51.1

