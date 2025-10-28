Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943CFCCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 19:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B2110E64C;
	Tue, 28 Oct 2025 19:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBqKTLKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FCA10E64C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 19:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761680386; x=1793216386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KFLmk7CSx8iadJ91PUaxkU9mThtnFkeDq5VAQWA457I=;
 b=NBqKTLKfQZLR5acQqjSk71InaOt2Ui1X5V4z5XJtyiVay/9ZAla4stiy
 UzE4tCIqMB/GrMxTqivMbeVUv9zx6LU7/69S5VQ0nUA63ZO4CTtwDqDLC
 ndOaP51rznv7nTswLe+jhOIyfkbXn1h8mKKae958hIxdU8ujJbjfj0C0i
 18QvNYUWkSZJBB6erqJc/Go6HiWy6ISAva+GisHkT9ECl/GvrXSKRTHfl
 0T68VqaL07mk3O7/87GcaYlydx6dtFC4G3VFUShXEAJvUE781Pe6iMBDW
 nZw2L55KmYTnb5HgfgPrvKv8n6CTebjdK0KVmMJfKE7Hwu7ClC+5ie4gN Q==;
X-CSE-ConnectionGUID: 9n1Ia0N9TpG2cYjxjfrcsA==
X-CSE-MsgGUID: m9U/ErtqSjK5i1ZfAWvh9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63700413"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63700413"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:39:45 -0700
X-CSE-ConnectionGUID: yybDI3lTTGKUcoL2J7dutg==
X-CSE-MsgGUID: g+REXI6XQx2kOcfj0Alflg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185079872"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:39:42 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v3,
 0/2] tests/gem_ctx_freq: Fix frequency restoration in exit handler
Date: Wed, 29 Oct 2025 01:05:20 +0530
Message-ID: <20251028193519.3273563-4-sk.anirban@intel.com>
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

The exit handler was failing to restore frequencies as it was being called
after the driver was closed. Reopen the driver in the exit handler to
ensure proper frequency restoration.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/intel/gem_ctx_freq: Fix frequency restoration in exit handler
  tests/intel/gem_ctx_freq: Add null termination to sysfs frequency
    buffers

 tests/intel/gem_ctx_freq.c | 41 ++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 10 deletions(-)

-- 
2.43.0

