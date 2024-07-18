Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EED8C3DA63
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 13:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF7510E890;
	Thu, 18 Jul 2024 13:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FBtMWA13";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9010E890
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721311097;
 bh=ilxJjt0w3DH7CP5hj0+y6ZwyDcd98mC1yLW2ZTIqF3M=;
 h=From:To:Cc:Subject:Date:From;
 b=FBtMWA13qiTOPFqMymxIHXzu/mTLYDRNe82fdaGgpQJPqI8I5zww5iLM6hzN8Ev6b
 DRmmKlTDRxMlgahJpotAnxatxO5gpN+FNFqZOdLKMazR+BGvaz8vR0oanXeq72Rs3b
 y8/Y6No9LmNpu+L4Ir0plxZR50Dyz+eB0RwOuKymqV6BtrzX2a4fCHZ6/zURUs7NRk
 Io0SBbnSgF/lxhieKDaJIl9pRb2KJa+mdO3dbyLwIqJ1RiQ4HQT1+BqROEfD5fq9YP
 RXQFiHLF4ZNUTc/CgjQaaqZ1twCUomFagbNZu7N0azXVC7hROEi7lc2k+GDDn9rLe4
 m+sDIA7U8UUvQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D2955378219E;
 Thu, 18 Jul 2024 13:58:16 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tursulin@ursulin.net, robdclark@chromium.org,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org
Cc: healych@amazon.com, adrian.larumbe@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH v6 0/2] Add gputop support for sysfs profiling knob
Date: Thu, 18 Jul 2024 14:58:08 +0100
Message-ID: <20240718135811.3619050-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
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

Some GPUs like Panfrost need a sysfs file to be toggled before the HW can
initiate the job accounting necessary to feed fdinfo with engine and cycle
data. This sysfs knob has to be disabled when the profiler is done, to save
power.

Changelog:
v6:
 - Deleted spurious line
 - Changed license identifier comment style in header file
 - Added some ack tags to th commits
v5:
 - Deleted unnecesary blank line and added Ack tags
v4:
 - Improve error handling *igt_devices_profiled
 - Changed name of some symbols to better reflect their semantics
 - Changed header with copyright notice
 - Added documentation for public functions in igt_profiling.c
v3:
 - Created separate lib_igt_profiling to avoid dynamic linking
 of gputop with igt_lib, which also meant isolating the functions
 therein from the rest of igt_lib.
 - Make gputop check the sysfs knob state at the end of every period
 in case other instances of itself or other profilers might have
 changed it, so that the knob can be returned to its original state.
v2:
 - Added header file guards around igt_profiling.h
 - Modified licensing information to comply with SPDX format
 - Sorted included header files in alphabetic order
 - Added volatile qualifier to gputop stop variable

Adrián Larumbe (2):
  lib: Add DRM driver sysfs profiling knob toggling functions
  tools/gputop: toggle sysfs profiling knob if available for device

 lib/igt_profiling.c | 189 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_profiling.h |  22 ++++++
 lib/meson.build     |   8 ++
 tools/gputop.c      |  32 +++++++-
 tools/meson.build   |   2 +-
 5 files changed, 251 insertions(+), 2 deletions(-)
 create mode 100644 lib/igt_profiling.c
 create mode 100644 lib/igt_profiling.h


base-commit: a2ab0ec12ef447c96c67dc539813462b6b39f857
-- 
2.45.1

