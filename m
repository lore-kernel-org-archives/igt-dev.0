Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C68C19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 12:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5F110EAD3;
	Thu, 27 Feb 2025 12:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDV/ib30";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E82210EAC4
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 12:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740658501; x=1772194501;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b4du0KwK/dJNPcQrvxeu0G5A9P7qYlwz5dHAvAbLYII=;
 b=LDV/ib30tPLseuZpPPh645qbefQtE5BJvUSgP461KjxIGTHJBlMYVBN8
 ZhCUKXTxldfy1OrcquKzHQB3xjV4KnFrHynNeR4ien9w03heG0Ng0wX+h
 LQAfKHo5MDlntnUwxYRzNJPr0MKXNLxx7Q8SYv26nOeBkGodPoMna/tbu
 EOl3PyHAqYOC6TilBxkA4qHzbn/z9SyosgAmo6U33p6Gj7oaCfmCnG160
 GT2whS9e41jXgSF3yOhssEckjUO2Jnux5nY3w0hfWpQKmFd9rZbHluN2/
 4y2ZCoMivLTGNn3ZJeAoB0XUHEunY9JkAU0+IextqDGAbA2I+A/tnQ11F g==;
X-CSE-ConnectionGUID: gXmPyGjESzeYC2UWAqy8Ww==
X-CSE-MsgGUID: mqux0WZkQmuSH/vzipv25Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59078809"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="59078809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 04:14:58 -0800
X-CSE-ConnectionGUID: u2k3Ky4CQtGQDo8sUUlsUw==
X-CSE-MsgGUID: zGVyCbMbRUyitn7q2EAlBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="140231083"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 04:14:57 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] fixes for test kms_dp_link_training
Date: Thu, 27 Feb 2025 18:00:37 +0530
Message-Id: <20250227123039.2933330-1-kunal1.joshi@intel.com>
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

Couple of fixes for tests/intel/kms_dp_link_training to fix
commit 983ffca5ff96fd67c937691337f4488e28948aa7

Kunal Joshi (2):
  tests/intel/kms_dp_link_training: do modeset before retrainig
  tests/intel/kms_dp_link_training: fix assert for
    igt_find_all_mst_output_in_topology

 tests/intel/kms_dp_link_training.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.25.1

