Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2046.outbound.protection.outlook.com [40.107.101.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009A710E00A
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 19:45:09 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Mar 2022 14:44:48 -0500
Message-ID: <20220311194452.291714-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 0/4] PSR-SU MPO test case
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

changes in v2:
-------------------------
* fix the typo in string comp within psr cap debugfs
  reading
* move the #define macro to top of the source file

David Zhang (4):
  lib/igt_psr: pass higher versions of PSR SU panels
  lib/igt_amd: add helpers to check PSR capibility
  lib/igt_amd: add helpers to check PSR state
  tests/amdgpu/amd_psr: add PSR-SU MPO subtest case

 lib/igt_amd.c          | 173 +++++++++++++++++++++++++++++------------
 lib/igt_amd.h          |  36 +++++++++
 lib/igt_psr.c          |   8 +-
 tests/amdgpu/amd_psr.c | 151 ++++++++++++++++++++++++++++++++---
 4 files changed, 305 insertions(+), 63 deletions(-)

-- 
2.25.1
