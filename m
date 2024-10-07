Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DE0CFB440
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 10:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C703389E36;
	Mon,  7 Oct 2024 10:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LF8/uOQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CA189E36
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728296870; x=1759832870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tAyN2VDU8wVcahzqDCGZKROTPdvBifbP9KuK0eJBNe4=;
 b=LF8/uOQAwAfkKaO49TGlzazmNYcGgUtcO/U/JFdA5l1pSCk3ZBsF0FwD
 PD5rkG1vRoM+k9PtDl5Zcyjtcsj9jLPaAgf24z2t1KuYi1jwJCMZuHK33
 c121quLf5jr+k4gtatFmjwvLcIi2TjQxqijr3SfOe5aZ1SUVONxuR7w/h
 Oq4h0uFRtsFu/JII5OYXQyfqSOQeQU2BuNtJv5XgbQOVQJWYVNZ+H3/MT
 /fQKa4+JNd1Y5D2fA0reFqolCRqK+kNK8nRj+H+/s7zUmpJytytfEpVLo
 6mOEC0cE6mLYhmBodv/g6lenq4L0+oQGOpQKf8HlQn4hVsmgK6jyt9PSp w==;
X-CSE-ConnectionGUID: ru4Q8UtfTUSfC6lAms1sXw==
X-CSE-MsgGUID: tksnc/HYR6q3eAwdYSaH6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38565979"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="38565979"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 03:27:50 -0700
X-CSE-ConnectionGUID: vhL/vzgVQtu7e0PK8+NzXg==
X-CSE-MsgGUID: PHBPasROTb2PaYBZVX161w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="80020310"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.244])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 03:27:47 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 0/2] Fix xe_eudebug_online@interrupt-other test
Date: Mon,  7 Oct 2024 12:27:32 +0200
Message-Id: <20241007102734.5452-1-dominik.karol.piatkowski@intel.com>
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

xe_eudebug_online@interrupt-other test fails due to preemption
interfering with it.

In order to fix it, set the preempt_timeout_us for engine_class used in
this test to maximum for the duration of the test.

This series introduces the following engine_class helpers:
 - xe_sysfs_engine_class_get_property
   Convenience wrapper to get value of given property for given engine
   class on given gt.
 - xe_sysfs_engine_class_set_property
   Convenience wrapper to set given property for given engine class on
   given gt to given value.

v2:
   -Move helpers from lib/xe_eudebug to lib/igt_sysfs
   -Improve readability in xe_eudebug_online adjust commit
   -Add justification in message of xe_eudebug_online adjust commit
v3:
   -Apply nits from Dominik Grzegorzek
    (patch "tests/xe_eudebug_online: Adjust interrupt-other test")

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (2):
  lib/igt_sysfs: Introduce engine_class property helpers
  tests/xe_eudebug_online: Adjust interrupt-other test

 lib/igt_sysfs.c                 | 85 +++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h                 |  5 ++
 tests/intel/xe_eudebug_online.c | 39 ++++++++++++++-
 3 files changed, 127 insertions(+), 2 deletions(-)

-- 
2.34.1

