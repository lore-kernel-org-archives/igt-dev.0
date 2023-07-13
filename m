Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57F810E657
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 09:13:15 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 14:47:23 +0530
Message-Id: <20230713091726.272816-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Fix autodiscovery in chamelium
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

Recently issues were spotted on CI runs, where autodiscovery
behaved weirdly, below example

[Chamelium:(null)]
ChameliumPortID=1

This patch series includes below fixes
- TypeC connector need disabling modeset for correctly doing hpd cycle
  so do it before going for autodiscovery
- port_count was used to iterate on chamelium ports but its not
  neccessary that mapped ports are always on the top chamelium_ports
  array after autodiscovery

Kunal Joshi (3):
  lib/igt_chamelium: reset chamelium before starting autodiscovery
  lib/igt_chamelium: Added is_mapped to track mapped ports
  lib/igt_chamelium: Added function to sort chamelium ports based on
    is_mapped

 lib/igt_chamelium.c | 56 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

-- 
2.25.1
