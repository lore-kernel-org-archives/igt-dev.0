Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC076E8B3
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 10:39:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  7 Aug 2020 00:03:58 +0530
Message-Id: <20200806183400.31856-1-bhanuprakash.modem@intel.com>
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

 tests/intel-ci/fast-feedback.testlist |  4 ++
 tests/kms_pipe_crc_basic.c            | 73 +++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
