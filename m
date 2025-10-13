Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B19CCD18D
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 13:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0130410E380;
	Mon, 13 Oct 2025 13:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZQcVOdK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2554710E380
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760362878; x=1791898878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9oZhA0GAOvrkxCJZQsU9TFdsfPErXCpOTSlSjggYC4U=;
 b=YZQcVOdKYD7fjCK4AvsjLMU2lGKex5U/5t6RJ21Zb/zj/076vncR0F9n
 a7Mf3HdyvLenA5J7jcdSQnpx0yXVzV1ZcttzUhfFPWDxxu6G+N6tEQ8cW
 ZeHKESCpf+OBp/cGv6li5rv4UHyx2JbRtotc+MkBnG0SJG4OQdhPuMNiG
 i6dU6hY+O4CeJYro8jkDWO4P7L8MDEjApjjgAOjhhS/TwK3hMHjGmjOB5
 kIy2ym8BBODcVKIdH/1EMzP0QGztUZSUF7oYtKxBg8zbKbUblHXNo8mez
 7vMrkmZNByyaR9r2G4hjqJ2EO0YsvM2Q/s+9AU+EJ4H2WrR5px8p+dq4x Q==;
X-CSE-ConnectionGUID: LtLypkFbSCy5rLoJu6+7vQ==
X-CSE-MsgGUID: VGDlbIzjR/2t/ccIiV/QMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66155495"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="66155495"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:41:17 -0700
X-CSE-ConnectionGUID: CYtesG7gRP+GFLLJThwhAg==
X-CSE-MsgGUID: y3SMwdQ2QxyWz5K0L+oVug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="180742543"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:41:15 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, zbigniew.kempczynski@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/4] tests/intel/xe_eudebug_online: Introduce pagefault stress
 tests
Date: Mon, 13 Oct 2025 13:40:39 +0000
Message-Id: <20251013134043.1676308-1-jan.maslak@intel.com>
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

This patch series introduces stress variants of already existing
pagefault-(read|write) tests in the `xe_eudebug_online` test suite.
These tests use the maximum number of threads in thread group and
maximum number of threads in the shader.

v2: Compute `maximum number of threads in shader` and
`maximum number of threads per thread group` values based on
hardware capabilities instead of using hardcoded values.
v3: Added `num_threads_in_tg` to gpgpu_shader struct, as opposed
to passing it through function arguments. Add xe_query helper
function for retrieving u32 hwconfig values.
v4: Addressed review comments for computing max number of threads
per tg.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>

Jan Maslak (4):
  lib/gpgpu_shader: Add num_threads_in_tg to shader struct
  lib/gpgpu_shader: add function for computing max number of threads per
    tg
  lib/xe/xe_query: add function to retrieve uint32_t value from hwconfig
  tests/intel/xe_eudebug_online: add pagefault stress tests

 lib/gpgpu_shader.c              | 136 ++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h              |  12 +++
 lib/xe/xe_query.c               |  17 ++++
 lib/xe/xe_query.h               |   1 +
 tests/intel/xe_eudebug_online.c |  61 +++++++++++---
 5 files changed, 217 insertions(+), 10 deletions(-)

-- 
2.34.1

