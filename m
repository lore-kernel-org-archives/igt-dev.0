Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5063CF58C3
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 13:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F3A10E82D;
	Wed, 25 Sep 2024 13:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1aolHr4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F22D10E0D7
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727271013; x=1758807013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GbcrUmxt/a1fIriw1EKAFTDu3jIs2MML8sV1zkqihNw=;
 b=d1aolHr4X50tZIhcQB+wB7cFSpMa1mPQcbPWAKPsUwvoYnMj+jmDytgw
 xzWDo+qyzEGmDIl9pCJa2iKhSCCJe7bS26iOIe8fVpigRCNsGSwXkX//A
 ZLUb0GEfL7s2eObe2sAvk6rt0FSL5kBV7YXugsLQCdIydKBmkEHIZVL9e
 7HY5yambWe6pV74Gml7wXeHLNn60lWYml5R9XTIavDhQjopMMUPL7Y9q7
 CAW/ux5ueUZz7PUyQSdwj5xU13rIywqQU++EKNCwITLDVqXr/rpis0paD
 s6eKkdt3/KbY88JqdYYcO353v6TWaamvxRfM/PX2V3oyfD5BT5yEQtARD Q==;
X-CSE-ConnectionGUID: UVlNMb3iRUe3PNmA/lXcxw==
X-CSE-MsgGUID: ynzLXNVgTE2eqz2gSK1EWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36991720"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="36991720"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 06:30:12 -0700
X-CSE-ConnectionGUID: /Rb51Z7NTXynQOIkI1L/yA==
X-CSE-MsgGUID: Q9vJ2wjoR+6HBitEGIrefg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71665445"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 06:30:11 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t 0/2] Execute and validate 'write_on_exception' shader
Date: Wed, 25 Sep 2024 15:30:01 +0200
Message-Id: <20240925133003.41959-1-christoph.manszewski@intel.com>
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

Hi,

this is a followup to the 'Test coverage for GPU debug support' series
which addresses the review feedback about 'write_on_excepton' shader
usage. Currently it is only used in a negative way thus we don't
ensure that it actually works as expected. This series changes that.

Thanks,
Christoph

Christoph Manszewski (2):
  lib/gpgpu_shader: Add x_offset parameter for
    gpgpu_shader__write_on_exception
  tests/xe_exec_sip: Write on invalidinstr

 lib/gpgpu_shader.c          | 29 ++++++++------
 lib/gpgpu_shader.h          |  4 +-
 lib/iga64_generated_codes.c | 77 ++++++++++++++++++-----------------
 tests/intel/xe_exec_sip.c   | 80 +++++++++++++++++++++++--------------
 4 files changed, 108 insertions(+), 82 deletions(-)

-- 
2.34.1

