Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D882710E03E
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 07:01:52 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 12:31:45 +0530
Message-Id: <20230912070149.1305060-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 0/4] enable feature-discovery tests
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

Enable feature-discovery tests for xe. Add testplan documentation.
Add new dp-mst feature discovery test.

Swati Sharma (4):
  tests: rename feature_discovery to kms_feature_discovery
  tests/kms_feature_discovery: add testplan documentation
  tests/intel-ci: remove feature_discovery from blocklist
  tests/kms_feature_discovery: detect mst configuration

 tests/intel-ci/xe.blocklist.txt               |  1 -
 ...re_discovery.c => kms_feature_discovery.c} | 73 ++++++++++++++++++-
 tests/meson.build                             |  2 +-
 3 files changed, 73 insertions(+), 3 deletions(-)
 rename tests/{feature_discovery.c => kms_feature_discovery.c} (60%)

-- 
2.25.1
