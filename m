Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43B4C7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 19:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8121E10E28E;
	Mon, 23 Jun 2025 19:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDCwAvgt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B94E10E28E
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 19:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750705991; x=1782241991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sFLqmgkyIqyZOo0K9sYJ3BrZeOx3pIjyBzf9ghzaBtU=;
 b=WDCwAvgt6keVJJVDH1YNK4v7bMLigkEysERTbHX1yeT9M1lih9KjuxzV
 7mfJ7t6xa08LPr9jN7UQcsuy1GFaWBCJfKoARjkylRhh2a6Ry9IT6aWg6
 RFw7UIE1umtPPzd5fUUHC6Ic4MDj9eG0IxPYmrb4Gdsm76X0fNydXafEg
 EK59IKheLB5eyOgC7wCH4dqD0Oliy5NRuBA6ADflRDFmFFd31kKYlCUQ7
 WYuxSkZbr3fUGYm51rjWP9k078K+mgkmME6LWwYoIrtfs6vTthaEh7nXB
 O8ib3gch/QLt2n4oevjXQI86hJlDYy5DM5346SkJbbKN49ShmCRHonec+ Q==;
X-CSE-ConnectionGUID: Q/bS9N/dSO6J4aQ6H4SOfQ==
X-CSE-MsgGUID: wxtrccrwQtqCLRecDpHMRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52043590"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52043590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 12:13:11 -0700
X-CSE-ConnectionGUID: 99C4WPTYTxabPx8/49OFbg==
X-CSE-MsgGUID: XzzJKTVUQFyk+0kcXetDNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151168932"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.223.55.70])
 by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 12:13:09 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [RFC] [PATCH v1 0/2] Enable VRSR
Date: Tue, 24 Jun 2025 00:42:28 +0530
Message-Id: <20250623191230.66611-1-mohammed.thasleem@intel.com>
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

Enable VRAM Self Refresh.

Mohammed Thasleem (2):
  tests/intel/kms_pm_vrsr: Add test to check primary panel
  tests/intel/kms_pm_vrsr: Add test to validate VRAM Self Refresh

 tests/intel/kms_pm_vrsr.c | 624 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 625 insertions(+)
 create mode 100644 tests/intel/kms_pm_vrsr.c

-- 
2.25.1

