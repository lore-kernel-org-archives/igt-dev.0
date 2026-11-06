Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100F9606A32E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gsBKZUZC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAC0112E09;
	Fri,  6 Nov 2026 14:11:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92304112E09
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793974215; x=1825510215;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=r3BFesLjYN3ptFEZRvMkpp8xNK35G+6rBoVTrZjF3cA=;
 b=gsBKZUZCn1+/q/NxdJAWOHCzK7Nx2MfGgY+iuFupSOt9fxDXKHBwJlXt
 Z9RxgmzlNISCigl9AUnALwErJNqAhvCgOCPak1oQeX4RV5yNyjVwo2U4C
 Gy8gntUlDHIP0fKRmE7tdj03FTm/J7YZKODMvdQEVAazLa8OZ1En9BXm1
 Dt2dDp51tQNvCkQvLmCKc3TyrrLdIGmCDS2iuCn1rMjKkMxrqdld3MhY1
 O5et85OidO5REATJhnv8Fr+SZa+mC1/j5iNRJH82uIDgg5IbM87sGoslZ
 d2/6+LSqpJuZcvf0y4Cos/Y9nFcx6y5/FdR6t/p89cFcZCs2LeI67Hztp Q==;
X-CSE-ConnectionGUID: 0GOfPjqrSwOMqn3+Z7QBRg==
X-CSE-MsgGUID: rCfJIf8RRhiEBg7IC82QPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2780578"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2780578"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:10:14 -0800
X-CSE-ConnectionGUID: 0WfDB/spSdeJRhwvndrkFg==
X-CSE-MsgGUID: CbVs31tFS/ybpaLxiMdU8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7451543"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:10:12 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v3 0/2] xe/shaders: remove explicit regioning and channel
 offsets
Date: Fri, 06 Nov 2026 15:07:53 +0100
Message-Id: <20261106-remove_gpu_asm_annotations-v3-0-f3c1e3cb71d7@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnf7WoC/43OTW7DIBAF4KtErEMLJP7rqveIImvA45gogMVgl
 Cjy3WvSTVZVl2/05tN7MsJokdjX7skiZks2+C0c9jtmJvAX5HbYMlNC1VKohkd0IWN/mZceyPX
 gfUiQti/i3VE3+qDaoxwGtgFzxNHeX/jp/Jtp0Vc0qYiloYGQ6wjeTOW0zJQigvt0QAljaUyWU
 oiP174si/SvKVlyyasKxKhrqbt6+LY+4e3DBMfKlKzeqfZPSnHBVSOgaptWq9G8U+u6/gCfAhS
 +QwEAAA==
X-Change-ID: 20261027-remove_gpu_asm_annotations-94b7b32841dd
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.17-dev-6be7c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1975;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=r3BFesLjYN3ptFEZRvMkpp8xNK35G+6rBoVTrZjF3cA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBq7d9AWe9O39oRshmfVCzbW8DSjU/4kwu1FN9QT
 lP+EyFDC2qJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCau3fQAAKCRAjYrKT3hD9
 14EZC/0XOZvBF57n5LHW5G4mIQdR+RM+u7mgnP+LPKubOr1MLA8rbQMuTA4V8z2S9XiGK0tnRIq
 aXwb++6aYATnZaXs5jIu9ss3MaXvspDUixKxE3TKwS4kqgTITn5tgml9omNN/0Z2UZ+BEw9xWiS
 gQzmUkKfhD0zduM56rJ3TUNMKdW090ZceZo9kHNOb0m+ZoWUSMv/zFB9w65q8Gd1usAPpBj+OnA
 XkU7REfcs7nwDXGAEspapSpa8vFjpIEPwnzXN+qiutfZ0dLUBZJ9UKXua3ZQDgtJ5iC/HbT8xos
 gb6/vSH+wjMVRrjZAaA5/C/WI/QPfH76LmTgwov0zPnk+bew7HOuZmCI3EZcs6navzD4CCN/JZ7
 wNTv3hNYt0runrSbDX9i3jFImBPjoISQdyeFSU7vpNdWtxiYSMoL47CHALbp/PL7Xf2WcXSgDqZ
 HqnHE5Od6DyWv8yxiI4b1QnWJAd9GIHTPFaPEnWyRN/b4LPBtW23FgTc0X2gk098G3MCc=
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
- args are tab aligned per shader - argN should be place at the same column

The changes do not affect produced binary code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Changes in v3:
- changed formating of args from single-space separated to tab aligned (Zbigniew)
- Link to v2: https://patch.msgid.link/20261028-remove_gpu_asm_annotations-v2-0-270a5878b2fc@intel.com

Changes in v2:
- split patch to lib and test parts, remove script change (Kamil)
- Link to v1: https://patch.msgid.link/20261027-remove_gpu_asm_annotations-v1-1-55a0fb61b96d@intel.com

---
Andrzej Hajda (2):
      lib/shaders: remove explicit regioning and channel offsets
      tests/intel/xe_prefetch_fault: remove explicit regioning and channel offsets

 lib/gpgpu_fill.c                                  | 100 ++++++++--------
 lib/gpgpu_fill.c.gen.iga64_codes.c                |   2 +-
 lib/gpgpu_shader.c                                | 132 +++++++++++-----------
 lib/gpgpu_shader.c.gen.iga64_codes.c              |   2 +-
 lib/iga64_macros.h                                |  58 +++++-----
 tests/intel/xe_prefetch_fault.c                   |  16 +--
 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c |   2 +-
 7 files changed, 156 insertions(+), 156 deletions(-)
---
base-commit: 45b7aef25da3a40ae4cc75442d7b8e6f9af1fb98
change-id: 20261027-remove_gpu_asm_annotations-94b7b32841dd

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

