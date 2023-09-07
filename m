Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680C410E7F2
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 14:32:19 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Sep 2023 20:02:11 +0530
Message-Id: <20230907143214.1280453-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] enable feature-discovery tests
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

Enable feature-discovery tests for xe. Add documentation.
Enable dp-mst feature discovery test.

Swati Sharma (3):
  tests: rename feature_discovery to kms_feature_discovery
  tests/intel-ci: remove feature_discovery from blocklist
  tests/kms_feature_discovery: detect mst configuration

 tests/intel-ci/xe.blocklist.txt               |  1 -
 ...re_discovery.c => kms_feature_discovery.c} | 79 ++++++++++++++++++-
 tests/meson.build                             |  2 +-
 3 files changed, 79 insertions(+), 3 deletions(-)
 rename tests/{feature_discovery.c => kms_feature_discovery.c} (59%)

-- 
2.25.1
