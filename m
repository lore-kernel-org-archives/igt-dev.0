Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB2FCD343F
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 15:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD0A10F1A8;
	Thu,  7 May 2026 15:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdtXmHOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B5310F1B4
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 15:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778167025; x=1809703025;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=BPBbN9z5gjOqjRrQDkTGYp/lvbagP6eLLcfvZbvrP3A=;
 b=JdtXmHOcD3DGLcjhF4Si/rmjthSnGRwOamNbNMhKxNxVUusRcocpznNG
 4AgTZ2CMmD0D4vzEAQdzsNGEB6lvg25JmzSskrpvs+JAGWwrWH5HGnXjs
 BtHI10NDpO6NbwOwCKLiq/WYTkTza/xbFlAWJy/PbPvCOAA3hvJQ/eArw
 IWieUmDBCf5qpi7t6T3ogqLZKaJvjSTcsIB92kF0IQekyjg6Vj4zYyDEJ
 PNCnrKzaUXc/jYZFn+/IDWej9LRHcRzO2XJOOnpe5siHNnxC8OS1K8Ekw
 kxA35aaOmIplrNltxAF/z5e2ZmOi6a67pYdprrnz03WzCqa7wdghXNSQA Q==;
X-CSE-ConnectionGUID: E/Q0EZA2Tf2PAD02msSpxw==
X-CSE-MsgGUID: pgjlF7wIQFCeHhAkfUnYug==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79020687"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79020687"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 08:17:04 -0700
X-CSE-ConnectionGUID: gDT4+QNRSdKhk0DVKsecww==
X-CSE-MsgGUID: K/HwWkgRRMijbHYkx1KQOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="241469619"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 08:17:02 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/2] lib/gpgpu_shader: GPU asm related changes
Date: Thu, 07 May 2026 17:15:39 +0200
Message-Id: <20260507-switch_asms_to_raw_strings-v1-0-487fa0f9ea2f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJus/GkC/yXMUQqDMBBF0a3IfDcQhSrpVkoJSZyaKTTKTKwFc
 e9N7Od9PM4OgkwocGt2YPyQ0JxKtJcGQnRpQkVjaeh01+urHpRslEO0Tt5i82zZbVYyU5pEaUR
 tRu+NGVoowML4pO+J3x//ltW/MOQq1od3gsqzSyHWaV0EjuMHob2lGZQAAAA=
X-Change-ID: 20260507-switch_asms_to_raw_strings-0ee09dbb9971
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=BPBbN9z5gjOqjRrQDkTGYp/lvbagP6eLLcfvZbvrP3A=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBp/Kyli/bDY+vKTBH6ukBr/3eaQsQnRdpCu0zyo
 lCfrIvxatWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCafyspQAKCRAjYrKT3hD9
 13UxC/90EJnmyPBYNMZXHB57htFL55keQyAURGazbqPOOEO9JE3S2BOyhTTmjdT6RmMAWnJxRBD
 bwtT6E3DWTh8fGkTmCvZbNGI8c96IX4BZ6vFkOpCbVOl/UIGVFYyDfbI7iX71Nbx4QsmJaoX6jz
 6/jnDtIWW2qkgOejSm5hUfEG5OZV47jyhS56LhnHkajiygKzHEfyjYFvWvbC23SOdPfCNXo/dMs
 LpuBSG7+NPh0Gv0QaSm/Yqr7Qw9BSBrXzLuYQxC1AunmV4/p9uEzm59uqGhLA+Xi2sz5mFUrS1/
 b2BrX9ddtYQP6llYLYMEKL9Uo9WJ+zdTWAO0vgObhQgppNaAriuNIUgtI5eJD6ukGcaagsRtj3y
 xktMchY8CfVOA2ZdoEEL6KMjOyGTMYKbZ6s5i9yhiGC/TvUBnE7Es/RFBLnYI42gapOjTqK3akM
 ImjIWNXbclrGSCN6BIx7Gu0DKiXMQ9207LkLjf+jWhkHApU4gWeh/qo+RzZbNbXy6jqIY=
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

Nothing fancy, just upstreaming.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (2):
      scripts/generate_iga64_codes: add env variable to force asm rebuild
      lib/gpgpu_shader: use raw strings in all asms

 lib/gpgpu_fill.c                                  |  86 ++--
 lib/gpgpu_fill.c.gen.iga64_codes.c                |   2 +-
 lib/gpgpu_shader.c                                | 492 +++++++++++-----------
 lib/gpgpu_shader.c.gen.iga64_codes.c              |   2 +-
 scripts/generate_iga64_codes                      |   2 +-
 tests/intel/xe_prefetch_fault.c                   |  60 +--
 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c |   2 +-
 7 files changed, 323 insertions(+), 323 deletions(-)
---
base-commit: 3e5747e536f148bf232049e49a00e2b683f91a83
change-id: 20260507-switch_asms_to_raw_strings-0ee09dbb9971

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

