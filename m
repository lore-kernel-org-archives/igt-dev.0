Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA80C3271E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 04:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D78A10E1C2;
	Thu, 11 Jul 2024 04:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUCVDtyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CFB10E1C2
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 04:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720671229; x=1752207229;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H24wcI1vbv8UuDJizY0e5hMoW1w0oljcmf7F1Yy1bpA=;
 b=eUCVDtydgfwHasBdPyPVKEWeyN6SRU52yA2jyyAaHmr/7H+a1iFyvTjy
 AlxlK+XwYpFnWxW+kNpI82ctwWE+wOOHQMibTEwI2RzoXsjLMOvclpBRj
 PgW5hgBE0WnFXKA9Ibonc0uTJmTAxwzAWubLCy4L1ndjdJ8lgKA1znSB8
 pigOL/Dod33gqoZO9/gBZ67KcEZw5kVE+xFAuJ4xunHO7zn7oVvX8abSn
 YqOkRpS0N9qKaBAdQamFOfllHeZNR6XKdRdgANn5SIymIy+cfzszNES3d
 SCOX772OFhUE1CD39eEJRp6HTrfsTVm5YTmEcFDoiV2EndMd5WH4UrsjJ g==;
X-CSE-ConnectionGUID: 9yYwYk0DSNCzbpAMEOXjrw==
X-CSE-MsgGUID: OeXYz31AQvWfFfaAEId8Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17645479"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="17645479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 21:13:47 -0700
X-CSE-ConnectionGUID: RwRdHXp7Q/2exxWV+v54Jw==
X-CSE-MsgGUID: rK+FCPfSS0e09DQT1DmK5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48404901"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2024 21:13:45 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 0/3] Runtime alteration of debuglog level
Date: Thu, 11 Jul 2024 09:43:52 +0530
Message-Id: <20240711041355.749937-1-pranay.samala@intel.com>
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

In certain scenarios, tests may fail due to insufficient disk space, 
even though they fulfill all requirements.

To resolve this issue, adjust the debug log level before initiating 
the test. Rather than manually editing the debug log level each time, 
aim to dynamically adjust it.

This approach involves modifying the log level within the test using 
the debugfs entry, with an exit handler ensuring default settings are 
restored after testing.

Pranay Samala (3):
  lib/igt_sysfs: Implement dynamic adjustment of debug log level
  tests/kms_atomic_transition: Reducing debug loglevel dynamically
  tests/intel-ci/fast-feedback.testlist: To get the required results

 lib/igt_sysfs.c                       | 109 +++++++++++++++
 lib/igt_sysfs.h                       |   5 +
 tests/intel-ci/fast-feedback.testlist | 184 +++-----------------------
 tests/kms_atomic_transition.c         |   3 +
 4 files changed, 134 insertions(+), 167 deletions(-)

-- 
2.34.1

