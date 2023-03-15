Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AE310E9A0
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 10:03:01 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 15:36:55 +0530
Message-Id: <20230315100657.3385384-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] fix minor chamelium issues
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

In some subtests of kms_chamelium_edid we were trying
to plug a port that could already be plugged, so
reset chamelium state at the start

It is known issue that we don't get hotplug with enabled
mode on TypeC connector, issue a disabling modeset for
every plug/unplug cycle

Kunal Joshi (2):
  tests/chamelium/kms_chamelium_edid: reset state before starting
    subtest
  tests/chamelium/kms_chamelium_hpd: issue disabling modeset when for
    very plug/unplug cycle

 tests/chamelium/kms_chamelium_edid.c | 3 +++
 tests/chamelium/kms_chamelium_hpd.c  | 1 +
 2 files changed, 4 insertions(+)

-- 
2.25.1
