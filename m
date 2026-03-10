Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899D3FCC9DB
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 09:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C07310E223;
	Tue, 10 Mar 2026 09:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="asP1DbD7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4B010E223
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773134560; x=1804670560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c/zXfvT4RJUIPWF5wVYhFeE3opnbsxjwVA3UdKRCn2E=;
 b=asP1DbD7PL2RhUpSxnSg/zEqFHWpMKvja2b8+TxsfAFXzWcxAx0pZtqN
 HESnganMtBDtu9NIqhhAH8b3zu7jMVsrVAZj2AnMpTUDP55gdkWwBwuPh
 voVpWKOYmY0PDVNzmAVT/vi0NzV1G77fGJjZQ318ka4YGS4NZte4UHZVK
 d0Gr3lv1WIQ9ibIpgEa1dXiFCdmgCA2uTG9+CdrDhaA1pP6Kbk6PLH1nU
 /syYE+QmrWBayOCtqvH0Lq3Lx7eMmnMdR6pPpIi3T/9ma8td1FjSHlk4W
 9iFAQY79WfkPEMDbDcOFIwvfM+5ycMMQp3vk3ucvg1d9y6OW2ZWS1T6MH A==;
X-CSE-ConnectionGUID: aan1Kq6qQjy9EbL509NXRA==
X-CSE-MsgGUID: 7HQfjrzPS2SoDqZm2KiVuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84885565"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84885565"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:22:39 -0700
X-CSE-ConnectionGUID: zWdC3mSrSBKWj+K2ARSEVg==
X-CSE-MsgGUID: c52sSYxXS7aZTnfzU9BhNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224511047"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:22:38 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v3 0/2] tests/chamelium/audio: Fix resource leaks in audio
 tests
Date: Tue, 10 Mar 2026 14:49:54 +0530
Message-ID: <20260310091956.3171295-1-mohammed.bilal@intel.com>
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

v2:
-Refactor check condition (Sebastien)

v3:
-Update assert logic (Jeevan)

Mohammed Bilal (2):
  tests/chamelium/audio: Fix ALSA handle leak on skipped audio config
  tests/chamelium/audio: Fix resource leaks on assertion failure

 tests/chamelium/kms_chamelium_audio.c | 55 ++++++++++++++++++---------
 1 file changed, 38 insertions(+), 17 deletions(-)

-- 
2.48.1

