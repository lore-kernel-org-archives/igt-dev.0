Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3F5C55182
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73F310E02F;
	Mon,  3 Aug 2026 05:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsQh7jbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6CD10E02F
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 05:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785734179; x=1817270179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YgLxcgvb7VB4Z/7J0r5u+803t/ph+PSLgl3ogW9R+wE=;
 b=dsQh7jbbnBUM+JchNr9J2eoJLebg1mSjzE2aGKyTmAQB9FhMFYvFSCRP
 axZdsEct/VAm6TCTpBRqmrMh0yb0efDAA0AuhxWR6nvnF8KrDGCMgbXx0
 MbGu9dGOy9Uwafs86iGordtdWEK/5awMrCzAmLmcHM6Gry42qalYxkEn1
 RYC4bUYI8nfYWL13+A1XMK2fwPY9sygQ5f81eQOP/GxXrdhXlZcN5BgJh
 PHtX6CEn4q8yZigp1nPVOUA6p0E2TGmfIC3TU4weRqzoZKkXLgEtKOafO
 fmOabDfS2yS49+C7tHC6YSFAsBdTfOXJ+XxHcDWfHW5y+caKrj75cTLbm Q==;
X-CSE-ConnectionGUID: lYuncg3VQAOfFPT1QRDTjA==
X-CSE-MsgGUID: 5uD5S9cCRBeN6coCQJrX4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="85392045"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="85392045"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:16:18 -0700
X-CSE-ConnectionGUID: MyD2YX1aTgytrjpxrJ24jw==
X-CSE-MsgGUID: GkcaXCiXSGWj/+QArE9U5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="285751458"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:16:18 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/2] gpgpu-fill changes for xehp and xe3
Date: Mon,  3 Aug 2026 07:16:09 +0200
Message-ID: <20260803051608.61167-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.54.0
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

Alters xe3 shader and touches xehp due to changes in setting canonical
offset differences between i915 and xe.

Dominik Grzegorzek (1):
  lib/gpgpu_fill: Implement gpgpu_fill for XE3 which uses ugm instead of
    tgm

Zbigniew Kempczyński (1):
  lib/gpgpu_fill: Rename variable to reflect function purpose

 lib/gpgpu_fill.c                   | 49 +++++++++++++++++++++++++-----
 lib/gpgpu_fill.c.gen.iga64_codes.c | 20 +++++++++++-
 lib/gpgpu_fill.h                   |  2 +-
 lib/gpu_cmds.c                     |  2 +-
 4 files changed, 63 insertions(+), 10 deletions(-)

-- 
2.54.0

