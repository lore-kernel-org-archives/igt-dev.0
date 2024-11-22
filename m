Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5FFD75E21
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 10:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E8910EB47;
	Fri, 22 Nov 2024 10:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHWd3vuw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DCD10EB47
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 10:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732271379; x=1763807379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZhuNE3Ik29oyGAodriXm3jtSmtpO3c1EsfUJi+Tc01E=;
 b=cHWd3vuwHWRIp8IW12Hq6tafJW0F6hbgQWslu6MHpSTYO6jhKvBzNWSI
 8r4EQUHX27vTbWNFrnVtFnSupZ4gqCbeh39gqZPSnEw+GUhaEr+g/7Irw
 Rkj85HHhASMbQYMMcGfLACcQLeKO4Uu6Xmf/maOYsnftMFC7AszC1dVYP
 pbAkOAMvG22K5ujRlp2DczZJ02+rCVN+IVwcTGkHXiFqccp3YxiaTSl5k
 WJBKbxtcx1j6zRuXintQl3dhqgxsH2fFo5od7xf98OKBTRVXESGKI7UK+
 Cw26XQ26uIkNByGOZdShZl5Q2yHl10cGyzoKwcZbJf9FdRCaNKQjsrjn1 Q==;
X-CSE-ConnectionGUID: ZSpRnoUiSDWdGKtuhwArPA==
X-CSE-MsgGUID: X3d6mL81Rvi/F+1IpoHDpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54929703"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="54929703"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 02:29:39 -0800
X-CSE-ConnectionGUID: svFW2mQmSoOkTwJQ9OfWsQ==
X-CSE-MsgGUID: /aWzUoXuQvaxWjAg+gq/xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="91335647"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 02:29:38 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] intel_compute: Use valid number of array size for unbind
Date: Fri, 22 Nov 2024 11:29:31 +0100
Message-Id: <20241122102931.210761-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Due to copy-paste number of elements for unbind is wrong for xe2.
Fix this as it should be paired with bind.

This is likely subject for refactor and use ARRAY_SIZE() but at the
moment it's a quickfix. Luckily number or entries value was smaller
than for bind so we didn't notice the failure, only there were some
dangling vmas in the vm.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 3ab9ace793..879928ab64 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1406,7 +1406,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		igt_assert(f1 == f2 * f2);
 	}
 
-	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
+	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
 	bo_execenv_destroy(&execenv);
 }
 
-- 
2.34.1

