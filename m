Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB274CA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 08:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543E710E24F;
	Fri, 15 Aug 2025 08:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9iieJ4x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBC210E24F
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 08:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755245103; x=1786781103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NH1oOWoys6GNVUudIe+2w848SRx/+3n8pqjOHs6j4js=;
 b=V9iieJ4xVp1iJuEUY5/hblAXoSTNCcpmAhGqAIgogGPcoLF3FlnW+rsJ
 9GNb/IyALFAgfE23+NE311vIp6Z+A3oGQTaB0djHmoAl6z3Im0mLBbcPg
 4l1+YN3U32vzD6aVeybL6OCLjXt6hAyRk3m+VezF9rtB9EEyXd70Rx1sS
 bDnTrWc/BLVcAJvceY42Ez1Dkd1Y8uc3VzOfp447JKLIdeJz50YZ1vko3
 erw/D3M4n9LLNCcVsUSmEC5s0kQE1qnOfCHeTo2KBCRom4G10SaZy9NQf
 ou+nLI5V0rAQZRMKb77Rk6G6wXRk7GQ+HIsAGJskNv3ld0T1HwSd0rIDZ A==;
X-CSE-ConnectionGUID: MMTZslgXRqGxG99WS9MA7A==
X-CSE-MsgGUID: q+5HhrzARMyKkVDSFFAgjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57494978"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57494978"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 01:05:03 -0700
X-CSE-ConnectionGUID: eql9+QGQQsCudThO1gruLw==
X-CSE-MsgGUID: 4I2aPqrzRdGor6XFkzAIug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="166882063"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 01:05:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [RESEND i-g-t 0/5] tools/intel_vbt_decode: more updates to VBT
 definitions
Date: Fri, 15 Aug 2025 11:04:50 +0300
Message-ID: <cover.1755245038.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Bring in the kernel intel_dsi_vbt_defs.h instead of having a locally
maintained duplicate with almost but not quite the same contents.

Resend due to issues with [1].

[1] https://lore.kernel.org/r/cover.1755175663.git.jani.nikula@intel.com

Jani Nikula (5):
  tools/intel_vbt_decode: Split up DSI VBT defs to a separate file
  tools/intel_vbt_decode: Remove intel_bios.h
  tools/intel_vbt_decode: Add anonymous structs to group DSI VBT defs
  tools/intel_vbt_decode: Flip bta_enabled to bta_disable
  tools/intel_vbt_decode: Add missing DSI VBT defs

 tools/intel_bios.h         | 200 -------------------------------------
 tools/intel_dsi_vbt_defs.h | 197 ++++++++++++++++++++++++++++++++++++
 tools/intel_vbt_decode.c   |  40 +++++---
 tools/intel_vbt_defs.h     |   2 +-
 4 files changed, 223 insertions(+), 216 deletions(-)
 delete mode 100644 tools/intel_bios.h
 create mode 100644 tools/intel_dsi_vbt_defs.h

-- 
2.47.2

