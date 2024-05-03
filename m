Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EC2C4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 19:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D514710ED23;
	Fri,  3 May 2024 19:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DrtloLo7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2C910ED23
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 19:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714765956; x=1746301956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZQpB/6u7sU77HRSV0wnbvedcU0goZyK143ywiSUlkhI=;
 b=DrtloLo7FSv+FPv3oy8YyEkbMH/itNYUQ1kv7NNG7+r1yjLP1f/QGMSX
 DREW4A9T4tasgZbxvYt+BAmOhN1FrtOmhJ+NmGXya15e7i5RQ1o15I4la
 5wH1KpGK47i2S7plvxCxue5zuxIcJZBfnrLoe/ng3f322jvTZ06yeoKcy
 in1Yf2EMvjZfRV2StL7nleelQ8T0R+s38jB/gvUpFj8gtIEg8LZk/9B1E
 u93atKYbSe/xUbJv82HV0il6Jz1GqweE+B5koZlVZWAcQbwonC94yGhMr
 fkH78YDkgyFQd/igZtp6RoFPFMnj+P5gvwHcaK3KSypzAU35XXKrGp7Li A==;
X-CSE-ConnectionGUID: esJWzn3aSxWX0FXjUJHjXw==
X-CSE-MsgGUID: UuDPuSdnRn6JDRE98Si9wA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21270017"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="21270017"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:52:31 -0700
X-CSE-ConnectionGUID: OoW5hsvMRQe/3Oy8SYzrnA==
X-CSE-MsgGUID: F516nxU3Rte6CrWajrPFEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27632608"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:52:31 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com
Subject: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Date: Fri,  3 May 2024 12:37:14 -0700
Message-Id: <20240503193714.1967850-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240503193714.1967850-1-jonathan.cavitt@intel.com>
References: <20240503193714.1967850-1-jonathan.cavitt@intel.com>
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

It's possible for xe_supports_faults to return false if the system is
busy with multiple running tests.  This is because the check looks for
all active VMs and searches for VMs that do not have faults enabled,
returning false if any exist.  Recently, this check has been changed to
return EBUSY when the check fails in this way, so wait for up to ten
seconds for all the active VMs to flush out before proceeding.

Suggested-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/xe/xe_query.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 6df8f42649..5458c73417 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -314,8 +314,13 @@ bool xe_supports_faults(int fd)
 		.flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
 			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
 	};
-
-	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
+	struct timespec tv = {};
+	int result, timeout;
+	do {
+		result = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
+		supports_faults = !result;
+		timeout = igt_seconds_elapsed(&tv);
+	} while (result == -EBUSY && timeout < 10);
 
 	if (supports_faults)
 		xe_vm_destroy(fd, create.vm_id);
-- 
2.25.1

