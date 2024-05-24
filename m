Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7B6C25B79
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0AB10E14C;
	Fri, 24 May 2024 08:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgO62EvJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD36E10E101
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716540553; x=1748076553;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=0DI2+qY7oCv7CrUi2Q0xQNMQKAGC+1giWpqEtHKPWew=;
 b=jgO62EvJIzxyjmqOnMhSoC5SUTdBBrn5lqAoK0eBF4YpPmFZPFfSdtUv
 CgkN84DxMXyiRbj7wkCNI/mdouLCNmYwvvDnKZ0+m3B0emztpwlGf2Rr/
 uvopCb//ZdXN5Nf5x88/ZH1639ag2AmEmFiouxGST6Ytc3G74W8xZRVW/
 Hcf9UHFadWLk0lggX/izZjdFuRToHrbV45jgkKToVj5OE4Hq5WN8IUi7r
 WkZMvJ/7NPuX5rtXAzTiU1nzn8qe1Fdg/ieMzIHdszDlLY1v/cE87i793
 Bf2kwxKlDOPw6HEMfv+X77Jz0RMgcu2kaddUkQkOFYeO28JHOhxhsYtk9 Q==;
X-CSE-ConnectionGUID: u8Pom+feTZSGX/zEtQGyZg==
X-CSE-MsgGUID: bJe+ZTXFRsq1/L7VoBJe+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12692323"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12692323"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:13 -0700
X-CSE-ConnectionGUID: 15ZNkO8YSKGgGLFY9CC1Kw==
X-CSE-MsgGUID: ijz/zaEfT0+IaHy161mGpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33940898"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:11 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v3 0/5] lib/gpgpu: add shader support
Date: Fri, 24 May 2024 10:49:00 +0200
Message-Id: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHxUUGYC/22O0QqCMBhGXyV23Wpuc2lXvUeEzPmrP+iUzUYhv
 ntTiIK6/C7OOd9MPDgET867mTgI6HGwcYj9jphW2wYoVnETzrhkkqcUG61kgbZDC8V99FSKrKr
 qSjEuahKx0UGNj015vcVdag+0dNqadhVFZHKg+2Ov/QRuJVr00+Ce24eQrNw7l//mQkIZ5ZBrI
 5WpVakvaCfoDmboyZoL/CNIkz9/A48ClYuTFKZkeZZ+C5ZleQGs3q6vEwEAAA==
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=0DI2+qY7oCv7CrUi2Q0xQNMQKAGC+1giWpqEtHKPWew=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmUFSEMcHymbAc1DJor16NeHkTvOSlUveifrq+v6op
 d97z70SJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlBUhAAKCRAjYrKT3hD91xZ+C/
 9nHzDh9CtXYJiKbGG2UQhGGmUQJsbCry3HqpiBg0iFWSeE7le+LxXDqlG6Ymet4wc1A4vo0vRmpDuc
 ojeopJIbzzGjXorzqrZrtRpLbplAOGDwKaNbBegcRkdGUykgQdR9HfFmTeeHj5sI77F0Z4NzfngsS4
 s0Zo2GKz63Qe7cTaAwG8HqYk3DYmootl0rzZkxijnEO4ppkObfZGi+RJgBSWDPcZ8H3zBCVGfygYwX
 U+fTJT0/2mazf1fT0TIGVnL7v2POPnZZzN7U5g3I8A6QFCmaknHE7Pd/tCV+YAmKCDz+V9gKzddA8U
 B57HXSArb8nMc7g5j/gV+CjwhsoO642HswlG0m9bzMcysaL9uWbqE6fqXkZZ8Vn6WQNGUzpkaXyKBL
 KEkOMr2bHtir5el6XLdv0iBJeh0SVMh4dt68cGC9FJ5hyTgr3ayk4XjxxAZRY41/8Bz6S3+nFn+GPU
 bag/TOVWmt0bzbohBuhTqQwvtjus3CFq2WJCcBpPNJoqY=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

This patchset adds shader support to mainline IGT.
Together with iga64 inline assembly and demo test using both.

The patches were cherry-picked/trimmed from internal branch,
quite painful process. I hope I have not cut off too much :)

v3:
- bumped minimal meson version,
- use old string literals to satisfy clang

To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v2: https://lore.kernel.org/r/20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com
- Link to v1: https://lore.kernel.org/r/20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com

---
Andrzej Hajda (5):
      lib/gpu_cmds: add Xe_LP version of emit_vfe_state
      lib/gpgpu_shader: tooling for preparing and running gpgpu shaders
      lib/gpgpu_shader: add inline support for iga64 assembly
      lib/igt_sysfs: add helpers to access engine sysfs directory
      intel/xe_exec_sip: port test for shader sanity check

 lib/generate_iga64_codes    | 115 ++++++++++++++++
 lib/gpgpu_shader.c          | 313 ++++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h          |  63 +++++++++
 lib/gpu_cmds.c              |  29 +++-
 lib/gpu_cmds.h              |   6 +
 lib/iga64_generated_codes.c |  87 ++++++++++++
 lib/iga64_macros.h          |  11 ++
 lib/igt_sysfs.c             |  71 ++++++++++
 lib/igt_sysfs.h             |   3 +
 lib/meson.build             |  19 +++
 meson.build                 |   2 +-
 tests/intel/xe_exec_sip.c   | 195 +++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 13 files changed, 908 insertions(+), 7 deletions(-)
---
base-commit: f3006a13799e3bc45d754aa8ad318394277d69ac
change-id: 20240425-iga64_inline_ups-438ddfd6023f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

