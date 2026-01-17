Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBCCC98330
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 18:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510F710E170;
	Sat, 17 Jan 2026 18:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TA6yP8nN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E555510E0F3
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 18:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768675379; x=1800211379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sQT/LmcD33asl8K+tI2UlPMg1cW8EquNv9Ig3uQyaXg=;
 b=TA6yP8nNOiH6r/Bj7klPGzNpUrtvLBnN1RR5YFbTS6VncgAUMlhDH9dp
 7FFch0u72TvPVrZhmIJWb1TGbguDQP2IRUTU5p2tHkP3DvJf7Pk/vtiiW
 j4GGdzhjiqhCw9EP6uI2qpVmHLzXTFdwJua2EEfKTxp1GsOmhxyN8Yttn
 HudpyCubz0rcPiySqOz+13l9LM8uJC7ZAAdgmucv8qWbEZl9PTeMVqeX/
 dY9EflYHV7D5Z6DJ3WLMd/k7xZi7pzo+U6FYlMvOO/Q6GUjis1JgMc6nq
 HxEQ8VRJ54+NX0kcuqs14EUjZHlQ+Bdz37wI8ip4nCc3hzbZIGq36RZTT g==;
X-CSE-ConnectionGUID: JpCfzxzrQaaRP1Np8SAplg==
X-CSE-MsgGUID: BYni+yl4RRemHmmjLKWFRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73584966"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; d="scan'208";a="73584966"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 10:42:58 -0800
X-CSE-ConnectionGUID: L7S5vzZGTc+APZEPRGLBqw==
X-CSE-MsgGUID: e0seRQUdQ2SL6BrmN651Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; d="scan'208";a="210374209"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 10:42:57 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/3] Improve pixel-format tests
Date: Sun, 18 Jan 2026 00:13:45 +0530
Message-ID: <20260117184348.38163-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Refines modifier-based pixel‑format testing and reduces unnecessary
work during simulation runs.

Naladala Ramanaidu (3):
  tests/kms_plane: Split pixel‑format validation into modifier specific
  tests/kms_plane: Speed up simulation by limiting YUV range tests
  HAX patch do not merge

 tests/intel-ci/i915.fast-feedback.testlist | 207 +++-----------
 tests/intel-ci/xe.fast-feedback.testlist   | 314 +++------------------
 tests/kms_plane.c                          |  93 +++++-
 3 files changed, 154 insertions(+), 460 deletions(-)

-- 
2.43.0

