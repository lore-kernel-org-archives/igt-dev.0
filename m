Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CC210E0CF
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 09:57:40 +0000 (UTC)
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:57:22 +0200
Message-Id: <20230214095724.77881-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Handle spurious HPDs - IGT part
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

Some panels generate spurious HPDs during CI execution causing
random unexpected failures. There are two parts for handling
this issue - in driver and in IGT. This is for IGT.

IGT will set ignore long HPD debugfs entry to ignore long HPDs
in the driver. And then by force connect the active connectors,
we can avoid the detect hooks being executed from drm and hence
avoid random failures. The behavior is controlled using the
environment variable IGT_KMS_IGNORE_HPD. Set this var in CI
exections where panels that generate spurioud HPDs are used.

Vinod Govindapillai (2):
  lib/igt_debugfs: set provision to ignore long HPDs
  lib/igt_kms: handle spurious HPDs - IGT part

 lib/igt_debugfs.c | 22 ++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 lib/igt_kms.c     | 53 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 74 insertions(+), 2 deletions(-)

-- 
2.34.1
