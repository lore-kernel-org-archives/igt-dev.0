Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CDBEB7EB5
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 10:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6AC10E9A0;
	Wed,  4 Mar 2026 10:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAZfo5rq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE96410E9A0
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 10:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772618922; x=1804154922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4BMyBMUHAKChpZlNxfh0rwvCLh5eLqYElkwZOpZcChU=;
 b=UAZfo5rqicPohEg+LLBlebaszvjJUBlcE6Y9wuiuGqAUvvFSYaplSdFt
 9b1MNwlHNNN13UZR2ZmmE72fWHWhFl92ax5slS3RMMc+IfLwppXt6Kr2c
 UkfN+oDmQl3di3R76P4hJAD6MGmxcMAkj94AHOPEBWdl8pS7XUJaa4UFF
 52QlxeMytWiaj2B+KZhVQ87BolY1PvYYB6VXdOgxibIc1zt6pghjWynof
 B9YJNmOAD5EWVVcAfvQPHzLIoV4s6kkRup1CPtP1wGBc4xzlIexTQ4sf3
 IiUd+1egE3w4GxFjt/o5EOR7LO5JGiZFCDpOi5E9sSuC1p4hqfbY+UgQ3 g==;
X-CSE-ConnectionGUID: pxrxzDUySdSPGCLb2/G2vg==
X-CSE-MsgGUID: 8IL9GAQfRLevu7w3yTIxCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96286679"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="96286679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:08:41 -0800
X-CSE-ConnectionGUID: UazV1y+yR/apeVxiDFdyjQ==
X-CSE-MsgGUID: dKd36P2WQNeb9VQ/SC84xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="215263315"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:08:39 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 0/2] tests/chamelium/audio: Fix resource leaks in audio
 tests
Date: Wed,  4 Mar 2026 15:35:51 +0530
Message-ID: <20260304100553.3075443-1-mohammed.bilal@intel.com>
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
cleanup sequence.

Mohammed Bilal (2):
  tests/chamelium/audio: Fix ALSA handle leak on skipped audio config
  tests/chamelium/audio: Fix resource leaks on assertion failure

 tests/chamelium/kms_chamelium_audio.c | 47 ++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 11 deletions(-)

-- 
2.48.1

