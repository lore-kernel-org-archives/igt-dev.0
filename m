Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBF910E522
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 22:31:05 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Mar 2022 17:30:42 -0500
Message-ID: <20220310223046.578910-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 0/4] PSR-SU MPO case test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The set of patches are to add a sub-test case for amd_psr
to emulate the video playback MPO use case where we expect
the PSR-SU feature is enabled.

David Zhang (4):
  lib/igt_psr: pass higher versions of PSR SU panels
  lib/igt_amd: add helpers to check PSR capibility
  lib/igt_amd: add helpers to check PSR state
  tests/amdgpu/amd_psr: add PSR-SU MPO subtest case

 lib/igt_amd.c          | 173 +++++++++++++++++++++++++++++------------
 lib/igt_amd.h          |  36 +++++++++
 lib/igt_psr.c          |   8 +-
 tests/amdgpu/amd_psr.c | 150 ++++++++++++++++++++++++++++++++---
 4 files changed, 304 insertions(+), 63 deletions(-)

-- 
2.25.1
