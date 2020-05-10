Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AD76E0BA
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2020 02:33:31 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Mon, 11 May 2020 01:05:49 +0530
Message-Id: <20200510193551.9818-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/kms_chamelium Handle DP FSM more
 reliably
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org, imre.deak@intel.com
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Receiver reset is always required after we set a new mode, so let's disable
the mode (reset_state() does that) before we switch to a new mode.
With this we will get the HPD pulses reliably for each iteration over
all the supoprted modes.

Cc: Hiler Arkadiusz <arkadiusz.hiler@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Issue: https://gitlab.freedesktop.org/drm/intel/issues/262

Kunal Joshi (2):
  tests/kms_chamelium Fix DP FSM in dp-mode-timings
  HAX: Run in BAT

 tests/intel-ci/fast-feedback.testlist |  1 +
 tests/kms_chamelium.c                 | 46 +++++++++++++++++----------
 2 files changed, 31 insertions(+), 16 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
