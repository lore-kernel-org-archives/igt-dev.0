Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5909C25B75
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 08:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3336C10E301;
	Mon,  3 Jun 2024 08:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmguaQ8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7FB10E2F7
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 08:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717401829; x=1748937829;
 h=from:to:cc:subject:date:message-id;
 bh=zm2xMnchWoPuLcgPBe6rg92St+RWPuUm022Adbxu9/4=;
 b=KmguaQ8rTN/TIOm6QTUUhBL31wnnGqk0l8c3bPvYflDuAo4GXRj0wn7F
 sTVd3Fy7NFyFLAHi+gclSo6Az6/icNhb/ak8wUW1JF2Wy6NuX63cksBnI
 b2NRYQ4xowGoY8SxqYfuShxGBhfWy/TUHh1ePklgeQnYv3HgZ4LnEcASc
 zaSgnJRiR+un0hwX8g8VkPhZoZaDe72SLY0WA3rAyp7+ICElrJr42myMv
 Le+FvvtQ5jrxGhMJMl0DJO+qdw0frr4w/uURsZMX+z/qEaGZeU+n1kwYq
 i6yYA9PUkSUKLOeNknNByL5mTpA+UJmhR9F9Ah9VANEEb2fbuIKdjZSF5 A==;
X-CSE-ConnectionGUID: X0WPuXrsTw6HwyHM6y1Ilw==
X-CSE-MsgGUID: bWMUpuTKTI6IQlSe8gfoRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="11870469"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="11870469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:03:48 -0700
X-CSE-ConnectionGUID: BSR6UE5NQxWchgVPhHc6HA==
X-CSE-MsgGUID: nDwAV/tERlaQIRUbCc5OHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="74293331"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by orviesa001.jf.intel.com with ESMTP; 03 Jun 2024 01:03:47 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vidya.srinivas@intel.com,
	Melanie Lobo <melanie.lobo@intel.com>
Subject: [PATCH 0/2] Support for RGB16161616_64B compressed formats
Date: Mon,  3 Jun 2024 13:46:05 +0530
Message-Id: <20240603081607.30930-1-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
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

Support XRGB16161616_64B and ARGB16161616_64B compressed formats

Melanie Lobo (2):
  lib/intel_aux_pgtable: Library to add support for RGB16161616_64B
    format
  tests/intel/kms_flip_scaled_crc: Add support for RGB16161616_64B
    compressed formats

 lib/intel_aux_pgtable.c           |  5 ++++
 tests/intel/kms_flip_scaled_crc.c | 42 +++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

-- 
2.17.1

