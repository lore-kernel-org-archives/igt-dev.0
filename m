Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92891C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED0B10E7CE;
	Mon, 29 Jun 2026 09:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGqUcVPK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD4310E7CE
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782724566; x=1814260566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kL1FmNXl43Y+kscTtFnh5MRGf5dK10nAGugZptbVP28=;
 b=oGqUcVPKdQgj38chXz5F3jxldbtfxYMUX4OIUftaOlpbOr61h4PxFjGj
 ai77igFdRDcLz36aMFYpGo0Trb7Muv2TVFQYP1pl6aQaLpBEjd3HmV7U7
 0HpwtYp1MBbKjW0Thk4Kpr9pcZWBbkedeA/xxLAS+H+79ntx8xAJJUari
 /6dBb0romy7ZcuAJU+JEUpIzaR/+UZiJP94v5OkhlwEiE9r1+HJXbQb4E
 DxiK0GD9ecfdmbi2FZN47sLiMkhr070OEc6bf9J0mHgscC1zGM2JycFlW
 I5/RLwTjA3Wvc2iKUeDzS4CJYKULNJoqOchsUlXdU+kLV7GRQLEYkRmM5 A==;
X-CSE-ConnectionGUID: qBy/bipNSRmr2gMZoijRQw==
X-CSE-MsgGUID: /Wfh7huZRUK7Acy1ILZBqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94894161"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94894161"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:16:05 -0700
X-CSE-ConnectionGUID: xlilTQyJTJq24gEZ56V4pg==
X-CSE-MsgGUID: jb4Qf1GaRTKuIPvKRsYdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="247451957"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 02:16:04 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 0/2] frontbuffer_tracking: prep for limiting suspend
Date: Mon, 29 Jun 2026 11:15:57 +0200
Message-ID: <20260629091559.2706720-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Preliminary series for limiting # of executed suspend tests, but applied
to kms_frontbuffer_tracking.

Other series:
 * kms_ccs, v1: [1];
 * kms_sharpness_filter, v1: [2];
 * kms_pipe_crc_basic, v1: [3].

Series already merged:
 * kms_flip, v9: [4].

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260622225811.1703400-1-michal.grzelak@intel.com/
[2] https://lore.kernel.org/igt-dev/20260629090740.2706320-1-michal.grzelak@intel.com/
[3] https://lore.kernel.org/igt-dev/20260629091350.2706610-1-michal.grzelak@intel.com/
[4] https://lore.kernel.org/igt-dev/20260330075508.1003899-1-michal.grzelak@intel.com/


Michał Grzelak (2):
  tests/kms_frontbuffer_tracking: remove typos
  tests/kms_frontbuffer_tracking: iterate over suspend with `for`

 lib/igt_aux.c                          |  2 +-
 tests/intel/kms_frontbuffer_tracking.c | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.45.2

