Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D822DD41C3B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 05:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AD010E03F;
	Thu, 14 Nov 2024 05:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/3sFFUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1E610E03F
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 05:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731561481; x=1763097481;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8zDaqSr3J4k5r710vEeFunLMtNBCJ/VBCSHhOM0WULo=;
 b=k/3sFFUem2tNviAA/MTdn2Um9QXfHDOGXGqcQEJNnqDxJ+fdlW2u6lud
 2wj8PL47E6dKu24KVVTd8+1yqhU7hae7xB49MnNr4Hrsg7FzpknFebLK5
 8TsHw/qvs1knoZVfuDZwFIr+rTTSa3VWY55AgMqHXKhOvStidfbYvlHBE
 DVdsdMIYV0Yc95l9v3PeoOLldFRVB0HKCOLisz0gjkHuV7/35KgBO1tOu
 hcaoqKSJeDnqoCDxkJrB0OTRjClUE5V+bc7zGoeZB/IOuOH4kF4r1uyL3
 N5K4Z5pfyYuaq0lJguPyyCzs0B9kjdGLNV63+J6PCUmrBx3b5FgR+m87Z w==;
X-CSE-ConnectionGUID: STFZVdOURdaCjQnXzDnMbg==
X-CSE-MsgGUID: 9pNyumz7SPKeUK98pHyMHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42040895"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42040895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 21:18:01 -0800
X-CSE-ConnectionGUID: OnTWrBp2S8WjV40AZgbjJA==
X-CSE-MsgGUID: hCfL3pAuRbKoz3xA1AAgCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="92555657"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2024 21:17:58 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 swati2.sharma@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 0/2] tests/kms_flip: Update the skip message
Date: Thu, 14 Nov 2024 10:48:33 +0530
Message-Id: <20241114051835.1860727-1-pranay.samala@intel.com>
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

Pranay Samala (2):
  tests/kms_flip: Update the skip message
  HAX: Do not merge

 tests/intel-ci/fast-feedback.testlist    | 92 ++++++++++++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 92 ++++++++++++++++++++++++
 tests/kms_flip.c                         |  2 +-
 3 files changed, 185 insertions(+), 1 deletion(-)

-- 
2.34.1

