Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D041F10E167
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 08:38:11 +0000 (UTC)
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Mar 2023 10:37:49 +0200
Message-Id: <20230309083751.347335-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/2] Handle spurious HPDs
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
  lib/igt_kms: handle spurious HPDs

 lib/igt_debugfs.c | 26 ++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 lib/igt_kms.c     | 56 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.34.1
