Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6013F8FA88
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 15:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A5B10ECF8;
	Tue, 21 Apr 2026 15:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvhqBLqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E592B10ECEC
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 14:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776783598; x=1808319598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lcto40a/O5qEuzKcSHof4t1KfOMn/j13csnynj6KjUw=;
 b=FvhqBLqIyWiIvN89Vfqh6wMjS0Oddkzo2+6KsPOKntYp0oM4EYUtktFt
 zxIA9qnmv46U3n+ZKYks0bJa+BynkMtecBntUtjC8gNH1zDIXIQrXQK9K
 Hdr02hlYqVnmMbJW0ZOYFOc/rcSl7NfH1/2fNy9S06AiQ9X04/yRyw1oj
 eByAJdmM6ScSCg4+zv8BcNseLyiJVEnpibNeJjJVBvnoQpEAUEv1ju7y9
 odyh7tSNTY14nnfGccRsMuUGF+8Rk55jlWNIVAXvpzmGR0DUCtOV0KpHp
 Zqr+35YyGJ5e4KQeQF05r2e+zv21OqkNCSnA0wWneRjnE9B6ZqxGEUisZ w==;
X-CSE-ConnectionGUID: wJLhzrMMRECU5V6cPB94CA==
X-CSE-MsgGUID: a7eJ5cwoSsKKnsX/956AiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="76751411"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="76751411"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:59:58 -0700
X-CSE-ConnectionGUID: pnMS/QRJRTe2dgRwbrjj3A==
X-CSE-MsgGUID: 1NvSlNChRrWDX4LD9EuvDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="225549170"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:59:56 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2] lib/drmtest: Create proper error report when open
 driver fails
Date: Tue, 21 Apr 2026 16:59:50 +0200
Message-ID: <20260421145950.55091-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When first try for opening driver fails then opening function is
searching for next available device. When that also fails
reporting is printing last errno which could mislead developer:

$ build/tests/kms_dp_aux_dev
IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:754:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4294965755 (any)
Last errno: 2, No such file or directory
SKIP (0.006s)

ls /dev/dri
by-path  card1  renderD128

The real problem here is lack of permissions as there was a card
but program could not open it. Break looking for a card as soon
as an error is different from ENOENT. It will create a proper
error report which will print:

Last errno: 13, Permission denied

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4a788ea7a..66982f653 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -443,6 +443,11 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
 		fd = __drm_open_device(name, chipset);
 		if (fd != -1)
 			return fd;
+
+		if (errno == ENOENT)
+			continue;
+
+		break;
 	}
 
 	return -1;
-- 
2.53.0

