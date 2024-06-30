Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A308AC3064D
	for <igt-dev@archiver.kernel.org>; Sun, 30 Jun 2024 18:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C86110E1F4;
	Sun, 30 Jun 2024 18:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcOuDJE3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468EC10E1F4
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Jun 2024 18:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719770742; x=1751306742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hsap8T7vZyTnY+JkFICjvPgTy29qXKMK/vdelMEC7bQ=;
 b=KcOuDJE3vb/gVb4orIm65VWpLflw2i3Gps8HwhOh1K72ApZBX+gp1eLv
 q3Kb1jps6efQs5t0EegZ6sJ38xH4vbQXLNMh9tNWmGSTzfhdK5SoObdQk
 OZHmQ4OODsJF14lj9+WNxfnqeRZLF0f3Y+wnMIUlITKjKlBLz/h8swoNv
 aBQ2MnscLIwzv/i7tXHVGBzHjKOVwlOg4a6oEEPI1pL5k7tQA+k27sbci
 UYISndH+yJwdsS+LBatfk5Q5w7EmIoKA5A0LZ45W2aEmici4hPqCV83Z1
 GIDlzKpeBi8xAnPaXJzv/tZWZe5uPAYqFw44TdJd3vBK23ncsNXanHkDz w==;
X-CSE-ConnectionGUID: gsEOQ6z8TG226G4R0XImpQ==
X-CSE-MsgGUID: TVUzRCxYQoiRe5G2Uirqqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="20756548"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; d="scan'208";a="20756548"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 11:05:42 -0700
X-CSE-ConnectionGUID: kFMNJ+jnQUSFGDfpdsyu2A==
X-CSE-MsgGUID: R4JfjV+bQEOeOzTHHd2ZoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; d="scan'208";a="50170184"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 11:05:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/intel/xe_evict: Adapt the working set to
 memory size 
Date: Sun, 30 Jun 2024 20:05:00 +0200
Message-ID: <20240630180502.81556-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

It turns out that xe_evict in the cm and thread mode is a very good test for
exhaustive eviction. But the test sometimes uses a working set that doesn't fit
in gpu-accessible memory and a total memory size that exceeds the available
system size. Attempt to fix that to avoid false failures. With these fixes
the test should pass unless in -cm mode or multithreaded mode. These require
fixes for exhaustive eviction in the xe kernel driver.

Thomas Hellström (2):
  tests/intel/xe_evict: Reduce allocations to maximum working set
  tests/intel/xe_evict: Reduce the "large" bo size for threaded eviction

 tests/intel/xe_evict.c | 127 ++++++++++++++++++++++++++++++++---------
 1 file changed, 100 insertions(+), 27 deletions(-)

-- 
2.44.0

