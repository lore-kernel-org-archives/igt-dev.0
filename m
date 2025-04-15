Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1105EC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B85310E6FA;
	Tue, 15 Apr 2025 10:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cR59Gkd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B55110E6FA
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712090; x=1776248090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=421Mar/egCpmwAJ1r+NBl+KBYtet4nHNIIkOG05DNwg=;
 b=cR59Gkd/myfeAYqcge+MK3wej5kNsFu1h1qJmiKeTkGZ+HTn4Z5DYqYv
 tIASSPrJ8SxL7T4Lw3lZrYmKWmFszdqv1nS3utzB3HTOqge4A3c/rnKRi
 xRUc2wlA2jNFOxRT2qu++Wk+gWXkB7bOalcse8JrhyL7CgCfiWRIrQhtz
 Xurik7eoAw169HP0BFNOecN3BrRcs5ykcYaIWg+s1jsC0Jdjc8Huj4l9n
 ppzr8w0sa5hN5jMvQCUBRJRVSqbZ4I8AhkIzqDjqGjYXYKqypdpjTmVRD
 rWx1tdv2WkLjImHljMe0qOh1odZlpKTq9f/p2cUkPppxKvIBv3xx8i2dK Q==;
X-CSE-ConnectionGUID: 133hSwNEQdqxeeRgT/PkGQ==
X-CSE-MsgGUID: QXvG0y0BQiKq5rP2b/M4jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50014743"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="50014743"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:14:49 -0700
X-CSE-ConnectionGUID: yES9XS2bQkqxG/6/W7UXqQ==
X-CSE-MsgGUID: M0oll2HYQu+BY+2zuoE1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129933275"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:14:47 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 0/2] Fault variations of tests
Date: Tue, 15 Apr 2025 10:13:38 +0000
Message-Id: <20250415101340.13275-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

This is a series of patches introducing fault variations, that is,
tests are accessing the memory via debugfd, by creating
a vm in FAULT_MODE.

Signed-off-by:Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>

---

v2: Added documentation descriptions to -faultable tests
v3: Fixed nitpicks and added Rb's

---

Dominik Grzegorzek (2):
  tests/xe_eudebug: Implement faultable variations of some testcases
  tests/xe_eudebug_online: Implement faultable variations of some
    testcases

 tests/intel/xe_eudebug.c        | 98 ++++++++++++++++++++++++++-------
 tests/intel/xe_eudebug_online.c | 25 ++++++++-
 2 files changed, 102 insertions(+), 21 deletions(-)

-- 
2.34.1

