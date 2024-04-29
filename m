Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9BEC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 12:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41882112BE9;
	Mon, 29 Apr 2024 12:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOhCcNFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AA9112BE9
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 12:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392524; x=1745928524;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=6zsMuTEFT5loLTDOZzexxsu+uFV5o/nILQlPZVnzv64=;
 b=QOhCcNFgY+fjgNfVT5CCQJvrbhNdsw0/eNsslxyQuMtcMMhE95pAV0eV
 j2CnVNLcNTo08rcQF7ri0RN/tr7Ld/Ytbs0ep6T1d6Vdw+xsEYwEeoTQS
 FR6DFSjbhUb3+wkm3/mWiKvTsKucxtE3+f69TPsnyBZAqS3c11sR/1+Q/
 /MJq91hMZmb3eKtwXwDntmOQJZClLBiQ55wpttUcHaiXpcX+MnsXnHmqf
 wdwY15sVA4IRhNz4C7c0wF9fluwUnxJmqViCg1LSveONfLrVx5s8kYNfU
 9B2YGK9vEmeU3IKxTa2Z9IgAaka7vVMlkBvNgE3cXG7jgep709mO5mrJp A==;
X-CSE-ConnectionGUID: jLw9G4d6Rz21P4otVtJONA==
X-CSE-MsgGUID: ZUJhqt3gT7WamMDRAslAww==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13823215"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="13823215"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:08:44 -0700
X-CSE-ConnectionGUID: DWcc7rQETR+e5hUToD02WQ==
X-CSE-MsgGUID: QFPplBKZQbaMWCerOZneYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30772357"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:08:43 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/4] lib/gpgpu: add shader support
Date: Mon, 29 Apr 2024 14:08:16 +0200
Message-Id: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALCNL2YC/x3MQQqEMAxA0atI1lOotSPiVWSQalMNSJQGRRDvb
 pzlW/x/gWAmFGiLCzIeJLSyovwUMM6BJzQU1eCs89a7r6Ep1L4nXoix3zcxvmpiTLG2rkqg2ZY
 x0flfdj/1EATNkAOP8zvSBO77AbFKFSh4AAAA
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=6zsMuTEFT5loLTDOZzexxsu+uFV5o/nILQlPZVnzv64=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmL43IWO+wMWgO03VFqb5kWFQoVqMv/w8AP2yzZW4R
 +eCxkniJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZi+NyAAKCRAjYrKT3hD914T6C/
 9xD08NhyYot1nliwa5fANlHHWx2K26i9Ck0FbaugS+fM7QQCi/7S0S5uZvswoQlWhjW3dHhZf5aeZV
 oYwYuwe5T1LTvdv7lbTuTA7kUxCv3m2hR3MIlBht6nI6zhz2m5XVUKzbGmLS1urA+OueN1fTT/3ylJ
 y4030yGQjaup811U4/MlqSeuSDLDt8+kbs8EMcduD5jiSM0l2X0EO1tyErI6khsnXrpZl7wHcyidND
 1/PPFYQNXBfU+OBkyuypie8CZq2308JSiwkpdGE7Sy6iMSNoyEnQ6REFLR3hwgYMY9CT+g/iH3Efax
 UVwtY2HeiHa/tf5TgybGTq0N+qRO2TokPDWFA3NiESFgF9Ppu00dXd6696f0u/J0dnqvtjXG7ZGEhn
 AGFep6oFkDq+9h6cEKZjfCECHfGxffVEf/HsL5U7dZfL2Y1+ALf9HCRju4Zi0v8FQUSaGf3oom3pSF
 +xnAJWOG8eqKpDjbOOpt+FBs7uJBIs2khNwADFiUYUSdY=
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

To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (4):
      lib/gpu_cmds: add Xe_LP version of emit_vfe_state
      lib/gpgpu_shader: tooling for preparing and running gpgpu shaders
      lib/gpgpu_shader: add inline support for iga64 assembly
      intel/xe_exec_sip: port test for shader sanity check

 lib/generate_iga64_codes    | 104 +++++++++++++++
 lib/gpgpu_shader.c          | 313 ++++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h          |  63 +++++++++
 lib/gpu_cmds.c              |  29 +++-
 lib/gpu_cmds.h              |   6 +
 lib/iga64_generated_codes.c |  87 ++++++++++++
 lib/iga64_macros.h          |  10 ++
 lib/meson.build             |  19 +++
 tests/intel/xe_exec_sip.c   | 239 +++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 10 files changed, 865 insertions(+), 6 deletions(-)
---
base-commit: 61121a2eac4d191ad9f3077948c8ba19686fbb16
change-id: 20240425-iga64_inline_ups-438ddfd6023f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

