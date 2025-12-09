Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D548D3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 15:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D1410E1EA;
	Tue,  9 Dec 2025 15:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJ7VXeTy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A3510E1E2
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765293918; x=1796829918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EJ40Vr1Jfok04A5jUPuQBBvRcSASO34c2X5EtwjJWrk=;
 b=LJ7VXeTyMzdt5TIXkRL+cYgXckLkHnAwxa07jspcU5U6qyxxPoVjTzvF
 xEHkuQhOwCQ8UUWRZ4usuE+Yw+7hYfSozb+n9ng0JChcipr45SmQfW478
 2rBSQ2AMe/vwYQ9ntDkoFUD/FRAsguA6NH5V3UBV8HKXk7hWG553mhyT4
 vJEY2W3JmBqURZid/WeexLWfGcd2o612Qmu+6tlrNTAOnokHWoQZNQAIv
 QtjgCtYIzamiZxQ1AVWO2pyEGSKPh87+bSoA65TpG+B2FbLyr5mQD+Ki+
 90N0NVntsEvr/WTAVaX1nrBOlwAuN5q28DgwyAgflDrIcxmXMfhcl3zHC w==;
X-CSE-ConnectionGUID: E1M62mAWTual3eAqXW45bA==
X-CSE-MsgGUID: dGBP7MCER2WbM7Q6hEWDew==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78718589"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="78718589"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 07:25:17 -0800
X-CSE-ConnectionGUID: Sqwy9AOeSsijvJpOhQmneg==
X-CSE-MsgGUID: ddftPlSUSFOfLtUztgzvMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="197027754"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa010.fm.intel.com with ESMTP; 09 Dec 2025 07:25:16 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v3 0/2] Fix chamelium port allocation during igt_fixture
Date: Tue,  9 Dec 2025 20:53:57 +0530
Message-ID: <20251209152359.907648-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

The current fixture implementation executes even for unrelated subtests,
causing false failures when expected inputs were not present.
Refactor the DP/HDMI/VGA hotplug tests to use a common
connector lookup pattern so that each test skips cleanly.

v3:
- Introduce a unified connector test macro (Sebastien)
- Remove unused variable (Sebastien)
- Drop per-connector fixture usage (Sebastien)
- Refactor DP/HDMI/VGA hotplug tests (Sebastien)

Mohammed Bilal (2):
  lib/igt_chamelium: add get_port() helper and CONNECTOR_TEST macro
  tests/chamelium/kms_chamelium_hpd: use helper function for connector
    lookup in DP/HDMI/VGA tests

 lib/igt_chamelium.c                 |  10 ++
 lib/igt_chamelium.h                 |  18 +++
 tests/chamelium/kms_chamelium_hpd.c | 240 +++++++++++-----------------
 3 files changed, 125 insertions(+), 143 deletions(-)

-- 
2.48.1

