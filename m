Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A347ECAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 17:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504E210E061;
	Wed, 17 Sep 2025 17:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7vQqm4d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C13A10E061
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758128640; x=1789664640;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pzrJniNd5TuIYDddOxIadlR4yUN8lljBBevynmpNOE4=;
 b=g7vQqm4deqooGw8C+oK5ADd5+DX/U4Rh+2ZgBnPCso5BtOkcyVkYNdtd
 P7poXDwHv+gktxvUaUHrGY0/VgpCVt9lFIXjP7JAJXp0WBuQwoxHsP+9p
 H/N+T3ZtfaktgTi4U0MzyDTP6/qwLhVpGEiK5q7ZEMNAL7LaLi7WAH3N8
 M5nFPcp3yPrWF6rqjmafVzsl4v0LiFt+uL0JswatoJsq2eItQHHUt/16T
 aV+r6UMgelqwQ6/ZbWtaqEHG/eLmpjqepL1HcykAPI2u1QhjBrpBl1Dyl
 KkTzo9uwAvWk1Lax1h11gZyrdp1D4ab9S03wKBmLMq/gL7nLD2XPiU3wh w==;
X-CSE-ConnectionGUID: 6aM1ITiERTatr2kxmHgn5w==
X-CSE-MsgGUID: 0rKPdnUFRaW8reeR/SC2og==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71073529"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71073529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:55:55 -0700
X-CSE-ConnectionGUID: XjK5acHhTB279ptYzuVpyA==
X-CSE-MsgGUID: tD5Uj9o+S5G4wADsGP+naw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="212449654"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:55:53 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, andrzej.hajda@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/4] tests/intel/xe_eudebug_online: Introduce pagefault stress
 tests
Date: Wed, 17 Sep 2025 16:55:37 +0000
Message-Id: <20250917165541.85203-1-jan.maslak@intel.com>
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

v2: Compute `maximum number of threads in shader` and
`maximum number of threads per thread group` values based on
hardware capabilities instead of using hardcoded values.
v3: Added `num_threads_in_tg` to gpgpu_shader struct, as opposed
to passing it through function arguments. Add xe_query helper
function for retrieving u32 hwconfig values.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>

Jan Maslak (4):
  lib/gpgpu_shader: Add num_threads_in_tg to shader struct
  lib/gpgpu_shader: add function for computing max number of threads per
    tg
  lib/xe/xe_query: add function to retrieve uint32_t value from hwconfig
  tests/intel/xe_eudebug_online: add pagefault stress tests

 lib/gpgpu_shader.c              | 78 +++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h              | 11 +++++
 lib/xe/xe_query.c               |  9 ++++
 lib/xe/xe_query.h               |  1 +
 tests/intel/xe_eudebug_online.c | 61 +++++++++++++++++++++-----
 5 files changed, 150 insertions(+), 10 deletions(-)

-- 
2.34.1

