Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F98F89C1A
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 06:07:03 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date: Mon, 17 Feb 2020 11:20:18 +0530
Message-Id: <20200217055019.32591-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/1] lib/i915/gem_ring : set the engine to
 default context
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Copy the existing engine map from default context to 
newly created  default context

Bommu Krishnaiah (1):
  lib/i915/gem_ring : set the engine to default context

 lib/i915/gem_ring.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.25.0.4.g0ad7144999

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
