Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57804CF31B6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 11:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F130410E6F8;
	Wed,  2 Oct 2024 11:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpuS7JcK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5018010E169
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727868572; x=1759404572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ihXueVqjrbnpb8lWrXla8S48StoQGrzvwcW/YqHQRtg=;
 b=QpuS7JcKX0CyeOHM/ubGw2wAKHZ/b4mOOY2RmO9MvlZlBw/sVWFB2vva
 n70U8OKuV3QGYbX4oypsWz8QVV1q8uQmlhS36kzDLbSMCLIw2lzn9Ge4s
 UGgg2QBxBjQ0KIyNQ4EfICIzKM906hfsF3wdmE0iC3dfRzP3/TisdV7Fo
 4AG9ddoC4zxaKXOmSXk/kuNnhkzFp6s1kSf2TYw46RL2BHlmnB/eEVvhM
 fxSc6eyKPKHbv943mr/vb94Ka10ykMd6UMMWfq+2uqVM1c1rZsTxjiAda
 HzlLKZRDt2dNHjgJxGVvfMXMXsK1m/9O/9BDLFhdlG6UcRQ7pH2nBk1UC A==;
X-CSE-ConnectionGUID: uAsAi9FRQvOzHSJANPIIMw==
X-CSE-MsgGUID: zJoSOhSdRUC5Qw7BxKmT9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27160603"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27160603"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:29:32 -0700
X-CSE-ConnectionGUID: ZSCZjgBdQ2G46shHPCX3pw==
X-CSE-MsgGUID: ArimjZfvT3+6PblDppGT5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="104764478"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:29:30 -0700
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
Subject: [PATCH v2 i-g-t 0/2] Fix xe_eudebug_online@interrupt-other test
Date: Wed,  2 Oct 2024 13:29:12 +0200
Message-Id: <20241002112914.5556-1-dominik.karol.piatkowski@intel.com>
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

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (2):
  lib/igt_sysfs: Introduce engine_class property helpers
  tests/xe_eudebug_online: Adjust interrupt-other test

 lib/igt_sysfs.c                 | 85 +++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h                 |  5 ++
 tests/intel/xe_eudebug_online.c | 45 ++++++++++++++++-
 3 files changed, 133 insertions(+), 2 deletions(-)

-- 
2.34.1

