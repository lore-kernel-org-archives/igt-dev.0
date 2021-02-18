Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347636E3AC
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Feb 2021 09:40:00 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 18 Feb 2021 15:08:56 +0530
Message-Id: <20210218093859.29006-1-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/3] Added option to toggle fsm handling
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
it triggers hpd pulses which we detect and then do
DPMS cycle on-off, tests which changes modes such as
dp-frame-dump requires this, but test which runs through out
on a single mode doesn't, so providing an option to toggle.

Kunal Joshi (3):
  lib/igt_chamelium: Added toggle for fsm_handling
  Enabled FSM handling for kms_cahmelium and disabled it for
    kms_color_chamelium
  HAX: BAT RUN,

 lib/igt_chamelium.c                   | 4 ++--
 lib/igt_chamelium.h                   | 2 ++
 tests/intel-ci/fast-feedback.testlist | 2 ++
 tests/kms_chamelium.c                 | 2 ++
 tests/kms_color_chamelium.c           | 2 ++
 5 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
