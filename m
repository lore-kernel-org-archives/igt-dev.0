Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4642CD64085
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 20:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F407610E291;
	Fri,  8 Nov 2024 20:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8iBISPL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9A710E291
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731097126; x=1762633126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xftHapnbtjpAKPpeDrIynx9ywKLo0EmI/kIohV73wMU=;
 b=S8iBISPL2/6u1o7hu1Z0YiKnHn1qfXnvfphDN4xPBWn8S4eYnXk/Jghb
 ORV8qbRz0SrkU2P7X3Cm0hJxMQ8D15MnKJJjNT/M39VNz1MJ0zk9iqWWo
 AKnx4oOeTBXqBmpxidGaBg0eFyy6zzi8VlGx/LPgbP6jbEj0aJZuT7Isq
 SBnMQBqyGcRW6nwJugXkgdMeF+GpA7Ww6OEWcLkrN0iNGXlJbKG247Feo
 +xp9degD52uFAzN2pUQZ83NMdB6g9tODHeqvbw7/VFQ3OVKf9XrfwaYvi
 geQWMxL9i8rwybs7AuyhFesw3LjZqp4R1iFFLCA1yfCnjE9R8u/oarPhq w==;
X-CSE-ConnectionGUID: 2VDyafEST3aVeFUdToA76w==
X-CSE-MsgGUID: fdVnKuvJQw2RX8mqTgHoUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30390939"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="30390939"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:18:46 -0800
X-CSE-ConnectionGUID: IfTw+VBdRZGBTH3Wjo2B4g==
X-CSE-MsgGUID: 9sSW1xdNQoON4kD1wnQZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85621317"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.135])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:18:45 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 0/2] Ignore more warns in xe_wedged tests
Date: Fri,  8 Nov 2024 21:18:35 +0100
Message-ID: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
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

It turns out that there are more drm warnings which should be ignored
by igt_runner. Tests succeeds but later on when generating results
runner turns it into a failure.

v2: corrected and added more regex-es, move '|' to begin of split
  strings for better reading, corrected name in Cc and added r-b
v3: corrected drmtest logic for opening cards, improved assert
  logic for xe unbind (Kamil)

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Kamil Konieczny (4):
  tests/intel/xe_wedged: Ignore more dmesg warnings
  HAX/DO_NOT_MERGE: xe-fast-feedback: test xe_wedged
  lib/drmtest: invalidate cached fds after unbind
  lib/igt_sysfs: improve xe sysfs checks

 lib/drmtest.c                            | 18 ++++++++++++++++++
 lib/drmtest.h                            |  2 ++
 lib/igt_sysfs.c                          |  6 ++++--
 tests/core_hotunplug.c                   |  1 +
 tests/intel-ci/xe-fast-feedback.testlist |  4 ++++
 tests/intel/xe_wedged.c                  |  6 +++++-
 6 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.47.0

