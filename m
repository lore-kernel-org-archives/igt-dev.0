Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42326D72A14
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 20:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E299610E2CB;
	Fri, 29 Nov 2024 20:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBHjFUZi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A424710E2CB
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 20:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732913158; x=1764449158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zDnuCbn6NfWXM7vIFpbG3IGYNYbHnB/E+Gv+FBS0tUk=;
 b=bBHjFUZi3TXTyLenViRgwnx00Oh/JaQeO/XrQjkO1VrpCfvvAJHi70kz
 KkcQosnDTlR74MTsFA29bzhdE23YU1oXKcu/stX5RUxyVcHUWabZLj95f
 JBZrXdEcwmB64+O6D9obW/ADhSL1Kd0dDKGZU7KQ2kI5iu+9m48yFyxBc
 81kmmrJJ7ekJ4rX54SpyiQHTJiVQ/SZcxOzVtQPUYbTZGBRQDqHkGL6UY
 IeslF6PXV3hjJjMM3b1sIoYFB/il7aPO0Rrg7TfQ6tJE/jQV3LB07QV8W
 gTHa1z3omIQK8ouirO4Y1maL0P5Et4u3LAprncEATSMN7UWi0my4glEIU A==;
X-CSE-ConnectionGUID: EGAzOllDSK+8vhfL0U/dfg==
X-CSE-MsgGUID: qBnbPM8XTqagQygd6CxOrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33284307"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="33284307"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 12:45:57 -0800
X-CSE-ConnectionGUID: MA68fjX9SmynTNpBL+d8zw==
X-CSE-MsgGUID: IVVL2pYTR1WEEOpGdFB7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="123519881"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.213])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 12:45:55 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Karol Krol <karol.krol@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>, Ryszard Knop <rk@dragonic.eu>
Subject: [PATCH i-g-t v3 0/3] runner: Allow limits at dumping dmesg
Date: Fri, 29 Nov 2024 21:45:47 +0100
Message-ID: <20241129204550.116355-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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

There are few patches, first is a check for write error which could
happen at full disk, second is a revised solution to a problem with
dmesg dumping exeeding disk limit in runner. Also while at this
inform user when an actual disklimit occurred and correct one error
path.

Previous proposed solution: runner: check disk limit at dumping kmsg
https://patchwork.freedesktop.org/series/114353/

Gitlab issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129

v2: correct size in case of no disk limits used,
  also correct one error path and inform user when an actual disk
  limiting could affect what is written in log (Kamil)
v3: dropped patch 1/4 "Check for error at writing dmesg" (Kamil)

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Karol Krol <karol.krol@intel.com>
Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Ryszard Knop <rk@dragonic.eu>

Kamil Konieczny (3):
  runner/executor: Limit reading dmesg to chunks
  runner/executor: Fix error handling at terminating test
  runner/executor: Inform about terminating

 runner/executor.c | 78 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 12 deletions(-)

-- 
2.47.1

