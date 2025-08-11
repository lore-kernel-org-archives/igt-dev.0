Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C34C87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 13:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920B210E10E;
	Mon, 11 Aug 2025 13:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUzTSB+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B714B10E10E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754917748; x=1786453748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NqiQ2/QkzTxMKeAHwNECDCJ6OWOFcx1aj7FzbV4fPKA=;
 b=mUzTSB+iKqAGkRdcqNhlW9DbhqDQ3RngDQ4zxGmx91oW6vDZwJ3bBUIl
 KnUR4L6gxUjpO+vOFF/lOGHVF/AANKnAQJ8OHVWAQpJnsvKE8MPQepOkn
 KN+f+Aismvt5gwsC5+v7Ls/q70NGtQ55y1ZjmZmP/kvHnNmnKA84+1JGu
 RUQOHzgAd/+A/l0STIBApqLdx8OLLqXi6dFhK0MK3O0qsKDJUptud0UOz
 W09MpWYSDWni+6FwQQFQe2q9FEJ331npw7vJ/+G6F9nmb9y0sdd04FFbH
 FUgbzrt3Wk6R+yk04p4si/VA2SsL1OoImFsAnQ4B4SZAnMfwnp6x/neKm A==;
X-CSE-ConnectionGUID: ZoPupIE4SbGNRg3HC0UqOw==
X-CSE-MsgGUID: hiYLlTsRRFO3qzgGUfa/qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57091005"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57091005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 06:09:07 -0700
X-CSE-ConnectionGUID: FbheyxXVQT6alFnpXlRJUw==
X-CSE-MsgGUID: eO25ZPDZTMy0KxWw/ic1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="203099226"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 06:09:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH i-g-t] lib/pciids: sync pciids.h with kernel
Date: Mon, 11 Aug 2025 16:09:01 +0300
Message-ID: <20250811130901.288178-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Syncing lib/pciids.h with kernel include/drm/intel/pciids.h means there
must exist kernel and igt commits where the files are identical,
i.e. the file is copied verbatim at some kernel commit to igt.

It does *not* mean syncing the *changes* of a kernel commit to the igt
version of the file.

The latest changes to lib/pciids.h have gone out of sync with kernel,
completely missing kernel commit 3c0f211bc8fc ("drm/xe: Add Wildcat Lake
device IDs to PTL list").

Properly sync PCI IDs with kernel commit ccfb15b8158c ("drm/xe/bmg: Add
one additional PCI ID"), including the full file.

Fixes: 26ddb59c1d5f ("lib/pciids: Add one more PCI ID to BMG")
Cc: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/pciids.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index 666265b5f8c8..76f8d26f9cc9 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -872,6 +872,8 @@
 	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-	MACRO__(0xB0B0, ## __VA_ARGS__)
+	MACRO__(0xB0B0, ## __VA_ARGS__), \
+	MACRO__(0xFD80, ## __VA_ARGS__), \
+	MACRO__(0xFD81, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.47.2

