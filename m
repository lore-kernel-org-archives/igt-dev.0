Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EFEE77188
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 07:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329F210E8B4;
	Thu, 16 Jan 2025 07:01:43 +0000 (UTC)
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jan 2025 07:01:41 UTC
Received: from rtg-sunil-navi33 (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD78710E1B1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 07:01:41 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33 (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 50G6sEGP1883258; Thu, 16 Jan 2025 12:24:14 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 50G6sDOT1883257;
 Thu, 16 Jan 2025 12:24:13 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Strawbridge@rtg-sunil-navi33.amd.com,
 Michael <Michael.Strawbridge@amd.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH 0/8] The series add support for UMQ submission
Date: Thu, 16 Jan 2025 12:22:03 +0530
Message-Id: <20250116065211.1882469-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Here we are enabling UMQ submission framework along with 3 new test
cases which validated gfx and compute with UMQ Submission


Sunil Khatri (8):
  drm-uapi/amdgpu: sync with drm-next
  drm-uapi/amdgpu: sync with drm-next
  lib/amdgpu: Add user mode queue support in ring context
  lib/amdgpu: Add support of amd user queues
  lib/amdgpu: add func amdgpu_bo_alloc_and_map_sync
  tests/amdgpu: Add user queue support for gfx and compute
  tests/amdgpu: Add UMQ submission tests for gfx and compute
  tests/amdgpu: Add amdgpu_sync_dependency_test with UMQ

 include/drm-uapi/amdgpu_drm.h       | 240 ++++++++++++++++
 lib/amdgpu/amd_PM4.h                |   3 +
 lib/amdgpu/amd_command_submission.c | 313 ++++++++++++++-------
 lib/amdgpu/amd_command_submission.h |   8 +-
 lib/amdgpu/amd_compute.c            | 100 ++++---
 lib/amdgpu/amd_compute.h            |   2 +-
 lib/amdgpu/amd_ip_blocks.h          |  36 +++
 lib/amdgpu/amd_memory.c             |  19 ++
 lib/amdgpu/amd_memory.h             |   8 +
 lib/amdgpu/amd_user_queue.c         | 418 ++++++++++++++++++++++++++++
 lib/amdgpu/amd_user_queue.h         |  48 ++++
 lib/meson.build                     |   3 +-
 tests/amdgpu/amd_basic.c            | 168 ++++++++---
 tests/amdgpu/amd_security.c         |   4 +-
 14 files changed, 1187 insertions(+), 183 deletions(-)
 create mode 100644 lib/amdgpu/amd_user_queue.c
 create mode 100644 lib/amdgpu/amd_user_queue.h

-- 
2.34.1

