Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6A310E98A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 10:19:18 +0000 (UTC)
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Feb 2023 12:19:02 +0200
Message-Id: <20230209101904.998315-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Handle spurious HPDs - IGT part
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

Some panels generate spurious HPDs during CI execution causing random
unexpected failures. Driver can ignore long HPDs during CI using
ignore_long_hpd flag flag set/unset through debugfs. By forcing
the already connected connectors ON from IGT, we can avoid the detect
hooks being executed from drm and hence avoid random failures if
the panels are in some unknown state in the middle of CI execution
because of spurious HPDs.

Vinod Govindapillai (2):
  lib/igt_debugfs: set provision to ignore long HPDs
  lib/igt_kms: handle spurious HPDs - IGT part

 lib/igt_debugfs.c | 22 +++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 lib/igt_kms.c     | 54 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 75 insertions(+), 2 deletions(-)

-- 
2.34.1
