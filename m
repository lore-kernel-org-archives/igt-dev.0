Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C32C27C43
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 15:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E39A10ED01;
	Thu, 30 May 2024 15:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpQC3tBp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6552810ED01
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 15:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082773; x=1748618773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fA3/HfJBfsLHRzD95L45FZx+gNuA8WzZTArbIhIeFNo=;
 b=bpQC3tBpw1lzQyFvWqB8G6CYcvr6i7biy/dS1cLjSCcyudxqCl0Z+Ynf
 So2sd4bhRZKkjRr+ha9vbBZr4D+if7uJYFL+SIJ1pCc9zJvDw9atHVvDB
 Zw+f+5Jlbt9qT1oBcseI3AfOpyxhGarByNxsZwk9HQ9NZf3cg12XSz5Vo
 ohhZxGp2osdsjVb/YBRY7Tn3AqgzIoXPRgT+PGLM+E2+JiveyFehhLvDM
 LOEEa7x+4LkYkhnDsufvQL5gCPkArYdezzW3PgD5YrKzzzuNVX4Vps56V
 PjfUm2POwTZfc5QlJmfzdacG3C+TuXC1vpQFugwgeuomoWtspBpeiUta7 w==;
X-CSE-ConnectionGUID: 1FkxN3s1R6eLqzkytJkPwQ==
X-CSE-MsgGUID: /ZtJIa9xQjWPoDjv7pXsaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24697797"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24697797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:13 -0700
X-CSE-ConnectionGUID: iSZahncLTHqVN/AIqH/Srg==
X-CSE-MsgGUID: SYmVHZ0CQwS/AuRLPfOgDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36328180"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 0/5] tools/intel_vbt_decode: vbt defs update
Date: Thu, 30 May 2024 18:26:03 +0300
Message-Id: <cover.1717082630.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

Sync vbt defs from kernel. Split up by changes that require
intel_vbt_decode.c updates, and the rest squashed as much as
possible. Only minimal changes to reflect the vbt defs changes here.

BR,
Jani.

Jani Nikula (5):
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    d9981f36e4f3
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    7234f948b58b
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    6ac67ccf4c89
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    8e26690851f9
  tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
    cd6891f8e371

 tools/intel_vbt_decode.c | 136 ++++----
 tools/intel_vbt_defs.h   | 715 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 691 insertions(+), 160 deletions(-)

-- 
2.39.2

