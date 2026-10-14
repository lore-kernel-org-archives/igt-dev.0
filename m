Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57760CC6B1A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 16:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0883810FFD2;
	Wed, 14 Oct 2026 16:07:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1D510FECF
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791993924; x=1823529924;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b01RT9DUPRRsm93rksKw34tIb4tCQ2ABMHtbVqJWKUc=;
 b=BYmRHzxzMrp5xlk1yQksCET5Z9N4wC/COajfVF13J8G5umzs7dHyrLuF
 7ATjypmaRNx1JwIa1FI5FCY0LkoeLH3MEOjbGBBLu7tQCj6UziHpBQLsC
 jfjvsjd7sDVEDk/ORXYaqWycSl+rqBvYhfgu7KfD3oOm7TwfDd0tgkUrf
 upfS25ytIYqNc/v3aEi78k675VfopHkxJT2AWdsXumXqeZ9mxCjt27rlT
 b9jFGccd4Gn3IRtz28UBRe96XdJRm/51hMzWn4hbSadBHekxss5CBNDTX
 VoOXf2JFxa1byekgUoXlPghhP0Fv2fnmsyubqUZOR0yiciZbx6r4HKSqn w==;
X-CSE-ConnectionGUID: ngLsmMoLSoqE4Q9H4G5Cfg==
X-CSE-MsgGUID: /Sj9h1M2QkK/cn+piqbPtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="733461"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; d="scan'208,146";a="733461"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 09:05:24 -0700
X-CSE-ConnectionGUID: I57IrOPIQWeWX/alSXLB4w==
X-CSE-MsgGUID: yMBlzfqsQ+SBHITZ6sv7uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; d="scan'208,146";a="1427992"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 09:05:24 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: igt-dev@lists.freedesktop.org, frank.scarbrough@intel.com,
 david.e.box@linux.intel.com
Subject: [PATCH i-g-t 0/2] Support PMT for BMG and CRI devices
Date: Wed, 14 Oct 2026 09:05:15 -0700
Message-ID: <20261014160516.3542311-4-michael.j.ruhl@intel.com>
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

BMG and CRI devices have PMT functionality.

Provide tests to exercise that functionality.

Michael J. Ruhl (2):
  test/intel/xe_pmt: Add testing for BMG PMT features
  test/intel/xe_pmt: Support CRI PMT

 tests/intel/xe_pmt.c | 645 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 646 insertions(+)
 create mode 100644 tests/intel/xe_pmt.c

-- 
2.43.0

