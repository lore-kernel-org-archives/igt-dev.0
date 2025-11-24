Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70AACFD318
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 17:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E38010E102;
	Mon, 24 Nov 2025 17:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5awL2cC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC6F10E102
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764005141; x=1795541141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bKVCWPK7acZdZjhXAdn24uKygapqGJd+WZb0c3ihi/c=;
 b=L5awL2cCLflo6q+rKrBUoXzPCFr0XtzW6Fw2aOq3qk2i2kXG+kK2ET0Z
 BL8/29x6lsy2UWI8B34h5ZNmlBtI6gZXDhk/UvGFn0UL+2qC1xXB88U1Z
 HTQjROYvOhJ5PYPt2kGAnhBabzq7S9NSNu5TbpVMVKtqla7mADt0F1B9k
 NjXVspqSeqwBxhtc8c2rmj3OPcpevrUAzJIgARtsp8zb4lqLmKagg0tBQ
 ttHGyXCWQImp+9S7f4RYhdTF3HboQ5vFKStffHd15XQsyAlSbNnfY9ArW
 kMURa0wlKzZ1tlTudYRPEqD/laWyIMlai6otctIV++sA4vyfjiRdAKiZ9 w==;
X-CSE-ConnectionGUID: aC5ug9BcTUaoALE65dBxxA==
X-CSE-MsgGUID: +cTrnGq+Q0GB35xwjYuf5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66170867"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66170867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 09:25:41 -0800
X-CSE-ConnectionGUID: aBcFF4R4SYqPpn3Svac7AQ==
X-CSE-MsgGUID: yqQufu6xQU6+R6xIhfRbQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196550629"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 09:25:39 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] lib/igt_dir: Fix fdopendir usage
Date: Mon, 24 Nov 2025 18:25:34 +0100
Message-ID: <20251124172534.61724-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

After successful call to fdopendir(fd) the fd should not be
used.

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_dir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt_dir.c b/lib/igt_dir.c
index e232dbda9..0dcbbf191 100644
--- a/lib/igt_dir.c
+++ b/lib/igt_dir.c
@@ -223,7 +223,6 @@ static int _igt_dir_scan_dirfd(igt_dir_t *config, int scan_maxdepth,
 	}
 
 	closedir(dirp);
-	close(dirfd);
 
 	return ret;
 }
-- 
2.52.0

