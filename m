Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB38811B439
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 20:12:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Jun 2022 22:12:22 +0200
Message-Id: <20220627201223.8570-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Add sriov selector
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Before I start extending igt device selection adding grouping I need 
to merge pending sriov selector.

I know checkpatch is complaing - but other selectors looks similar and
have same issues (eh, forgot about many leading tabs at the moment).

More explanation:
-----------------

Currently we're limited to real world systems making device selection 
code error prone. I started extending it adding simulating udev events
to produce some artificial setups but making the selection code robust.
Łukasz series added sriov selector so I would like to take it into account
during the extending process.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>

Łukasz Łaguna (1):
  lib/igt_device_scan: Add sriov selector

 lib/igt_device_scan.c | 148 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

-- 
2.34.1
