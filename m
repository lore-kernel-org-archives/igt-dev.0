Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3188D6EABF
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2020 09:24:36 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Fri,  8 May 2020 07:56:53 +0530
Message-Id: <20200508022655.5059-1-kunal1.joshi@intel.com>
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

For more details
Refer commit: c8dc1fd926a550308b971ca7d83fe0a927a38152

Cc: Hiler Arkadiusz <arkadiusz.hiler@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Issue: https://gitlab.freedesktop.org/drm/intel/issues/262
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Kunal Joshi (2):
  tests/kms_chamelium Fix DP FSM in dp-mode-timings
  HAX: Run in BAT

 tests/intel-ci/fast-feedback.testlist |  1 +
 tests/kms_chamelium.c                 | 43 +++++++++++++++++----------
 2 files changed, 29 insertions(+), 15 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
