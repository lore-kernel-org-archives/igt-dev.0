Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F542C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 12:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E236810E207;
	Tue, 25 Jun 2024 12:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHSl2a11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C42010E207
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 12:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719318719; x=1750854719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8oBDEEFyFLmVgS8HdM8x8qkyYMxIRbfjmljEBEy9tvk=;
 b=kHSl2a117gQahZutMxnCkFG3cIOzlHKXZy2XQTiMOv16Wo8e3RTcdqX3
 AeIHm+chq+bO0l4769RC5HzmTY3ooimZc0MoPKZFNHisA/cd6jkvNwQIN
 G+S+a6NvQ0sgY68L08mtXiDgm/9jImOp+1oP5ojLcQcMIF1tRkXJAoUL5
 q9ugGQbcFv6FtD9hasSPvL9+zNx7Av9soeWw/ofWxuZgVO+Bv7LxwKNRQ
 dxu0aunydnYU74VHuPIYCmbFEScRXnjrekVK4+gYZRU830CIyHX/xp/Dn
 tqMvRp2X6nwRzQmvSP1owu4slCxgp5l/MAk8KAixfvui3X5yqJv6E2cfd g==;
X-CSE-ConnectionGUID: HB33yXSoTseopl4yS51q1w==
X-CSE-MsgGUID: 4PcbI/ebTOuDSNx9QfK/RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16158425"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16158425"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 05:31:59 -0700
X-CSE-ConnectionGUID: Io5nouZPQoCHriq98ZyDaA==
X-CSE-MsgGUID: 9f3xIW/aSxi/tehsMlvYNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="74399503"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.3])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 05:31:57 -0700
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 0/2] lib/gpu_cmds: Fix hardcoded buffer size
Date: Tue, 25 Jun 2024 14:31:40 +0200
Message-Id: <20240625123142.11550-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624113949.6846-1-dominik.karol.piatkowski@intel.com>
References: <20240624113949.6846-1-dominik.karol.piatkowski@intel.com>
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

This series enables buffers larger than one page to be successfully
submitted, allowing for large shader execution.
Based on the find by Dominik Grzegorzek.

v2: added ALIGN(), added typo fix in separate commit

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Dominik Karol Piatkowski (2):
  lib/gpu_cmds: Fix hardcoded buffer size
  lib/gpu_cmds: Typo fix

 lib/gpu_cmds.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.34.1

