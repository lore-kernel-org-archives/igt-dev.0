Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CF9C88E50
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 11:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B49210F568;
	Fri, 11 Sep 2026 11:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAvf3z07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC3610F568
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789127149; x=1820663149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kcigXyLVP6+eYdsvCQuujKSIRUGO7+HDxv2oiFWuImE=;
 b=DAvf3z07ubAY7/3Kbiq3G4aSTR3zPmkqXCh31PB92oyOs42d5UH3tRIw
 z3qrxVZhyh4V8IY7EwSvmMEf3Cxi0QqGQmBwaS8QfvYSgdxLAoWgv8iwe
 1wzXrN1v1q4s3bmC7Dv6NgkkqCzXREXYdVRNASI2VYBHgl1fpEqGcMqbC
 m7YBhJ/2BXoXknceolT1rDnXs1Rw7xBjbmYIhBRGRKutzsaQ87Px2WWOj
 glBCOsRYEy97G3aQeJQUgHO57FYcQ62T166mDN/lQBui7uSILC1TTNjnf
 kz2Iyn7D6Bhwt+zRBim+t3yUxTeU+uLrsWJLc697igU4HwObOho0WUWfI w==;
X-CSE-ConnectionGUID: JiPOrza/T3SniF5e3u1jMg==
X-CSE-MsgGUID: bsIGSSfsR8aT5EtL/IZuDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89521098"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89521098"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:45:49 -0700
X-CSE-ConnectionGUID: sNjnXfaMRc+79D59a2n90g==
X-CSE-MsgGUID: fND5hLngTFaQOM/WlfU7/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="272403858"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:45:46 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 0/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Date: Fri, 11 Sep 2026 17:04:49 +0530
Message-ID: <20260911113448.1300864-4-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

The kernel now reports -ENOTRECOVERABLE when the device is wedged.
As runtime-survivability deliberately wedges the device, update
dmesg regex so igt_runner does not treat the expected error logs
as failures.

v2: Keep older error codes (Kamil)
    Modify regex (Kamil)
v3: Modify regex (Riana)
v4: Support sigid based logging (Riana)
v5: Use constant sigid values instead of strings (Riana)

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>


Sk Anirban (2):
  tests/intel/xe_survivability: update ignored dmesg regex
  HAX intel-ci: Add xe_survivability to xe-fast-feedback

 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_survivability.c           | 14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.43.0

