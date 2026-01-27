Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7F2D2D8DF
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64A410E027;
	Tue, 27 Jan 2026 09:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITiENvQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCD810E027
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507700; x=1801043700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gHE/+AOUXf55XzdrY0uOC2klt5Q9XYMHZNYi8xDXL/c=;
 b=ITiENvQAfVA4Q5oXvmWeT4zjV+HmBdCy2+WuKbFC0i/t4tPh5KNDQdyk
 ELH24HTS1j527ucz0ffIRb7HdaDx+vZSL95PIfcGrr833B15hV5P7FHXE
 QggYZTiSJMTOVZ0q1x2nPzxa0pK7NgUpSbPrmZahzpxfeFTp4IQ6qlN9A
 nDn2t8QztKndxMIQ/n/bWiP0wCRIbNghBbTm629Q5dXA1uPC73Yo+zdmY
 dwRsj5CBIZhbm10VUsBN38ANPt6mHRXodI/O6bvpNWemtsLd6c++sbtbF
 VZocP/tJr6w71904QKba+kNUV8L81lSoVZaNcDEC02ciscB0ex2sbNzbk g==;
X-CSE-ConnectionGUID: h/zqVHGHRsKNt03Lj4LPDA==
X-CSE-MsgGUID: sayYqhnwR2qnoFHrMC4aDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88276833"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="88276833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:55:00 -0800
X-CSE-ConnectionGUID: NynIwV21RamJ3X/dCRsCMw==
X-CSE-MsgGUID: Oq177Tz6RYi4tJy5Jc+9AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="239202156"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:54:57 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 ville.syrjala@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 0/2] lib/igt_power: Ensure RAPL reads on correct CPU
Date: Tue, 27 Jan 2026 15:24:31 +0530
Message-ID: <20260127095430.536088-4-sk.anirban@intel.com>
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

Adapt to kernel changes that require RAPL MSR reads to occur on the
same CPU where the perf event was opened. Pin the thread to the target
CPU before reading, then restore original affinity.

This fixes compatibility with kernel changes which enforces
CPU matching for MSR-based RAPL operations.

KMD changes: https://gitlab.freedesktop.org/drm/tip/-/commit/1d6c915819f5b805c35487b6ce5923e31a28266b

Sk Anirban (2):
  lib/igt_power: Ensure RAPL reads on correct CPU
  HAX: Add toggle-gt-c6 test to fast feedback list

 lib/igt_perf.c                           | 36 ++++++++++++++++++++++++
 lib/igt_perf.h                           |  1 +
 lib/igt_power.c                          | 17 ++++++++++-
 lib/igt_power.h                          |  1 +
 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 5 files changed, 55 insertions(+), 1 deletion(-)

-- 
2.43.0

