Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB789C282C6
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 07:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4692110E226;
	Mon,  3 Mar 2025 07:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsqZJ6ON";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0046A10E226
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 07:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740988381; x=1772524381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vbm3XnqI/sogcUqhClhIul+lFlyLqTn4mhxsNpWq5GM=;
 b=BsqZJ6ON2UGXKzqZ+JuQ463tTA16N1kI4c/ugOzd2MqyxMf6Z6fsoojV
 D1GDxOI719gHlIrAhilg/BbQmcrH9u/7q+zCXiauns6YaNLvPkGSB2gux
 myHpHWDl1dZZa2IxVsUsOR/MROZ1mbvrmeT0lB1edIU+VYV6Ie5e+Ckp/
 aTF29fr+6xm9oyFPc+5Wr2lcE6Yghg0jbOJeH++3xPlAcsXDJqU3xLDg/
 b0IGAxxH/Vd30h7PrGJ8e0QuFz+OG8WsOzSQZziT1JCQmzc26R3jOdCZO
 el9UA0nE2Ic5vQ6J5Si/hcBL4+/tXGUSBkuUsCPbk1anmhVxRJLKxiCyv w==;
X-CSE-ConnectionGUID: drKz5bKpQY+zppjlXyoSDQ==
X-CSE-MsgGUID: JztuGDxyThmWGlPGNzT04w==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="29437952"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="29437952"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 23:53:00 -0800
X-CSE-ConnectionGUID: 7knFJTkeQwCsjhGEsyvLig==
X-CSE-MsgGUID: SmTckOt+Tiq85kT5L1ROTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118838736"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 23:52:59 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] fixes for test kms_dp_link_training
Date: Mon,  3 Mar 2025 13:38:40 +0530
Message-Id: <20250303080842.3194642-1-kunal1.joshi@intel.com>
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

Couple of fixes for kms_dp_link_training to fix
commit 983ffca5ff96fd67c937691337f4488e28948aa

Kunal Joshi (2):
  tests/intel/kms_dp_link_training: do modeset before retrainig
  tests/intel/kms_dp_link_training: fix assert for
    igt_find_all_mst_output_in_topology

 tests/intel/kms_dp_link_training.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.43.0

