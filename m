Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AA1C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 18:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DA110EF3E;
	Tue, 26 Mar 2024 18:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xu8EXyhk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDDC10EF3E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 18:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711476993; x=1743012993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WtaZXweIgE73JdzWb+q/7y8XX1wfJonNp3NllDSMO6c=;
 b=Xu8EXyhk2QXi16ruX71r4VcPzJuTTsk0yGWXrhrUkjD6HgWrIQ52yKRF
 OwMreTY6TuyWirfJrakHCazyoM85pXidTP759QeVthwv1x44hGA7i9/1B
 yNWLtRG4x/vbt7hrqZ3lsYehNN38bEy7KkTh22AGurtBBoTrPDJLxYuqX
 gSpTnE6XT9Q3P8bl6c/oLGdN+yn3MQpgBNKNf7/oMJq13/3jl9bl/Pimz
 T3z/kyg07DIziequzwTicHAUWmTmrhXH6nM56ShH8bVF/L5424z/DDDeF
 vXBFHTWGEpEfGNZemY/fJeq0Oc2uKlyL3N0hBCwUxvJq1xZKVb1nC9but Q==;
X-CSE-ConnectionGUID: nKiyvYHPQcS0Uh3iP22pGQ==
X-CSE-MsgGUID: wXL1za9YQpq3yeeOGGbNjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17179467"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17179467"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 11:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20761741"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 11:16:32 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com,
 kamil.konieczny@linux.intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t,
 v2] tests/intel/xe_vm: Fix WB caching PAT index for coherency mode
Date: Tue, 26 Mar 2024 11:16:28 -0700
Message-Id: <20240326181628.130143-2-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240326181628.130143-1-jagmeet.randhawa@intel.com>
References: <20240326181628.130143-1-jagmeet.randhawa@intel.com>
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

Ensure we set a suitable default pat_index, which is always compatible
with any CPU caching mode, like intel_get_pat_idx_wb(). For example,
currently we are blindly selecting pat_index=0 which has COH_NONE on LNL
and then attempting to use that with CPU caching mode WB, which is not
supported by the KMD.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7c061c497..1f458174d 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1789,6 +1789,7 @@ static void bind_flag_invalid(int fd)
 	bind.bind.range = bo_size;
 	bind.bind.addr = addr;
 	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
+	bind.bind.pat_index = intel_get_pat_idx_wb(fd);
 	bind.num_syncs = 1;
 	bind.syncs = (uintptr_t)sync;
 
-- 
2.25.1

