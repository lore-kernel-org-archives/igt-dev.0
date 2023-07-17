Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ACD10E04C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jul 2023 07:45:56 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 17 Jul 2023 13:19:56 +0530
Message-Id: <20230717075005.390330-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/9] Add seperate blacklist for specific config
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

Kunal Joshi (9):
  tests/intel-ci: Added chamelium config blacklist
  tests/intel-ci: Added psr config blacklist
  tests/intel-ci: Added dsc config blacklist
  tests/intel-ci: Added vrr config blacklist
  tests/intel-ci: Added 2x config blacklist
  tests/intel-ci: Added 3x config blacklist
  tests/intel-ci: Added 4x config blacklist
  tests/intel-ci: Added tiled config blacklist
  tests/intel-ci: Added hdr config blacklist

 tests/intel-ci/2x.blacklist        | 1 +
 tests/intel-ci/3x.blacklist        | 1 +
 tests/intel-ci/4x.blacklist        | 1 +
 tests/intel-ci/chamelium.blacklist | 1 +
 tests/intel-ci/dsc.blacklist       | 1 +
 tests/intel-ci/hdr.blacklist       | 1 +
 tests/intel-ci/psr.blacklist       | 1 +
 tests/intel-ci/tiled.blacklist     | 1 +
 tests/intel-ci/vrr.blacklist       | 1 +
 9 files changed, 9 insertions(+)
 create mode 100644 tests/intel-ci/2x.blacklist
 create mode 100644 tests/intel-ci/3x.blacklist
 create mode 100644 tests/intel-ci/4x.blacklist
 create mode 100644 tests/intel-ci/chamelium.blacklist
 create mode 100644 tests/intel-ci/dsc.blacklist
 create mode 100644 tests/intel-ci/hdr.blacklist
 create mode 100644 tests/intel-ci/psr.blacklist
 create mode 100644 tests/intel-ci/tiled.blacklist
 create mode 100644 tests/intel-ci/vrr.blacklist

-- 
2.25.1
