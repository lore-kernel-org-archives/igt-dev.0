Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C991ED2B941
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 15:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7133B10E12C;
	Tue,  5 Nov 2024 15:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYchKUmX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BBF10E12C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730821704; x=1762357704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dULjQXbmBtvYwyAoFBPZAFIzwoVJuhO77vyldZ+z6xE=;
 b=KYchKUmXFtg9e1LIHXBTx1mbuFbNQV2l0wwiujAjOKjWMgNRwftXd8LP
 mzIgNbNKPVQFdv6cengbx1Vd7G4GriNQDD9o3s9qluhMUx/lhOwH93U3B
 FU1NbLfD8fTuL+OBTzf8oU6rKsJwOhmNlkmt70BYtUpSMFqDx3ViaxB8q
 fRCWgM+xuAR2EgS/E677X3WMRORHE7GQENAuN79XaFfSj4bBHBF83OP6g
 XaH53Uk4kpufo2xfZcZBzbe4+6jRi+pYYlD8vV1L8Li8R04kKf1YebHgp
 jC/l/s+4sdjxNkiPgohMUAQzAdaJKf5KdECaD7aSvdD3wVhmgnfsmwBjk Q==;
X-CSE-ConnectionGUID: 0GNdPH/6RVG8BSFa5lovDQ==
X-CSE-MsgGUID: JdwFkaHlTa6rcXqq3t1bvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30801890"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="30801890"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 07:48:23 -0800
X-CSE-ConnectionGUID: 2ucj7quWR6aGa8lCR2ObCw==
X-CSE-MsgGUID: XwizTnoFTg6eSuLvd0IBFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="87996321"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 07:48:23 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v3 0/2] test/intel/xe_sysfs: Restore sysfs params correctly
Date: Tue,  5 Nov 2024 15:48:21 +0000
Message-ID: <20241105154823.66078-1-jonathan.cavitt@intel.com>
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

The xe_sysfs_timeslice_duration and xe_sysfs_preempt_timeout tests do
not correctly restore modified sysfs params on test failure.
Additionally, xe_sysfs_timeslice_duration modifies but does not restore
preempt_timeout_us.  Repair these issues.

v3: Fix several formatting issues (Kamil)

Jonathan Cavitt (2):
  tests/intel/sysfs: Restore sysfs values on test failure
  tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout

 tests/intel/xe_sysfs_preempt_timeout.c    | 43 +++++++++++++----
 tests/intel/xe_sysfs_timeslice_duration.c | 56 +++++++++++++++++++----
 2 files changed, 79 insertions(+), 20 deletions(-)

-- 
2.43.0

