Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFA56E8AF
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 10:12:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  6 Aug 2020 23:37:47 +0530
Message-Id: <20200806180749.31464-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 0/2] tests/kms_pipe_crc_basic: Sanity check for
 CRC mismatches
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
List-ID: <igt-dev@lists.freedesktop.org>

This series will add a crc-sanity test to verify the CRC mechanism is
clean from the platform and add the subtest to fast-feedback list.

Bhanuprakash Modem (2):
  tests/kms_pipe_crc_basic: Sanity check for CRC mismatches
  intel-ci: Add compare CRC sanity test to BAT

 tests/intel-ci/fast-feedback.testlist |  3 ++
 tests/kms_pipe_crc_basic.c            | 73 +++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
