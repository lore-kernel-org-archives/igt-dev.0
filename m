Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13279CCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 18:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BBA10E633;
	Tue, 11 Nov 2025 18:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lImeh+VG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FD510E633
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762884208; x=1794420208;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wBLZ3paGoEJV/OF/sOC5wMyIfqHVSUvKFoE+eOLFf5g=;
 b=lImeh+VGD7dUYlVb8r7+9lQ1L1IwQ2my0vsx/weAQd9FpF9LE/pMpoBU
 FH+EHhE6LgjUKk4i7GHXH6eJF48jix3jL5THfxw3zbUpNt8K9dApOHiit
 3E07fqC+zmmZb2NcNKqb7yVbUlLF6eIbGE8+steg2xU6Ex2NnS8udRilD
 LnS0MAv29XkS1+WzTMlGPXDJ1VOByOMcCeVexm+Iix+ltmBmpdbaujeQv
 jkdHtFZ3w+ncTQXwGIZHmt2KJsvPDEFuAcEtNcJq2Gibs3cS4eKAFlJqK
 Cib9CmCzXA26hAZxgiWfJ6YCk4UAILIa4FHxD1kXEKe4lUiUrj3eWIW97 g==;
X-CSE-ConnectionGUID: l6piH0vHSuy8LiMI4V/QZw==
X-CSE-MsgGUID: h83Vi+4cQbaOBwBWRkmOjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75634138"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75634138"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 10:03:28 -0800
X-CSE-ConnectionGUID: GnZ5yyuqRSO/6bt3w9LIMg==
X-CSE-MsgGUID: 3nsB7u6wTeCS4HT8QUo4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="189450476"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.223.55.76])
 by fmviesa009.fm.intel.com with ESMTP; 11 Nov 2025 10:03:26 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.poosa@intel.com, karthik.b.s@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v4 0/2] Enable VRSR
Date: Tue, 11 Nov 2025 23:30:02 +0530
Message-Id: <20251111180004.11865-1-mohammed.thasleem@intel.com>
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

Enable VRAM Self Refresh.

Mohammed Thasleem (2):
  tests/intel/kms_pm_vrsr: Add test to validate VRSR with system suspend
  tests/intel/kms_pm_vrsr: Add test to validate VRSR with runtime
    suspend

 tests/intel/kms_pm_vrsr.c | 646 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 647 insertions(+)
 create mode 100644 tests/intel/kms_pm_vrsr.c

-- 
2.25.1

