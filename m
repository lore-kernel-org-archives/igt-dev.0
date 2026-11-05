Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4D606EE98
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IjEAcSfD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634AB1123DB;
	Thu,  5 Nov 2026 12:46:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134311123DC
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 12:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793882702; x=1825418702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S/ufhmzmWKM00ecWtpdjsRrgWWD3NEdlY6N6mHGnDi0=;
 b=IjEAcSfD5pY2OY7uN7vrnLv/GWFtFs0+emPtOJxQRcXyE9HZng+yTITY
 n7Qfe5suPxFYVChwUOc1aRXyPZR61wpD/Pqkw/t0xko7vqemMDeCkvqnN
 PihISojZ+GdU5jnvEWNoVIhuZbRTQJSieiFKpqaWz7nLZqiETdNj0+ky1
 YdTxFiyZVR5oOdZTVZJxVkeYVCOU3PsAbwKlqY0j4CjBSoV4KeovtYQcO
 9LesVIvQ/RRLFAPfd8BShz8VVNYAR0SwBS9cVg78Ea0xzIfHNgiPwua7y
 OTJSVaU0n/RGyuYypOdTWPQhAMBL8VkQoYAYOPPQSB3GtUNOg6APNkUMS w==;
X-CSE-ConnectionGUID: rj6wyN7tQ7qJYC9bsWnvdQ==
X-CSE-MsgGUID: uz76AUFkRb6PPXx2LXUc6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2768219"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2768219"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 04:45:01 -0800
X-CSE-ConnectionGUID: fBgleGfFQ5ibH/TzxmCPwA==
X-CSE-MsgGUID: nvpr9/K/SLiBQ7V7S2Do3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6885928"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 04:44:59 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v6 0/2] tests/intel/xe_wedged: Add cold-reset wedge test
Date: Thu,  5 Nov 2026 18:00:03 +0530
Message-ID: <20261105123002.1368655-4-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Inject cold-reset at probe, validate the WEDGED=cold-reset
notification, and verify the device is functional after driver
recovery/rebinding.

v2: Fix restore flow (Mallesh)
    Cosmetic changes (Mallesh)
v3: Fix verbose and dmesg regex
v4: Add code comment (Riana)
v5: Modify regex (Riana)
v6: Add platform check

Sk Anirban (2):
  tests/intel/xe_wedged: ignore expected wedged dmesg
  tests/intel/xe_wedged: Add cold-reset wedge test

 tests/intel/xe_wedged.c | 119 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 1 deletion(-)

-- 
2.43.0

