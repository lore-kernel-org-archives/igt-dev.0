Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAB089D6C
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 10:09:35 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  6 Aug 2020 23:34:26 +0530
Message-Id: <20200806180426.31343-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20200806124450.29360-1-bhanuprakash.modem@intel.com>
References: <20200806124450.29360-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v1 2/2] intel-ci: Add compare CRC sanity test to
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

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b796b264..b9d769d8 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -110,6 +110,9 @@ igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_frontbuffer_tracking@basic
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c
 igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
 igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
 igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
