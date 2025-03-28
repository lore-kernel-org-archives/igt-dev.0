Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5162C36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA7C10E98F;
	Fri, 28 Mar 2025 08:05:35 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0803A10E98F
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:05:32 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S7sMPN1460881; Fri, 28 Mar 2025 13:24:22 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S7sMFi1460880;
 Fri, 28 Mar 2025 13:24:22 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Strawbridge@rtg-sunil-navi33.amd.com,
 Michael <Michael.Strawbridge@amd.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 00/19] The series add support for UMQ submission
Date: Fri, 28 Mar 2025 13:24:01 +0530
Message-Id: <20250328075420.1460811-1-sunil.khatri@amd.com>
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

Here we are enabling UMQ submission framework along with some of the
test cases which validated gfx and compute with UMQ Submission

Sunil Khatri (19):
  drm-uapi/amdgpu: sync with drm-next
  drm-uapi/amdgpu: sync with drm-next
  lib/amdgpu: Add user mode queue support in ring context
  lib/amdgpu: Add support of amd user queues
  lib/amdgpu: add func amdgpu_bo_alloc_and_map_sync
  tests/amdgpu: Add user queue support for gfx and compute
  tests/amdgpu: Add UMQ submission tests for gfx and compute
  tests/amdgpu: Add amdgpu_sync_dependency_test with UMQ
  tests/amdgpu: use memory API's from amd_memory.h
  lib/amdgpu: add macro for adding cmds in user queue
  lib/amdgpu: use macro to add cmds in the user ring
  tests/amdgpu: Add amdgpu_cp_nops tests for UMQ
  drm-uapi/amdgpu: sync with drm-next
  lib/amdgpu: use right API to get the correct size
  lib/amdgpu: use a memory fence to serialize write
  tests/amdgpu: disable check for IP presense with no kernel queue
  lib/amdgpu: make the local functions as static
  lib/amdgpu: enable UMQ function under macro
  tests/amdgpu: Disable the UMQ tests under a macro

 include/drm-uapi/amdgpu_drm.h       | 261 ++++++++++++++++
 lib/amdgpu/amd_PM4.h                |   3 +
 lib/amdgpu/amd_command_submission.c | 313 +++++++++++++------
 lib/amdgpu/amd_command_submission.h |   8 +-
 lib/amdgpu/amd_compute.c            | 100 ++++--
 lib/amdgpu/amd_compute.h            |   2 +-
 lib/amdgpu/amd_ip_blocks.h          |  35 +++
 lib/amdgpu/amd_memory.c             |  19 ++
 lib/amdgpu/amd_memory.h             |   8 +
 lib/amdgpu/amd_user_queue.c         | 465 ++++++++++++++++++++++++++++
 lib/amdgpu/amd_user_queue.h         |  55 ++++
 lib/meson.build                     |   3 +-
 tests/amdgpu/amd_basic.c            | 174 ++++++++---
 tests/amdgpu/amd_cs_nop.c           | 149 ++++-----
 tests/amdgpu/amd_security.c         |   4 +-
 15 files changed, 1335 insertions(+), 264 deletions(-)
 create mode 100644 lib/amdgpu/amd_user_queue.c
 create mode 100644 lib/amdgpu/amd_user_queue.h

-- 
2.43.0

