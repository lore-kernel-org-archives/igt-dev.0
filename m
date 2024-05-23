Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017FDC41513
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 11:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AE610E29A;
	Thu, 23 May 2024 11:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="0ExTHOXk";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D003610E11A
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716464754;
 bh=OO2XwDfeCAdch2kb25yad7Pvo/5O172cFSiiH5UY5qw=;
 h=From:To:Cc:Subject:Date:From;
 b=0ExTHOXkxMGTTORVKIariDO3s9xTsfb6G1wQXPy8Qyti3sstLgPre0okJYAqYdG7e
 tK2OuvTfypJA+1OX4Hky1cAoEXrXr9X/k7mxfGpo0FGKrtpsUUAU/FPRlCBah/DBxi
 PqITcdp5TweBHco75xl5IIdctNSAHF31zL5Ne2yomx723Y7qbJQn4f5WCU5VKDHG4j
 Ega5oSC2k8l+F7z+b+ESBrwmKPF85X+S5JObf66R54FMPzLNo7rc843DWsgK4/S1ag
 GVBYvXdb0reSrm1mTvMCcI1uiW/cCfKi2vqlMwQSZVJyhOUJznv093eJWDO6/7ohm/
 Y4H43XjccVhkA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 217AB378216B;
 Thu, 23 May 2024 11:45:54 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tursulin@ursulin.net, robdclark@chromium.org,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org
Cc: healych@amazon.com,
	adrian.larumbe@collabora.com
Subject: [PATCH v4 0/2]  Add gputop support for sysfs profiling knob
Date: Thu, 23 May 2024 12:45:42 +0100
Message-ID: <20240523114549.447126-1-adrian.larumbe@collabora.com>
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

 lib/igt_profiling.c | 190 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_profiling.h |  22 +++++
 lib/meson.build     |   8 ++
 tools/gputop.c      |  33 +++++++-
 tools/meson.build   |   2 +-
 5 files changed, 253 insertions(+), 2 deletions(-)
 create mode 100644 lib/igt_profiling.c
 create mode 100644 lib/igt_profiling.h


base-commit: e43892a30d594f8bcbcbd42ccffe298313479215
-- 
2.45.1

