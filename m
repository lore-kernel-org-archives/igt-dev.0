Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE74EC54E71
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 23:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA8C10E575;
	Tue, 20 May 2025 23:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxxRcBqq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9A810E575
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 23:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747783262; x=1779319262;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZoL6OoMyF+MtPk/4LqiScI5zy7hnOwaAIB0Y2sf0UTA=;
 b=gxxRcBqqiizT5glgEh06gYD9pw4VSkE4F5CEOO0OrwnoGYvRt7NEWHh0
 r3sEVeBON0QCvns2xbGD3SB3tFbsG2/rb29crZqcl2zEltTs/tGyQiE6l
 e+gwM3yk4odu55FCKA3MJ8+tgtOGVv3KWcRPObb7xKbhTYNxt4Kgd09lm
 Ftnb3ReuIEhbXNCcPoDMoQTdVHumbqDbhMT8TVkvbIdb+PjPdQzdEmCcF
 NVJ7EHoXqMzQZ/0rycTipAx6f8/4dMPfjMmZhQCNkw5KtyZBmR0c5gQx9
 u1QvVhSUzYyJHGIq83Tphx4NsWfx608XobntZpUpNCbbOpD1TdlUb4vMb w==;
X-CSE-ConnectionGUID: 0d/cAbsiShm1UN0achcnaw==
X-CSE-MsgGUID: 5gb0gLWbSzOzgPi/BiEKnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49875543"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49875543"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:21:01 -0700
X-CSE-ConnectionGUID: kkh9dMccQcSfnWzVXw0xYg==
X-CSE-MsgGUID: b5t8NsskSbSYSswMJU4uHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="145095695"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:21:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH i-g-t 0/4] Add test for active context utilization
Date: Tue, 20 May 2025 16:20:28 -0700
Message-ID: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
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

Add test for querying context utlization when it is active on an engine.
Refactor some flags in the process.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  tests/intel/xe_drm_fdinfo: Use end_cork helper to end the spinner
  tests/intel/xe_drm_fdinfo: Drop TEST_TRAILING_IDLE
  tests/intel/xe_drm_fdinfo: Rename TEST_BUSY to TEST_WITH_LOAD
  tests/intel/xe_drm_fdinfo: Test utilization while load is active

 tests/intel/xe_drm_fdinfo.c | 64 ++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 26 deletions(-)

-- 
2.43.0

