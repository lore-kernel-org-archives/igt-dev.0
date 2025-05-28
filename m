Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1454C5AD49
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 22:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C99C10E6DD;
	Wed, 28 May 2025 22:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hY58DDjc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5115710E0C6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 22:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469910; x=1780005910;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=omewpQCaYpgjRkt5wJZ4bNY44WjhnIAjJbd0bwLYDE4=;
 b=hY58DDjcln6vyfXqr5JE5dcuHdGwxuGTepHI65cjIj+o7iORf0Kc+Tzf
 o3y1gxumX6iAN7isp49omSPViW2dSTO5qKYPmaVtfYmgueS6CNxHWZHFH
 WDwRyUo6XXa/m/jBoJhHdB+EVaNsM454eOy8OFST48cnc08aTVFGKeAjS
 Qrf9CDAaoLWY0Z8vjUc4xQ3p1QRuZVTfDgr+tvOMTjq1mlNEczyzjg5zE
 E/QaSfLUHGlPbh9NyPtHGmwaipCj4mQtVz3kxY6clEMzgxWb7HKDGlH0a
 duDISZ1bDWPQL+HyT7JRLrZJeMrNusSKH+bYPDQ2Idp64YAILT4+aGyli w==;
X-CSE-ConnectionGUID: qaKx573uSI+Eg4yI/kEkPA==
X-CSE-MsgGUID: G3ZyuhE1QtGPoUf98k5k3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50670361"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50670361"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:05:10 -0700
X-CSE-ConnectionGUID: v6FWY70LTwOyI4JZuJ50MQ==
X-CSE-MsgGUID: UcW55UkySKmP2/oQyTq9Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="147251891"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:05:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/2] xe: Add test for engines_allowed in configfs
Date: Wed, 28 May 2025 15:04:33 -0700
Message-ID: <20250528-engines-allowed-v1-0-d42708b3317e@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250528-engines-allowed-75d546df45ae
X-Mailer: b4 0.15-dev-d9694
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

Tested with the pending patch series:
https://lore.kernel.org/intel-xe/20250528-engine-mask-v4-5-f4636d2a890a@intel.com/

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (2):
      tests/intel/xe_configfs: Use openat to simplify check
      tests/intel/xe_configfs: Test engines_allowed

 tests/intel/xe_configfs.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

base-commit: f564652c85f6bf5e6e076526fe0de7c96dbbe0b2
change-id: 20250528-engines-allowed-75d546df45ae

Lucas De Marchi

