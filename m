Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640B5C55162
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 16:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BFD10E0E7;
	Thu, 30 Jul 2026 16:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzvI0+6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F1010E141
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 16:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785430715; x=1816966715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/qkG/eD0wh2RXC2GkY6Tu1p+Sji9r/UVGurlJI3gKuQ=;
 b=WzvI0+6zXUxUSX7MwY+kzKwwi+/ORydNtKdOSghUlT0/yf1ojpJ25K65
 er1yfi0dMvgV+7A9iPm4XYN5ivRpq7jN97ZjBs84+QMrO8jgQCWMopV4N
 DySiqUkCHIyocXafaUxyxYhNgUL8tq1XxnNpII5MzuavpUDYaD7IVQNHA
 lZEswTf1C3rTdMZxAL5cg69uyRnwhq6XmAPktzMQvLviXtnDzWxUx4g1V
 Jc29on9STIG+Bg6kgppqL8TdApIz5Agt/E+mjKIpJwNLpSI/KAxNT71L6
 0Wd+OXDKIVyELNCwVDe2yPlLaI+Olu26ZfXbiYHKJ4W6AQGJosXlkRllK Q==;
X-CSE-ConnectionGUID: IMWFmByYRrOmfVhIFz9Uiw==
X-CSE-MsgGUID: QAvHcixPRAOe0fAYA4owQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88590065"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="88590065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 09:58:35 -0700
X-CSE-ConnectionGUID: c2MUxXDLRKi4PY3/ffHZlg==
X-CSE-MsgGUID: mwvTjE6RSxWSD9Z71GvSPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="262286638"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 09:58:31 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/hwmon: Add fan control test coverage
Date: Thu, 30 Jul 2026 22:37:51 +0530
Message-Id: <20260730170752.3750843-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series adds fan-control test coverage to the Intel hwmon IGT tests.

The goal is to improve confidence in fan-related sysfs behavior by
validating mode transitions, fan-table programming/readback, negative
paths, and behavior across suspend/resume states.

Highlights:

Validate pwm_enable mode behavior for supported fan channels.
Program and verify user fan-curve points with point-by-point readback.
Add negative tests for invalid PWM and invalid fan-curve writes.
Validate suspend/resume persistence for both user-programmed and stock fan
tables.
Exercise suspend/resume in freeze, mem, and disk states.

Karthik Poosa (1):
  tests/intel/hwmon: Add fan control test coverage

 tests/intel/intel_hwmon.c | 523 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 522 insertions(+), 1 deletion(-)

-- 
2.25.1

