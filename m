Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060ACC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 19:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B834C10E079;
	Fri, 14 Feb 2025 19:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SO/QIaLc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0684E10E079
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 19:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739559875; x=1771095875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aV3DbQ0LMw5nyYq/r1vPMJEjaOEw2QRU2jyu7+3i10k=;
 b=SO/QIaLcq14lzqx6tR7ASwHE2aHDyl3dkmfFOWEtEjIxxPvs+FRbKhsR
 ZZGZvqfkvcUQ/mdW1o5seEKZx5Xz0Jkk6EIgcIvP919swwt7WQ9SAxfmg
 Q6GezbaoFKX5mwL7ngU/bg6LIl1o3tUCAV6C56sRdcYdknqhWdOTzQcrg
 teOcRfKtLarLgPbOTjyNc+X+n4wXp5NOMH1ZQam1+1VJkK/U8zfHgFlWf
 Za8Eshg7T4xkZ5cLyE3fYDS1sw3esT9/j8K/fGKz4FOiXVlpM6i4XFjcR
 sh7l9bu6MaCA9T3G3ZKrtsyXdVK2zgq1R4vBULdL/Kd3x7M58E7U39QN5 w==;
X-CSE-ConnectionGUID: th0RWukUSruOV4i027q3Qg==
X-CSE-MsgGUID: Lrc9/EvlTnieOGDnz/N4lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="43970385"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="43970385"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 11:04:34 -0800
X-CSE-ConnectionGUID: qzXVhBCYTR2bjRVKMdXHlg==
X-CSE-MsgGUID: AvhvIE2KTOWO2bYJ0MYs2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="114167010"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.197])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 11:04:31 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canl?= <mcanal@igalia.com>,
 Petri Latvala <adrinael@adrinael.net>, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Mark Yacoub <markyacoub@chromium.org>,
 Helen Koike <helen.koike@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t 0/1] igt_runner: Bump network ping deadline to 40 seconds
Date: Fri, 14 Feb 2025 20:04:11 +0100
Message-ID: <20250214190416.145374-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

Commit ddfde25f16ba ("runner: Add support for aborting on
network failure") introduced a 20 second deadline for the DUTs
network to recover after a suspend/resume cycle.
It was introduced in 2019 and now our CI team wants this to
increase to 40 seconds.

Please reach out to mailing list with your nack if this will
make your CI malfunction, also feel free to forward this change
to your CI team.

v1: edited description and subject of original commit (Kamil)

Cc: Tvrtko Ursulin <tursulin@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Maíra Canl <mcanal@igalia.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Helen Koike <helen.koike@collabora.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: George Zhang <george.zhang@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Peter Senna Tschudin (1):
  runner: Bump network ping deadline to 40 seconds

 runner/executor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.48.1
