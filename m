Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F6BC54E4A
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 15:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2FC11325D;
	Wed,  6 Mar 2024 15:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpQuhVQf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8524311325D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709737346; x=1741273346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CkHP9RB9kP+ZzDE41AJGfR2IAqmQW6hSAIeChzbz+qI=;
 b=bpQuhVQf4JexwODu1U4I6XQSLRHR3M0BuYGMLpwtKJ0qH+AMzLJ5KkPY
 oKmaBK3+NXq2dqwnnREHo1xNUFs1r4g70OgZUHWBE7W9dmYiBfjqUZghG
 QlZz+GKqCNrQa2KoPNfEvRvtwHmOJ4qRfhuwjgCz2ivWJQZLUxLmw/2FJ
 Cx9kQGueh7rd5X6+IXbXPBTkpLWeRkZV1mbQ85U9sUkLbUvBK4sF0iJ0U
 l5sE2iHPvcyJwFHbqZARaPxxcvdNHZhNvtDYu9Vj8r8cDrx7NrZMwa6SW
 DDSyI8oNT6uNIuq5fqzJE5DyVmAp/itjzW3PQ3fYvUgP731wIUt6GULfO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4284102"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4284102"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:02:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="32929463"
Received: from unknown (HELO localhost) ([10.245.244.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:02:23 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v2 0/4] Add xe_render_copy tests
Date: Wed,  6 Mar 2024 16:02:15 +0100
Message-Id: <20240306150219.301977-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fill gap testing render-copy on xe driver.

v2: Addressing review comments.

Respin to get full result before merging.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_blt: Add blitter tile to legacy tile id helper
  lib/intel_bufops: Use printf style filename formatting
  lib/rendercopy_gen9: Add Tile64 support for render-copy
  tests/xe_render_copy: Add render-copy test for xe

 lib/intel_blt.c              |  25 +++
 lib/intel_blt.h              |   2 +
 lib/intel_bufops.c           |  14 +-
 lib/intel_bufops.h           |   2 +-
 lib/rendercopy_gen9.c        |  24 +-
 tests/intel/xe_render_copy.c | 421 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 7 files changed, 480 insertions(+), 9 deletions(-)
 create mode 100644 tests/intel/xe_render_copy.c

-- 
2.34.1

