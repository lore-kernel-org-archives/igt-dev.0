Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9286BE7716D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 11:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCE510ECE4;
	Wed,  4 Dec 2024 11:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiNqfVSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8848010ECE4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733313439; x=1764849439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hIBo+zKeCIm1jFaFT4Gf1BX59613oqIji1TzD8tNASg=;
 b=jiNqfVSeQHv1R5t/53mJc7IGwICL489ChkGrqrKO3fWJ+FVsTGvZ/OC3
 Bs7GLCR4nuCjJ+vq4ymHSx/mGdtJtaxZR8wg5V4pyyY6gOvJz/IKnQ5c1
 6z/17ktGQ/D4Azs5la2fuWXFInd8JqvBL69YbD8d8/1pzv8UmK+f7z6Yz
 k/DsfVyI+GDQZWIkt7sMlXtKiHCJxBp3ykXTJpsMbe6p3BVIXHxCWXBXz
 aIkC1I8hBDJkSFfnmHFGjzBadrldd8lB4KflKQhlZfI4TogLy4PE/q4e0
 J+ZU33l0DwgVknUrxMX3ZqOrANEGGLRb55lxKKc18Y0rwnt6u2Y6UY9i0 Q==;
X-CSE-ConnectionGUID: VkDUIAboRoSLe1/5y01yzw==
X-CSE-MsgGUID: mcCh3fTdTKmgRRiBbfg6wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="51107634"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="51107634"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 03:57:19 -0800
X-CSE-ConnectionGUID: nIcAmZmZSZ+YqjYZcTE4Pw==
X-CSE-MsgGUID: KDTkT+A+TMyVC5VDH9dJ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93419223"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 03:57:17 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 0/1] tests/intel/xe_exec_store: Introduce long-shader
 tests
Date: Wed,  4 Dec 2024 12:57:04 +0100
Message-Id: <20241204115705.5455-1-dominik.karol.piatkowski@intel.com>
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

Introduce long-shader-bb-check test with dynamic subtests dependent on
available memory regions.

These dynamic subtests are core version of
xe_eudebug_online@writes-caching* tests.

Each dynamic subtest writes incrementing values to 2-page-long target
surface using long shader. The bb is searched for full shader, expecting
it to exist. The target surface is checked against written values. Each
dynamic subtest places bb and surface in different configuration of
memory regions in order to validate memory coherency.

v2:
- Change separate tests into dynamic subtests
- Don't use dangling hwe
- Use xe_get_memory_region_set and for_each_variation_r to iterate over
  all memory region pairs
v3:
- Add missing igt_collection_destroy

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  tests/intel/xe_exec_store: Introduce long-shader tests

 tests/intel/xe_exec_store.c | 102 ++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

-- 
2.34.1

