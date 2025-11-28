Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5CECFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E057410E896;
	Fri, 28 Nov 2025 14:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7jemDq6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FFB10E775
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339260; x=1795875260;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=T519GxR6ESzqP7wLjbSrnCOczS/WlMBG+n3ywcj6OYo=;
 b=X7jemDq6U6y9+QbK4uuNEDBGo/xKPcCtuUG1mMUtZnwFMb4yU8lKAPpv
 TozzMawaQvuPS4HqueNO0aPg3JACn6jCYlc2xY1EGrtohgU+Gw/9Pi+GE
 nYy5AiiRsQ2bpgChdwg2yuY5vLUQpetmLQTzGn/2wm2V9FHqi2Q7r2b/s
 9slLAS16sp3P/p6FN+s6mMlHekx0TGsebXWETAEZpKg4Ruo1Wl1TFcUxp
 RFb7nMC+vOmOydgGN8hGt/giLVcGfJa+0aRn81QKSTv4h5rSaduDctcXu
 2nghN11fO9l64V8BEbOC3reI44NmU7thbwzoGt4nOyYBVoszOSg/OeMxn Q==;
X-CSE-ConnectionGUID: ByoCvqA2RUitMmMtTkHeaw==
X-CSE-MsgGUID: Bf6kTut+Rnmg/YDyagSmNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261593"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261593"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:20 -0800
X-CSE-ConnectionGUID: I+Hoo4OBSKC0sP0qgdSdqg==
X-CSE-MsgGUID: rocaxfY3SHe6D4qnkScb+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173607"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:19 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 00/11] tests/intel/xe_eudebug_online: add
 pagefault-one-of-many test
Date: Fri, 28 Nov 2025 15:12:04 +0100
Message-Id: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALStKWkC/yWMQQ6CMBBFr0Jm7URaQZSrGBdTmEKNlKZTjIZwd
 4su389/bwXh6FigLVaI/HLiZp9BHQroRvIDo+szgy51rZQ+Y6CBLS3PhLNnnC1O5D94KunSNP2
 1rioF2Q2RrXv/urf7n2UxD+7SHtsfhoTRRPLduE9LkBSZpuNEkjjCtn0BYAFzNZsAAAA=
X-Change-ID: 20251126-pagefault-one-of-many-30a877d95441
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=T519GxR6ESzqP7wLjbSrnCOczS/WlMBG+n3ywcj6OYo=;
 b=kA0DAAoBI2Kyk94Q/dcByyZiAGkprfKgsPzrKWHicDLAUgO20eeHQGpQwEDAYr24/7MryqQbv
 okBswQAAQoAHRYhBPyoRDE03b9d4X8DTSNispPeEP3XBQJpKa3yAAoJECNispPeEP3Xdj0L/2Vy
 zBllyomoJZX13anGysJo6uxQ/AhBylQ+C/R4sdr+qmTB+uIFhqUOAVKY6iJmBw6NY3A7J7nqwic
 lnVsHJlDE738amfQqdkhiY1pkhZPANnz7B74i7VdCAUi5NYku50O+QQCGZh3ENBa5014YgU4qrw
 dPsdALYP4O8vH9Pm8/C3XMNdrritwJFAnJ+1ZRxKThGJKeRDhzyfSYh7UI306g98KQNKsfsze0p
 QesBDtgYCSMv+JltW0cOYg5PI9bn61ueIA20/vUbrF/UgTW8iePjxxumlfp7pMagSaVRW1zaJLZ
 atE6lKrv3li0TmAy38WOYEZSe43YA+zbvTftNRtvXeiisopty9U/17zi3D6IqhB27+M3MKzfaXA
 r+beEKW7cy2DB3S3qe582BYPx2Len1LXMCnpONxe1g793BX2ipYImKRwwWXXS8PAzhZwRGE9Ral
 KEj7+8UgNzAVpvIBMtMutUt133Vyo/sABTiIaGgXxrmCBzcr7Ut/ozNfNLvw==
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

This series adds few bitmap helpers, performs xe_eudebug_online
file refactoring, and finally it adds pagefault-one-of-many test
which exercises detection of GPU EU threads causing pagefault.
xe_eudebug_online needs much more refactoring, which hopefully
will be done later.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (11):
      lib/igt_aux: add hweight helper for bitmaps
      lib/xe/xe_query: add helpers to return count of EUs and EU threads
      lib/gpgpu_shader: use recently introduced helper to get EU thread count
      tests/intel/xe_eudebug_online: use igt_bitmap_hweight
      lib/igt_aux: add fls helper for bitmaps
      tests/intel/xe_eudebug_online: use igt_bitmap_fls to calculate max dss count
      tests/intel/xe_eudebug_online: add fd and flags to online_debug_data
      tests/intel/xe_eudebug_online: rename threads_count to thread_hit_count
      tests/intel/xe_eudebug_online: use online_debug_data in get_(shader|sip)
      tests/intel/xe_eudebug_online: cache thread count value
      tests/intel/xe_eudebug_online: add pagefault-one-of-many test

 lib/gpgpu_shader.c                                |   5 +-
 lib/igt_aux.c                                     |  48 +++
 lib/igt_aux.h                                     |   3 +
 lib/meson.build                                   |   2 +-
 lib/xe/xe_query.c                                 |  57 ++++
 lib/xe/xe_query.h                                 |   3 +
 tests/intel/xe_eudebug_online.c                   | 353 ++++++++++++++--------
 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c |  43 +++
 8 files changed, 391 insertions(+), 123 deletions(-)
---
base-commit: 005281c52252a2b3790b186bf95c6cb378f9a609
change-id: 20251126-pagefault-one-of-many-30a877d95441

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

