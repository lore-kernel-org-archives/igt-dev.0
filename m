Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0606F46455
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992DA10E4D7;
	Mon, 16 Mar 2026 11:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2nFQ9qm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE3710E3CC
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773661808; x=1805197808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h4gdQWNG9nsv3fNdE68blJesJFEmvyC3BJ83OHS/opA=;
 b=Y2nFQ9qmuRYj2hucRGH20u2PqdHRjTtZuVIgQPlAT3m0YDe9gFpWOWwZ
 LKZM3W6qagb+KfLOBfK3I9NfDRUmq2hPqQ4yJkZFICjfJvx6URmKkP4uB
 vSle/NHyjBT3oMa9BSWm03Vt4g3HhbO2W7NBow+tuyQLgZnt7V6LM87h4
 oPZ1NR3sHNTLJVRvmns5BqGtHVlYbhU5wHydDUu+16EVsFxpqTlmqwa9Z
 iKEfPdTqm4s6CT/1t9/VF6lNfnYujzCcBP5uoQ7I7VFDEDJXzZFRd+GqI
 GsCu6NTpkp8ap42rr8unS7g25ELt17lE2FP1l5TE29LzIH851Vy/xE2+W Q==;
X-CSE-ConnectionGUID: 1MmNOoDSRGapH9/R41rqpg==
X-CSE-MsgGUID: xiwtd88/QlCsah8pVxeJ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74789872"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74789872"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:50:08 -0700
X-CSE-ConnectionGUID: i2e2Uvk6Rqe2QYBQx+Uq6A==
X-CSE-MsgGUID: YClZL618Q8uzOzQA7IC81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226351313"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:50:04 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v4 0/2] tests/chamelium/audio: Fix resource leaks in audio
 tests
Date: Mon, 16 Mar 2026 17:17:06 +0530
Message-ID: <20260316114708.3342278-1-mohammed.bilal@intel.com>
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

This series fixes resource leaks in Chamelium audio tests.

It resolves a handle leak in the audio test loop when the audio
configuration check fails and the loop continues without cleanup.

It also ensures proper cleanup when assertion failures occur after
resources are acquired by routing error paths through a common
cleanup sequence. Exit early on first failure to avoid testing 
remaining combinations unnecessarily.

v2:
-Refactor check condition (Sebastien)

v3:
-Update assert logic (Jeevan)

v4:
-Fix memory leak logic and update commit message (Sebastien)

Mohammed Bilal (2):
  tests/chamelium/audio: Fix ALSA handle leak on skipped audio config
  tests/chamelium/audio: Fix resource leaks on assertion failure

 tests/chamelium/kms_chamelium_audio.c | 60 ++++++++++++++++++---------
 1 file changed, 40 insertions(+), 20 deletions(-)

-- 
2.48.1

