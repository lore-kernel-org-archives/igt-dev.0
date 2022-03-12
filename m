Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2089.outbound.protection.outlook.com [40.107.102.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD3510E17B
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Mar 2022 05:29:28 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Sat, 12 Mar 2022 00:29:05 -0500
Message-ID: <20220312052910.357949-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v3 0/5] PSR-SU MPO test case
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

changes in v3:
-----------------------
* split the commit into two, one for PSR state read helper,
  another for code refactoring to avoid redundancy
* use tabs to make indentation more consistant
* add newline after for loop for readability

David Zhang (5):
  lib/igt_psr: pass higher versions of PSR SU panels
  lib/igt_amd: add helpers to check PSR capibility
  lib/igt_amd: add helpers to check PSR state
  lib/igt_amd: refactor checker of debugfs interface existence
  tests/amdgpu/amd_psr: add PSR-SU MPO subtest case

 lib/igt_amd.c          | 173 ++++++++++++++++++++++++----------
 lib/igt_amd.h          |  36 +++++++
 lib/igt_psr.c          |   8 +-
 tests/amdgpu/amd_psr.c | 208 +++++++++++++++++++++++++++++++++--------
 4 files changed, 334 insertions(+), 91 deletions(-)

-- 
2.25.1
