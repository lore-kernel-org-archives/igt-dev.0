Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4769160A2600
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e38jB2rZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F106410E004;
	Fri, 20 Nov 2026 18:27:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA0B112C5B
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 18:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795199190; x=1826735190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6sul2JgWJHDePu/+bkkv8GnXVXwerwsC1LGC9if3YIU=;
 b=e38jB2rZqwwjwF8VrT7VUazLwb49TY3Dcd36U8WOIKMNG9P5M3/HdqNQ
 97JEpSA1/ENGvcwmR6mBI+yELC5jsFoOHJQVRblejy1/06hpXh+pk3hlO
 pM0xMQgVapwLeTvyvdC/qz+Aqteb/yhnIXIxBbdeBBWCioB6DHw08hbYY
 nyxs2tXWvBz2m8Y1C+i8LeQI4D6A6RjD2tn0Idwce/D5QuOwTVeE2/M/u
 2kEIcUB14f7nceOXztk5aINH/UM+e2QuVfgDtkaqGPp6CwrjDGGk1AieC
 A5HBDlhOsfyyO0A71f7ImdPek3Io7XEMsmFwEJPLEvxrzM+DUSIFFXu+X A==;
X-CSE-ConnectionGUID: iEOoDk9pQO+n1WaEdyxZgg==
X-CSE-MsgGUID: aoeb5CA5T2Kfi9b8KxLbaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4126732"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4126732"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:26:29 -0800
X-CSE-ConnectionGUID: VWQ8Z+W5QEG71O06L5rbQg==
X-CSE-MsgGUID: 7e0Hhfh4T36ju7+/7MID6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11101444"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:26:28 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/3] tests/core_sysfs: Fix logic for EIO and other
 fixes
Date: Fri, 20 Nov 2026 19:26:11 +0100
Message-ID: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

First patch fixes a logic for EIO code path and
also adds few more cleanups and checks for errors.
Typo fix is second patch.
Third patch changes most prints into igt_debug(),
so the output of running it is small and fits in
single screen. Example output:

sudo build/tests/core_sysfs
IGT-Version: 2.6-NO-GIT (x86_64) (Linux: 7.0.0-44-generic x86_64)
Using IGT_SRANDOM=1795186221 for randomisation
Opened device: /dev/dri/card1
Starting subtest: read-all-entries
Reading sysfs files from /sys/devices/pci0000:00/0000:00:02.0/drm/card1
Summary: reads=293 fails=0 not_read=64
Subtest read-all-entries: SUCCESS (0.007s)

v2: split typo change into separate patch (Kamil)
  change most prints to igt_debug() (Zbigniew)

Cc: Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (3):
  tests/core_sysfs: Fix logic for EIO and other fixes
  tests/core_sysfs: Correct typo
  tests/core_sysfs: Change prints to debug

 tests/core_sysfs.c | 44 ++++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

-- 
2.55.0

