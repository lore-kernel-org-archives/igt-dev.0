Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2741BC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 09:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FD210E584;
	Mon, 20 May 2024 09:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yeaxwn8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A638110E558
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716197729; x=1747733729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NqkGmsgSj31qQllnIF/4rvWWPL+ltXO1WvOpvX3eavo=;
 b=Yeaxwn8shje9wN32IzTkhkqIUQ04LIivKp3LyX0bcSOJ2uU8GCK94Fkx
 wOqdO7WMMgGLvztfvZoq+G1bZ00NulAwiEtV9SEcOkjoykAvPp0RvuNK7
 idX4tANF9k/ykNzRtrMEgpl/mSGPPjsuQqy1s8vZp/kG48m9HfifjE8UD
 BkTch7KDgMRzZSK7GPkpgHDkvhUu0sT+1FQwpqU1g41l9L0Y5QhqABVM3
 soFtwVHiRsx2pRKzWxABBlJ07LQTg0zSxxDil01kWvfvAT44mF8WNmfZZ
 Eqnd7ceDBCvEpDd2UVQBMrnNtDwbPIjBtP0B+UrFdEUWVjHYTojLc4R59 A==;
X-CSE-ConnectionGUID: UgX6oohGQsWV2vxLlX724g==
X-CSE-MsgGUID: NLFa3FJDT2aid8eTmvjdRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="23729025"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="23729025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:35:28 -0700
X-CSE-ConnectionGUID: XAW1eoqRRDmE55WEOosnlw==
X-CSE-MsgGUID: yoNGW11hRWK0fpeFsePsHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32333447"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 02:35:26 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] Early Transport Support
Date: Mon, 20 May 2024 15:16:18 +0530
Message-Id: <20240520094620.3713972-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add early trasport helper and checks to validate early trasport support
on the supported display.

Jeevan B (2):
  lib/igt_psr: Added library functions for early trasport
  tests/intel/kms_psr2_sf: Add checks for early transport

 lib/igt_psr.c             | 13 +++++++++++++
 lib/igt_psr.h             |  2 ++
 tests/intel/kms_psr2_sf.c |  3 +++
 3 files changed, 18 insertions(+)

-- 
2.25.1

