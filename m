Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71CA10E812
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 13:39:48 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Daniel Vetter <daniel@ffwll.ch>,
 Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Thu,  9 Mar 2023 10:39:21 -0300
Message-Id: <20230309133923.124095-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add negative tests to VGEM
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, the VGEM tests don't cover any negative tests. So, by inspecting
the driver code, add tests that input invalid arguments and then, check if
the driver is returning the correct values.

In the first patch, update VGEM to use the UAPI header instead of having it
defined in the source code and in the second patch, introduce the negative
tests.

Best Regards,
- Maíra Canal

Maíra Canal (2):
  lib/igt_vgem: Use UAPI header
  tests/vgem_basic: Add negative tests

 lib/igt_vgem.c     | 36 +++++++-------------------
 lib/igt_vgem.h     |  4 +--
 tests/vgem_basic.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 30 deletions(-)

-- 
2.39.2
