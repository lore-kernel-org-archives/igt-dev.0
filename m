Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4B9CEACCE
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 19:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE1510E09F;
	Tue,  1 Oct 2024 19:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwL7Bi5n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DD710E09F
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 19:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727810099; x=1759346099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SIAfvd/kX9397HT9OJr0C/zGW0dtd+Y8wsQaQgwdaQc=;
 b=fwL7Bi5nbC3M086XK617Lw8t7VHDAecQYZ6uIE4YWyugJrquUGr9SkA4
 nFKt4gNv/6sMDiHWjo4RNq4HUK4uwCjKyrWUOPLOlFP9oI9+RAiP2u24A
 VGNxdRw8ZZ2dPf8VPncBN2B49vq1D9wcFbb3xQyA+bf9yGS7NQUxOpeJK
 WUQsQMKN6aHmsJO8owrtbRBv6PTso+wBMG8kr9PD4ClhfTnUnI10H3JM9
 5H6hcq8f1rdm5DUVCdk/LYoEqQajMwPiJtt/YrHybCHbPbttLywsUULKi
 ac3DpInl7ryO0lOx7G1M5Mic13oadXfIydmFj3830QtJNLPBFClzAVxeD A==;
X-CSE-ConnectionGUID: uPNAjXylQYuoSYRFtwhNkg==
X-CSE-MsgGUID: 8drO64XsR72l1d4P0MSXpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27099344"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="27099344"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 12:14:58 -0700
X-CSE-ConnectionGUID: 59b1h7NuRRGhtUGcyGrkVQ==
X-CSE-MsgGUID: NCbnpu6zSv+8blTIJVvdcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="73802491"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.145.169.64])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 12:14:56 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, soham.purkait@intel.com
Subject: [PATCH 0/1] Existence of gtidle node check before rc6 disable test
Date: Wed,  2 Oct 2024 00:42:29 +0530
Message-Id: <20241001191230.113540-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: "Purkait, Soham" <soham.purkait@intel.com>

Rc6 disable test has been modified in order to check the presence of gtidle node in sysfs gt0 path.

Purkait, Soham (1):
  Check gtidle before rc6 disable test

 tests/intel/xe_oa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.34.1

