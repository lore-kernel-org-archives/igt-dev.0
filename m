Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703ACCD1296
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 21:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D506810EA4B;
	Fri,  5 Apr 2024 21:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqsMTsfL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478C810EA4B
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 21:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712351194; x=1743887194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=We7Th8U0g22/qzBLmCD2wV6iCYyYzM5diRKN4w5X70U=;
 b=mqsMTsfLKGTFSilDMOqORl9D4AHnKApF/MpHlyPFGWR3KJp7RxG37AX6
 oadKgvhxw1BomZGkJZBK1FzkijVbth+T3ifTKc5hiHzgeHVEpSnS7MJWl
 /A/weeOyWW9TmUy5P+42DAhv3CI2s/0RpFyA9uReM2azVY6uhz0sq/+bw
 Hzo8To9jI/0Ugc1YWZInxxB9mERhxRKH61EdByu8JBMTaQ0QOPthZVtwK
 wpBx/4Po/zel6p1Bewe55aNXomjoaDD7npoY2qK1wtz+Jo6wGJgAeKajD
 V9S2NLqTPZdqmnfkKQYN42AMVoVVesqdip94jHUQqXKhgNlyU/G8PL+/7 g==;
X-CSE-ConnectionGUID: wA2UvVrISwCi1T8/TGoq0Q==
X-CSE-MsgGUID: 59NNve+CTMa+8Y9iCMaizg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7557233"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7557233"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:06:17 -0700
X-CSE-ConnectionGUID: /TcxU+lXSWO09/V8tGUMtw==
X-CSE-MsgGUID: P03tRExRR4eWuc3WW7GLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="19309983"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:06:17 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, stuart.summers@intel.com,
 matthew.auld@intel.com, Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_vm: Fix Sync Issue between Unbind and
 Hammer Thread
Date: Fri,  5 Apr 2024 14:06:08 -0700
Message-Id: <f845a357442bd285ffb26cd0288a97819cd9d470.1712350676.git.jagmeet.randhawa@intel.com>
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

This patch addresses a critical synchronization issue
between the "test_munmap_style_unbind" function and
the "hammer_thread" function. Previously, "test_munmap_style_unbind"
would proceed with it's execution after launching
"hammer_thread". However, the "hammer_thread" in it's
initial iteration encountered an error during the syncobj_wait()
call halting its execution prematurely. So we never returned
back to the "hammer_thread" from "test_munmap_style_unbind".

We resolved this error by adding a syncobj_signal() call in our
"hammer_thread" function, allowing "hammer_thread" to send the
signal to "test_munmap_style_unbind" therefore ensuring the
seamless operation of both threads and correct synchronization.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
VLK-54352 and VLK-55620

 tests/intel/xe_vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ecb2a783c..a25878cd8 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1153,6 +1153,7 @@ static void *hammer_thread(void *tdata)
 		} else {
 			exec.num_syncs = 1;
 			err = __xe_exec(t->fd, &exec);
+			syncobj_signal(t->fd, &sync[0].handle, 1);
 			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
 						INT64_MAX, 0, NULL));
 			syncobj_reset(t->fd, &sync[0].handle, 1);
-- 
2.25.1

