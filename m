Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25A8606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DNrshK3s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8990110E63E;
	Wed, 28 Oct 2026 14:47:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112C410FCE9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793198807; x=1824734807;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=hfT6gY54VJOmpgfePIzMBKy/upVmOVaEB0Ov6TJE+/Q=;
 b=DNrshK3sj0pVsSTlLbVIMAQN7EOns3rpnElyNnKF30abmYC2u+rxBW/3
 UWVtwfR+gdWZceoCg4NXlOs1BFmyFZsEzaHiGcyR0+4hgH4/UIxop05fB
 URg30p5gxGD4kipBXOt34DdVfGlbb1ykkYWKzAYz6vX1W5rJEX0qe99Xu
 n07SddEiFJQDiRP0x1qKzzvdjUK6dv8sg5/QnVKtNJpI6DLGQs7QdItGX
 FB9BruOL+G+g01MYOgNB8DgtiKAC5lICvWaSXd8KVG7I/JhAa3GKm6VBW
 /LmO+AU2yge2+wLLhlp/UA5ybiFDIMMk7vg/IOO9x9NUgOEjuSI6zCXGE A==;
X-CSE-ConnectionGUID: Ym9Zv0bORAuVtSmt/Mxkbg==
X-CSE-MsgGUID: 9gHBdUzKTFGQOwejm7wH2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1924482"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1924482"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 07:46:47 -0700
X-CSE-ConnectionGUID: esuyvgv7TP6F6jrp0C3W0g==
X-CSE-MsgGUID: IYa7e/4hS1uSUY5jvs8C0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5208412"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 07:46:46 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 0/2] xe/shaders: remove explicit regioning and channel
 offsets
Date: Wed, 28 Oct 2026 15:44:27 +0100
Message-Id: <20261028-remove_gpu_asm_annotations-v2-0-270a5878b2fc@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEsK4moC/42OWw6CMBREt2L6bZVWHuKX+zCE3MIFamxLegvRE
 PYuxQ34eSYzJ7MwQq+R2O2wMI+zJu3sBvJ4YM0Atkeu242ZTGQuEllwj8bNWPfjVAOZGqx1AcK
 2Il6mqlAXeU1F27JNMHrs9HuXP6of06Se2IRojA0FhFx5sM0Qo2mk4BHM2QAF9LExaArOf/Z/s
 4imv67MggueZZB0KheqzNu7tgFfp8YZVq3r+gUXSVfT+AAAAA==
X-Change-ID: 20261027-remove_gpu_asm_annotations-94b7b32841dd
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.17-dev-6be7c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=hfT6gY54VJOmpgfePIzMBKy/upVmOVaEB0Ov6TJE+/Q=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBq4gpWap/P1cPgzfZHDGSsAFobSO4rlQYm/8Qzy
 kzdYyHZmkKJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCauIKVgAKCRAjYrKT3hD9
 11mJC/sGBFtrQgrxYR3vkjXp/Yuq1DRUYnP0ZErD6p2icBHFb76y0Eq1+XiaujH1rduK4qoBb1s
 +aTUT9pvrRruGUVXRgdgPEnSvzTE6GDF/EaRgQeI6OsgI4pvD5+UmkvYpli/Lc4CTQ1BkncohLI
 eL4bbwZc3aojfb3ZKB43ssP+PX1j8BLcoNlsAfFfaCTf4VTGLhR6J3JHaUfFi0yD5xRgcqtg8hY
 fKpER78W6m6ptuB5dS9zj761x+ZZjDYJnqH1W/Bl/E4pbEOjFQGh/qC4RtRU7yZ8cEbKvjwaapx
 +eKSlLH9eg3Ol1MHrdLrlZoBT0YvegpJOevunpJGC6Ktnx+uu/PiIPsiLJElCBtOMlscFtlNP9F
 /4ptcEoZL5yEgGYoh0t9P5CBU1RFd/qMNv5XHPMuGV/LEkgaLBSRlV/x8OWM5XeiAr8ahstrqeT
 WjOuMgOxDYCBFE8zFFOA4vfaDBm/jSS81s7/IkbQeYsIZp+3FOCEmsdOxA0LrrzctO9sU=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is no need to specify regioning and channel offset in
most cases. Default genisa values are:
- <0;1,0> for source region,
- <1> for destination region,
- M0 for channel offset.
The patch also enforces common formating for all asms:
- preprocessor instructions and predicates start from beginning of the line,
- instruction mnemonic starts from 1st tab,
- exec size follows mnemonic after one space,
- flag modifiers, if any, are placed after exec size,
- arguments starts from 3rd tab,
- no tabs/multi-spaces between/after arguments

The changes do not affect produced binary code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Changes in v2:
- split patch to lib and test parts, remove script change (Kamil)
- Link to v1: https://patch.msgid.link/20261027-remove_gpu_asm_annotations-v1-1-55a0fb61b96d@intel.com

---
Andrzej Hajda (2):
      lib/shaders: remove explicit regioning and channel offsets
      tests/intel/xe_prefetch_fault: remove explicit regioning and channel offsets

 lib/gpgpu_fill.c                                  | 104 +++++++++---------
 lib/gpgpu_fill.c.gen.iga64_codes.c                |   2 +-
 lib/gpgpu_shader.c                                | 126 +++++++++++-----------
 lib/gpgpu_shader.c.gen.iga64_codes.c              |   2 +-
 lib/iga64_macros.h                                |  70 ++++++------
 tests/intel/xe_prefetch_fault.c                   |  16 +--
 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c |   2 +-
 7 files changed, 160 insertions(+), 162 deletions(-)
---
base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
change-id: 20261027-remove_gpu_asm_annotations-94b7b32841dd

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

