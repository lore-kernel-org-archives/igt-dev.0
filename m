Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2DDC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 14:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2C91122F2;
	Tue, 28 May 2024 14:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mecAnoT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856E31122F1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716905105; x=1748441105;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=YNGidwrZOkX857w1qds6detV7BjqlOpvcyRbzEO/0i8=;
 b=mecAnoT66/hkTHygDr7CIMxdyf/7vhb9gBvw+ulNZuyExYZE6tJ8cNmx
 LP6sZk4ObQWPQGImNFnwPbOE6TxNR2REWMwjoGvC510Yv4fkrOGyeiOmr
 //zhgfy+WoftXzVu3O44k6oYJLWa3Q5SsolvqHZt2V/1dQSAQTzf2tSiu
 FXRdIlSjUfpazTKf7jzTAE3BM7TucJCvmeINed+MIYprfz29jSNjarlys
 3Q9j4OE77/aCT0UgVskBF4VkqCVakmFxcV/AXvsxhZLDe0HS/IF/D89Pb
 0eKarOz1sZwXd7eR+BwWzfIlK0Y7yVURwJS4jHWtW4uydkFjMjqPtRZ2r Q==;
X-CSE-ConnectionGUID: dnMnYYJwSc+RKzkZq0yt1A==
X-CSE-MsgGUID: wDzEWilPR0if788ew85cDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13074930"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13074930"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:05:04 -0700
X-CSE-ConnectionGUID: YDCHUpd1Skilne0O6DiNAw==
X-CSE-MsgGUID: VHBL7y8LRY2UZz95y+ODoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="58273472"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:05:02 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v5 0/5] lib/gpgpu: add shader support
Date: Tue, 28 May 2024 16:04:46 +0200
Message-Id: <20240528-iga64_inline_ups-v5-0-fdd8e9dcd64c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH7kVWYC/4XOzU7DMBAE4FepfMZgr3+S9MR7IFQ59qZZqXEqO
 1igKu+OUwkBpRLHOcw3c2EZE2Fm+92FJSyUaY41mIcd86OLR+QUamYgQAsNhtPRWX2geKKIh7d
 z5lq1IQzBClADq7VzwoHer+TLa829y8j75KIfN6hWloRueppcXjBtjZHyMqeP64cit97XXPd3r
 kguOGDnvLZ+sL17prjg6dHPE9vmCnwDRt75W6ACtlONVr4XXWtuAfUDAH0HUBsAGhorG49B3QL
 6P0BXwAMq6Y1B0f4C1nX9BEgOGOWVAQAA
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2432;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=YNGidwrZOkX857w1qds6detV7BjqlOpvcyRbzEO/0i8=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmVeSLN52tp0NrM984OjaKHSka4W6YdmpM6EGzv3ww
 vVNtxQ6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlXkiwAKCRAjYrKT3hD91wemC/
 9qsdNleapcqsx+7tMR9tZ/rLlvry6VupO/JRKJ5AFKg1qXDYXyFHbTFOxq1OmQFsiyhJLdg5IvcbEh
 8u0+jqwYwwfLClsgr9rDr1J+HxTpnkwXrahCUVK64Q9hIh+7T4zGC+uq3Uc31jSVz4Sq+/LaF2FGxq
 +XmHwKrBPe6EvRedyj1r3Sevcl/78LP6fBvb2CPkJe2yr3s/Kp5uZG6r0x8lpmKWnevfVW6QDC8/iI
 XXMXWMChxN8mlzElUpPjz4IQEj60JKJdlkNqrkB1OqMCXqYYWwga3T35DdajecwgY8d3byYoVlDsZl
 IvnUaadFuHyIO4EQvIY1kt2l4ibSgXny8oJ3LBtpohe2XKvfRhuxAY5hD+lfdfckMxkkG1/SycIxfk
 LkKmeYDLuPA/LbA1iQ3s34py4fhrtXZ0I6iouq3nf03inbm95Ajy6NF8c0uqsiGaPVFDg/ZGyJftY2
 7JZR0KP/+tEGg8yr9FSiwqpUa/rxypvvkqz8qTPK70tfU=
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
v4:
- bump meson to latest version supported by CI builder
v5:
- just small update, to ping potential reviewers :)
- revert back required meson version, instead use old syntax to make CI happy

To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com
- Link to v2: https://lore.kernel.org/r/20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com
- Link to v3: https://lore.kernel.org/r/20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com
- Link to v4: https://lore.kernel.org/r/20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com

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
 tests/intel/xe_exec_sip.c   | 195 +++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 12 files changed, 907 insertions(+), 6 deletions(-)
---
base-commit: 1d7b961235e345db20933c057f265898e2e96fd2
change-id: 20240425-iga64_inline_ups-438ddfd6023f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

