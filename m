Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BCB6E135
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2020 05:59:35 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 23 Apr 2020 04:31:49 +0530
Message-Id: <20200422230151.29558-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 0/2] tests/kms_chamelium: Capture on type-c
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

Chamelium uses HPD pulses to signal the need for a receiver reset
using DPMS cycle.Some connectors (e.g. DP over TypeC) have limitations
and will receive just a single such pulse and discard the rest.
This lasts until we disable the mode completetly and only then reenable it.

Receiver reset is always required after we set a new mode, so let's disable
the mode (reset_state() does that) before we switch to a new mode.
With this we will get the HPD pulses reliably for each iteration over
all the supoprted modes.

v2: Correction in code flow (Arek)

v3: Modified commit message. (Arek)

Kunal Joshi (2):
  tests/kms_chamelium: Capture on type-c
  HAX: Run in BAT

 tests/intel-ci/fast-feedback.testlist |  45 ++++++++++-
 tests/kms_chamelium.c                 | 110 +++++++++++++++++---------
 2 files changed, 118 insertions(+), 37 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
