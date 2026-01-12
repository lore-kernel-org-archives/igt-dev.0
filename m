Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA9CCF45AC
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 16:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0A310E424;
	Mon, 12 Jan 2026 16:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVGH8nUo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C080710E424
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 16:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768236617; x=1799772617;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2tpo9vK6Srg7ShW2MSVx3YzXK0cL9OksVQmHgYAkhm0=;
 b=JVGH8nUocazndZgJHvhAynH8Xep30DYpc4IUWKZEP6OFclAz4pas0WL+
 jcplDAlkYq2TyYbXlZ+k/i7KzuiKTUjLgQSJsZH4xOJxs5V3Zn+/HTtO2
 oOvmWty7CbNIM5zDUoUA0V5OGGlT8cUPSDKOpdCzvR+u6aVPkkrDRYKb3
 Jwc7kglYEQHQ2F5Pdkj+JZtxb1Nq1yaeo1IqECSjjnDMAtPo2viET6riX
 a433khCpVWTkSdkSwr9cFMPpOyEB03Yxarkg3PspT7X+39N5CVXqRvfqd
 WMPYTglOEJrfqj4KNXrLq+8z5K+947U9TwwZJs1CNb4eCHLRqpWWgkRhS g==;
X-CSE-ConnectionGUID: 9whYS9h+TtughSI5nG+cnQ==
X-CSE-MsgGUID: 4SzoU8ViQE6wabV9ycoftg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80155147"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80155147"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 08:50:16 -0800
X-CSE-ConnectionGUID: C3mxb8gaQkW+60BNulNRWQ==
X-CSE-MsgGUID: XHWRhsluSxO+hYh5GZactw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="203772977"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.57])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 08:50:14 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Mateusz Grabski <mateusz.grabski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>,
 Piotr Kira <piotr.kira@intel.com>
Subject: [PATCH i-g-t v1 0/2] RFC: cut successful dmesg logs
Date: Mon, 12 Jan 2026 17:50:04 +0100
Message-ID: <20260112165006.237964-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Lets reduce dmesg logs in a success case. This should work fine
for cases when CI will collect dmesg outside of igt run, or with
proposed change to compress them (so the dmesg will not be lost).

Here is a run on trybot:
https://patchwork.freedesktop.org/series/159961/

For example one warning from it:
https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_998/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

and here one dmesg reduced from 64KB to 16KB:
https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_998/bat-apl-1/igt@gem_exec_parallel@engines@fds.html

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Mateusz Grabski <mateusz.grabski@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Ryszard Knop <rk@dragonic.eu>
Cc: Piotr Kira <piotr.kira@intel.com>

Kamil Konieczny (2):
  runner/settings: Add new option --reduce-dmesg
  runner: implement dmesg reduction for successful case

 runner/resultgen.c | 98 ++++++++++++++++++++++++++++++++++++++++------
 runner/settings.c  | 36 +++++++++++++++++
 runner/settings.h  |  1 +
 3 files changed, 123 insertions(+), 12 deletions(-)

-- 
2.52.0

