Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEA3C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 19:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EBF10E7B2;
	Fri, 10 May 2024 19:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SA3829Ni";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B7910E5DE
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 19:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715368657;
 bh=34iPmHg7e3CvF7AgI6vpybEjnQcuqRgFyfvSkmtGhEg=;
 h=From:To:Cc:Subject:Date:From;
 b=SA3829NiIicLHx6B8knUnah+MIdDm8C4SD+eeZ9Z2PQh812oNigQ6vtIxTa6dUGJk
 8HAOs5H8AtJoS2MssHym+RWNQ0jIsosPxOYfRvcH0qakX1HZvaPEB1d46u2E8N0qQL
 QbpNn2Ce0jLZHK963mmieS33hYDRorguV3WmQWPQlbfTgZapChlAvHkr2mhnhl6r1C
 pfNfTy3Lyn3FfxneAfZzV9ZrWisEeYw9oxo90Fykt28M+ZLg/FU00TNshwIFH7u5Bs
 M4ewF7EtZaoOL0yr/aRLGBwO9o1uc7HV7kxNZarXLVDwCN67E+eNonjy10qWXP+cFA
 iDG7S8cO+77ZA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 05E8E378217A;
 Fri, 10 May 2024 19:17:36 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tvrtko.ursulin@intel.com, robdclark@chromium.org,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org
Cc: healych@amazon.com,
	adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH v3 0/2] Add gputop support for sysfs profiling knob
Date: Fri, 10 May 2024 20:15:19 +0100
Message-ID: <20240510191716.282644-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
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

 lib/igt_profiling.c | 141 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_profiling.h |  21 +++++++
 lib/meson.build     |   8 +++
 tools/gputop.c      |  33 ++++++++++-
 tools/meson.build   |   2 +-
 5 files changed, 203 insertions(+), 2 deletions(-)
 create mode 100644 lib/igt_profiling.c
 create mode 100644 lib/igt_profiling.h


base-commit: 4a5fd4e7cb2798636f6464e2bd61399f3242b322
-- 
2.44.0

