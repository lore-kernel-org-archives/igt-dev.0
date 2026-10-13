Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A486CC6B0F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 14:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D7810F891;
	Tue, 13 Oct 2026 14:37:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC1E88C3D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 14:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791902204; x=1823438204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y+ibHtVl1wbNUpaVNjBsxdmXkPsWeVeSpsKdhKW3zio=;
 b=V0bP+sy4z68/IwDI/4ZU/4Fj/vOaXwnLV+r+tnXqRNtfsyTx6Dupv9oT
 eFF/z+n3GgB5WeVivb+g3Y0/QH73pe1SYuTXIpxXuudFTsmgG9hXxAHuL
 Q1uF2vuFGo60CEq6vCkl4HKS1CPK2FRGR8+DJORwL67LuHV0cn6vdwhfF
 PYITk2d33iZZ7kZbt5sTuzHFhOdP5PphvkJrg57MMSlv6q4jnA+wgp5AE
 sgEZkHJkD8NmduHquKDEZpt3sroq4f44rjZHXnx/mxgu1j3/5jtFd1Hxx
 YW8ix706rGmuLjcoFnF6H5l+U7W2R5g0jEG3LGNjeSHoPDCyXRYi9DGCE w==;
X-CSE-ConnectionGUID: 4VQa2aVjQjyQ63YkFkBuWQ==
X-CSE-MsgGUID: f6NnSLFQTyqGK0og6moBHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="531290"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="531290"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:36:44 -0700
X-CSE-ConnectionGUID: U8ckDLdKTCS7zbWaw8EHXw==
X-CSE-MsgGUID: PtOjFONuS3qI+mMFccZHLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1372424"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:36:43 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 0/1] xe_pmu: Do not enable VFs in unrelated subtests
Date: Tue, 13 Oct 2026 16:36:37 +0200
Message-ID: <cover.1791900914.git.marcin.bernatowicz@linux.intel.com>
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

Gustavo's v2 proposal avoids enabling VFs for unrelated xe_pmu subtests.
This update keeps that goal, but moves setup into the first selected
dynamic case because SR-IOV helpers can call igt_assert(), which is not
allowed in the outer dynamic container.

Later engine cases reuse the VFs, and cleanup runs after the group. If
setup fails partway through, later cases skip and point to the case with
the detailed failure log.

Previous proposal:
Gustavo's v2: https://lore.kernel.org/igt-dev/20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com/

Marcin Bernatowicz (1):
  tests/intel/xe_pmu: Provision VFs inside dynamic subtests

 tests/intel/xe_pmu.c | 48 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 12 deletions(-)

-- 
2.43.0

