Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BF9C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 09:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14F711335C;
	Wed, 17 Apr 2024 09:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsZYMbvC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3B911335B
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 09:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713347494; x=1744883494;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=BeZXg0rLzka2xUYlKegcaeQp0r7fPj+CEsngsBLvRRk=;
 b=CsZYMbvCbYNsc4/2pNfUtGYFHZzaY5Vkokajc/OVQ5fGFRzgzk/sAR2D
 XKQAOrU5aBqtROA7+EMzmxQxdBXAp9i2XK0MsQ82lUEok+EGq14cFWLY8
 F0clM5tE/wdsvKfVjlOY70IjDEobONW4ejqsLL0mwKC5wH1ZOJ1PeJ1ao
 LzQgitU6Zl7yYk8faTA7N3YWWDMYZP3A+lGIla6u73Ofa3sPQBumuXV5Z
 vHsa0+tiS3OiIzCOcSo+1osI1d0IUJkeKKvxZdAO/xnnyLwHY8RQsHU9H
 W5wk4uHnzenF7J7CsSGnQwVUznkBho6cQc3pRbHFsxE9ajY4KRKwnWboS w==;
X-CSE-ConnectionGUID: TPVEMMlmRpOrsMghhNHxyw==
X-CSE-MsgGUID: u4ZAx7ZoTp6twqx/dtd3Pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="34215341"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="34215341"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 02:51:33 -0700
X-CSE-ConnectionGUID: 6/CC6T1hSo6GNNO6HevSNA==
X-CSE-MsgGUID: P1O/zPUgQgyQ3nXifHw1Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="59981232"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by orviesa001.jf.intel.com with ESMTP; 17 Apr 2024 02:51:31 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 kamil.konieczny@linux.intel.com, Melanie Lobo <melanie.lobo@intel.com>
Subject: [PATCH 0/2] Support for FP16 format in MTL
Date: Wed, 17 Apr 2024 15:33:49 +0530
Message-Id: <20240417100351.10583-1-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231010134540.28485-1-melanie.lobo@intel.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
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

This series adds the support to test FP16 format.

Melanie Lobo (2):
  lib/intel_aux_pgtable: Library to add support for FP16 compressed
    formats
  tests/intel/kms_flip_scaled_crc: Add support for FP16 compressed
    formats

 lib/intel_aux_pgtable.c           |  5 +++++
 tests/intel/kms_flip_scaled_crc.c | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.17.1

