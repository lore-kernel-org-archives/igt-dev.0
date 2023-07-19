Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E264110E3F5
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jul 2023 07:05:26 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Jul 2023 12:39:36 +0530
Message-Id: <20230719070939.562159-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/3] Add seperate blacklist for specific config
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Different setups in CI may have different config,
we can apply suitable blacklist and get clear
results.

Kunal Joshi (3):
  tests/intel-ci: Added chamelium config blacklist
  tests/intel-ci: Added psr config blacklist
  tests/intel-ci: added blacklist to meson.build

 tests/intel-ci/chamelium.blacklist | 1 +
 tests/intel-ci/meson.build         | 2 ++
 tests/intel-ci/psr.blacklist       | 1 +
 3 files changed, 4 insertions(+)
 create mode 100644 tests/intel-ci/chamelium.blacklist
 create mode 100644 tests/intel-ci/psr.blacklist

-- 
2.25.1
