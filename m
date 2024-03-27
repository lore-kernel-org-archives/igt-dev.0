Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55302C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 18:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D2710FF2B;
	Wed, 27 Mar 2024 18:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mff02wHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22C10FF2B
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 18:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711563670; x=1743099670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f9A6f7z4QqcxJCvpwCywbmv7usIsfuwUPulrOS3UfYI=;
 b=Mff02wHKUjXsV4rxNBKMvdKxZKzAM8I1xpEk+V0z06178l2tYYzYBOhQ
 ig1mKaykM/QbYAKIWIUlur59Q+VC9fMv+VM9UL7LWHqUcmlY19Zapi1pe
 8Q0yFEbVhRcNJeIxt7f1EbKKJm8lqjQQxI485uaAL/6bkrZIhujXl7s8E
 4SvC/Clg+QixVwp92MI92EHo1DqwOzQ5qukN+HBAz4FC/reXPNT6kvtr4
 GnSEmLkBTRup+/oxAC1MlbySh+LZdXPuVyzADuNMvq0JoSmuH8HHfojm1
 2s26w2/2ETkr94Hzsf8KEr7gJ1CsguiS/LTgdlx/amwfjjnWE+6vZ4oQV Q==;
X-CSE-ConnectionGUID: Gv26IYa6R4epBLSBXHHlKg==
X-CSE-MsgGUID: 9G+VamjdQgmWZegytY7Rkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17416987"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="17416987"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16224490"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:21:08 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 oak.zeng@intel.com, Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t,
 v3] tests/intel/xe_vm: Fix WB caching PAT index for coherency mode
Date: Wed, 27 Mar 2024 11:21:08 -0700
Message-Id: <03d59e02328efb3b54deb0d24d3b68bb123ac8e8.1711563399.git.jagmeet.randhawa@intel.com>
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

Ensure we set a suitable default pat_index, which is always compatible
with any CPU caching mode, like intel_get_pat_idx_wb(). For example,
currently we are blindly selecting pat_index=0 which has COH_NONE on LNL
and then attempting to use that with CPU caching mode WB, which is not
supported by the KMD.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
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

