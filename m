Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F405D6E8AF
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 08:43:57 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Fri, 19 Feb 2021 14:12:55 +0530
Message-Id: <20210219084257.31867-1-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2] Added option to toggle fsm handling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: mukunda.pramodh.kumar@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

We communicate with chamelium through xmlrpc which is
uni-directional, if chamelium wants to signal something
it triggers hpd pulses which we detect and then do DPMS
cycle on-off, tests which changes modes such as 
dp-frame-dump requires this, but test which runs through out
on a single mode doesn't, so providing an option to toggle.

Kunal Joshi (2):
  lib/igt_chamelium: Added toggle for fsm_handling
  tests/kms_color_chamelium: Disabled fsm handling for
    kms_color_chamelium

 lib/igt_chamelium.c         | 6 ++++--
 lib/igt_chamelium.h         | 2 ++
 tests/kms_color_chamelium.c | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
