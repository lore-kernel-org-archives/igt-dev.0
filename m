Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B3E6E8B5
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 10:39:10 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  7 Aug 2020 00:04:00 +0530
Message-Id: <20200806183400.31856-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20200806183400.31856-1-bhanuprakash.modem@intel.com>
References: <20200806183400.31856-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 2/2] intel-ci: Add compare CRC sanity test to
 BAT
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
To: bhanuprakash.modem@intel.com, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

We need to sanity-check for the CRC mismatches, otherwise
the display validation tests are flawed.

This patch will add CRC compare mismatch subtests to the
fast-feedback list to make sure the CRC mechanism is clean
from the platform.

V2:
* Add pipe-d as well (Petri)

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Acked-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b796b264..b98cdb24 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -110,6 +110,10 @@ igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_frontbuffer_tracking@basic
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d
 igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
 igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
 igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
