Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFEBC79F99
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 18:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317FE10E035;
	Mon,  7 Sep 2026 18:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSNyi0Gs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29E410E035
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788804130; x=1820340130;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Aq56kmBtYgmPRz3GHeGKWe6jqYyiEFJXiyE/5iWDrac=;
 b=hSNyi0GsU0NQ+Td7dAbhiTSX39CyCwEt2vplTUBM9DQ3gbiqn4kd0Ocz
 Q0j30uayaeqwHHaO2f6FjhJNIp0Exl+EnvrNm9J7YmEpCarMQ9dKPc2rM
 WDmpKO/tq3dQxmy/MndfdSoKqnA//DGzw4c7oYNtaEhO6hEZ5aIJVL3mh
 Q0X1mA+4ZCQQU9jjC5y/oQ+SGobFG34PPjSCPyQhksM14N5tMsWZrZQ43
 lEUsCobbwymPfr1exWsf3WvricSyo5/hoOA2RDwabwPnwho0IgLid7PCN
 7lRycpL1BqKZ1lowyj6yRBGoVTz9ANMDR5gJ5GkX/jG4EMJhX2hAO0M4g A==;
X-CSE-ConnectionGUID: +DGiA5D5TfWy9x4YFL5ePQ==
X-CSE-MsgGUID: xd/rdxaDQdiVHnvxEqQPug==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99867671"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99867671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 11:02:09 -0700
X-CSE-ConnectionGUID: tmi6hIHoR4aqxpKvtYQDtA==
X-CSE-MsgGUID: 7Gp7Fsf6QjSnuboHZYecxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268195082"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.226])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 11:02:07 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Pranay Samala <pranay.samala@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3 0/3] tests/kms_color: Add support for background
 color testing.
Date: Mon,  7 Sep 2026 20:02:01 +0200
Message-ID: <20260907180204.336052-1-kamil.konieczny@linux.intel.com>
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

This is resend of patchset from https://patchwork.freedesktop.org/series/167119/
with changed first patch for drm-uapi, which I updated to most
recent one.

Also please note it is not 1:1 with drm_mode.h as in igt
it has one more property, namely DRM_COLOROP_FIXED_MATRIX,
and also I removed two Linux kernel includes which break
compilation.

v3: sync with most recent drm-next uapi change, fixed subject
  in second patch (removed dot from end), removed one non-needed
  empty line from last patch (Kamil)

Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Pranay Samala <pranay.samala@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Maarten Lankhorst (3):
  drm-uapi: Sync drm_mode.h with drm-next up to 1258f9c9ff1d
  lib/igt_kms: Add support for the BACKGROUND_COLOR property
  tests/kms_color: Add background-color subtest to test the
    BACKGROUND_COLOR property

 include/drm-uapi/drm_mode.h | 213 +++++++++++++++++++++++++++++++-----
 include/linux_scaffold.h    |   2 +
 lib/igt_kms.c               |   6 +
 lib/igt_kms.h               |   1 +
 tests/kms_color.c           |  71 ++++++++++++
 5 files changed, 268 insertions(+), 25 deletions(-)

-- 
2.55.0

