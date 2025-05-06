Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BB3C3ABAC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 10:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F81A10E24C;
	Tue,  6 May 2025 10:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hiofTX/q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9579F10E24C
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746526568; x=1778062568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jf6j7sDJNlhyXZ3JDDg5/bXIaFCT60eJXjHPzCy4Ugg=;
 b=hiofTX/qRO6W7Ved+eVo5+xu0CRgq3frEkIKxcAUfMZEdq3Tyvf/KY9e
 0fhx4puzFgL65Yyj29EsqpKUNfpYaoCu9p665b6f5Llwzw7ybPRFPGcLo
 uMcDX3yliH9nvGkBGU3kBOh4Fsr5lPk6ZV309FhJ97p7yyXU7utlPdZ89
 MOw5pS398/jxaCOP5Dymv90cWaTIhH5eK6ywAdsuAsrpYh29uF59cs7m/
 Ge/K8Iy+CqqG1sdo/FDkU9ZJ3hXMvxokNDfwdWm0IvnZwtWVbCCIxDzXr
 t++ap2Uc5TV9D9jrT3jjGCm6qHG4wtNvPrPo8wdn+LOhgmq6aXhY/+3UY g==;
X-CSE-ConnectionGUID: 0XFExFwTSK664ds99x+ACw==
X-CSE-MsgGUID: 3xFywqCsQ1OpenEK1pVg4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59575969"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="59575969"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 03:16:08 -0700
X-CSE-ConnectionGUID: UP++qxpER9CGPro2hI+nKQ==
X-CSE-MsgGUID: rVqqlGm0Sp6Bu3iJvWjHVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="139627934"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.101.99])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 03:16:06 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_pmu: Improve VF setup and cleanup
Date: Tue,  6 May 2025 12:15:52 +0200
Message-Id: <20250506101554.629218-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Improve VF-related setup and teardown in the xe_pmu test.
The changes ensure a clean environment before and after test execution.

Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Marcin Bernatowicz (2):
  tests/intel/xe_pmu: Unprovision VFs on cleanup
  tests/intel/xe_pmu: Check default scheduling attributes before test

 tests/intel/xe_pmu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.31.1

