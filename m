Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9C5D637A3
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 17:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B3910E286;
	Wed, 13 Nov 2024 17:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2m648+2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D9710E252
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731520439; x=1763056439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PO6Ll0foXRjCaW8dXjmmyEmz7SPwzH7SSTiMwbbZb6U=;
 b=T2m648+2ijWMr/8Wf4eQsZEVJhiaCt3dnd1MtSAUtvuAnzIQQu2PFQZ8
 nlxaPB263/mfjox0z5Z7bnG2wmgaJ2xcaHJ4g8POvAT0qGj+zv0+ukPCm
 O4tVSKxR9BO6Isp+waVivAOpW3fBhaqwnVfWtOVvy4wHt04fylqjzUyAA
 LyG8XnN62uKC2efURpTVGP3/huxz2tq95/wNgmSH+k/zsiN4Abd+131iN
 e7TTW5oxxNUCrb4WcD7rRQlaTOjnM7n0Yop6Fc3bUetPuGjKFL17WePZb
 044CU7PCkU19U40QIfbjH9uV6G4JeGdvvicDYQL1n8ebXLy44Rsm4EcWU Q==;
X-CSE-ConnectionGUID: 5naNLGEYS8OJddlkCU5F1g==
X-CSE-MsgGUID: z217tlTHT+2nvdi5zzuQ2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31666700"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="31666700"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:53:54 -0800
X-CSE-ConnectionGUID: D0N0vJqvRuS4denTgsz7Ww==
X-CSE-MsgGUID: xdjxAei6R4SbPariCIyLuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="91984938"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2024 09:53:52 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: lucas.demarchi@intel.com,
	igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 0/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Wed, 13 Nov 2024 23:22:05 +0530
Message-Id: <20241113175207.399101-1-pravalika.gurram@intel.com>
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

move the spinner related functions to lib
check the ctx_timestamp register post gt reset for each engine.

Pravalika Gurram (2):
  lib/xe/xe_spin: move the spinner related functions to lib
  tests/xe_spin_batch: Add spin-timestamp-check

 lib/xe/xe_spin.c            | 116 +++++++++++++++++++++
 lib/xe/xe_spin.h            |  40 ++++++--
 tests/intel/xe_drm_fdinfo.c | 200 +++++++-----------------------------
 tests/intel/xe_spin_batch.c | 121 ++++++++++++++++++++++
 4 files changed, 304 insertions(+), 173 deletions(-)

-- 
2.34.1

