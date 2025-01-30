Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56EEC02193
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 22:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D28D10E9F2;
	Thu, 30 Jan 2025 22:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/BRAsLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0E210E9EA
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 22:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738275309; x=1769811309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sv62XT6MqT3ZMYisne2JieTMmNhSyuB8/jklr/asYGg=;
 b=U/BRAsLXSqFHgk4cJZz3lgtunEBx5ZkiuTDnF1mQpzDsxetHNlTP1LdT
 FihHhwkzrzqvijEE6NEr5TJvasule8PsKVQN/c+AicDmgr+PNhOn++kUX
 mzKVBTqQuJEkmlcCF92dPTp+xMuYVR02IzGtsy72tYwoWEQ/SxREp44xI
 qJijNxKwYopIiS0X6o3YrSI68uZcIa+vJeHPSmdCGIw+XLxct5oaJhxae
 HXfNIv23T7lSfgMMV3z/dGf//b5URkVqcV5Im5HUtvoLsSXXk6GK34a8B
 lWZUJNfUzCcsGU+LQdONlNL0LtCH9pvD+l0Z6f63HLT3U8U14ywX+vc3g g==;
X-CSE-ConnectionGUID: SiD8aaLiQBqybt9uX4t9sg==
X-CSE-MsgGUID: 3rfPI8ZZSyulRujFGP30CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49502776"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="49502776"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:15:09 -0800
X-CSE-ConnectionGUID: A+gMpKCcSvGUQ2+4nYUVdQ==
X-CSE-MsgGUID: 7HfThSnMS/WjUTDGWdPUeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="140347243"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:15:08 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_vm: Update first invalid flag number
Date: Thu, 30 Jan 2025 14:14:55 -0800
Message-ID: <20250130221457.1092670-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250130221457.1092670-1-daniele.ceraolospurio@intel.com>
References: <20250130221457.1092670-1-daniele.ceraolospurio@intel.com>
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

PXP introduces a new valid flag [1], so to avoid the invalid_flag test
failing we need to prepare by shifting the first invalid bit left by one.
The testing of the valid flag will be added later once the PXP kernel side
is merged.

[1] https://patchwork.freedesktop.org/patch/634550/
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 tests/intel/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 6ee3f4634..0730dd3d3 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2234,7 +2234,7 @@ static void bind_flag_invalid(int fd)
 	syncobj_reset(fd, &sync[0].handle, 1);
 
 	/* Using invalid flags should not work */
-	bind.bind.flags = 1 << 4;
+	bind.bind.flags = 1 << 5;
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
 
-- 
2.43.0

