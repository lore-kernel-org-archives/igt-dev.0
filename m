Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A45EC982DC
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 11:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFB310E083;
	Fri, 18 Sep 2026 11:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ia/Vu233";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D5610E083
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789730830; x=1821266830;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4a/mjFXU1EZKbOHP3SZP1q1ZVdtWDV5j/NQIhmCEljo=;
 b=Ia/Vu233N/+3PO0dswwRmnuX1t4EJ8su1Y5etvLmBpwYWl7DS0Izy2mv
 NM9AAg0T6YK2WQvd4u1OD+Nd3JlCqbnhAOVkbHjPmSfhQzkL4lMeRtSG+
 79SXuvMLXLEl4HgdRyOKGXBtR3UNYT4BxNbQrhAgSlfwcmDYmykBuMvqH
 Wv52IQPb/IZODF6M/leXeeKc5jgd3e87EmO6DXG4hFpaTxZfri9HuMliw
 l8bijuKt9xfJ8lzeZ1mrErB0Mv/nEB4sa64d5Z+4cyYzmrdy3ItJwIK28
 uaAa+65EaZeW5CI0/P+YZ3YEZwqak5UcBmyaVafno00fiZGvHKs3Vai2y w==;
X-CSE-ConnectionGUID: 9oOAnCukRFqVovUR6iMYKw==
X-CSE-MsgGUID: 5g/vv7ftRbSSdpDmzC/mrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="736624"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="736624"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 04:27:10 -0700
X-CSE-ConnectionGUID: KQan7ITJSUiBQccCTJtbPw==
X-CSE-MsgGUID: eCA7dzV2QxOLsXcyeRPuxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2547235"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 04:27:08 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v5 0/1] ib/igt_core: Make build reproducible
Date: Fri, 18 Sep 2026 13:26:58 +0200
Message-ID: <20260918112659.45415-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Create a new way for searching for data files, PNG images used
by kms_3d test. Also remove build/data path from libigt.so.0 as
this breaks reproducibility, according to
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/190

Before this patch:

strings build/lib/libigt.so.0 | grep build/data
/home/user/igt/build/data

After applying this, it was not found.


v2: changed subject of patch, as I will not verified reproducibility,
  only addresed a build data path present in lib (Kamil)
  reworded description, added second HAX patch for testing (Kamil)

v3: reworded subject and description (Kamil)

v4: removed last HAX patch (Kamil)

v5: addressed review comments (Zbigniew)
  corrected function description, reworded cover letter (Kamil)

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (1):
  lib/igt_core: Create new way for finding PNG data files

 lib/igt_core.c  | 62 ++++++++++++++++++++++++++++++++++---------------
 lib/igt_core.h  |  3 +--
 lib/meson.build |  1 -
 3 files changed, 44 insertions(+), 22 deletions(-)

-- 
2.55.0

