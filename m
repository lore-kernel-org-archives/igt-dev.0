Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF0DC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 07:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F86410E1D9;
	Wed, 22 Jan 2025 07:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4NeW5Sr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF3010E1D9
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 07:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737530611; x=1769066611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bDDmYOJAMLW5bn/Ol89VKOrIaRbQB/XrhasYgm36zpg=;
 b=U4NeW5Sr96QZHDEQg9iRMnrC5CoSbj9iHT/Reb9oT0Dqw++tkJ8WOXs6
 Q/djUGSoD44I0SeyFMGObaHw21v+6WuK5q7hJ7cqy3vUs0XzI8UXz3cK0
 DZ94x2e05r4dmwQbCtd1vbNxSnLkjH/TGLkR3UjWeg48MwPV7CY9RT0VE
 3jpAmbghMiN5+bArfL6xhuVIY9Mz+SQCOb27oEz+C18smYjnGigO7rDSz
 kNtXi78c48W3YrHiO5U66KgdqbrG8kKf9Ni8dgHLmOnAJ2OUwBtDnP1ym
 7W6H4bzuLHhaZM101jIOPJiil1JpkgLy3KyRTZtn4ha6aDjiloj9CXR1x w==;
X-CSE-ConnectionGUID: ODDPkuJgRx6gtRkhdeBLpg==
X-CSE-MsgGUID: Cro2Us43Sf2GunEHxcM1EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41903695"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="41903695"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 23:23:31 -0800
X-CSE-ConnectionGUID: 2wdrmiEkQyCPAwGuq+MJsw==
X-CSE-MsgGUID: HKTniBDdTKKTgFMD5fD1rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="106959596"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2025 23:23:30 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t v4 0/2] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv
Date: Wed, 22 Jan 2025 13:08:06 +0530
Message-Id: <20250122073808.16288-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
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

Use the kernel fault injection infrastructure to test error handling of xe
at probe time when executing xe_guc_mmio_send_recv() and at enabling of VFs
stage when executing xe_guc_ct_send_recv().

Error can be injected using:
igt@xe_fault_injection@inject-fault-probe-function-xe_guc_mmio_send_recv
igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv

Satyanarayana K V P (2):
  tests/intel/xe_fault_injection: Inject errors during
    xe_guc_mmio_send_recv
  tests/intel/xe_fault_injection: Inject errors during
    xe_guc_ct_send_recv

 tests/intel/xe_fault_injection.c | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

-- 
2.35.3

