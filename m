Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182C10E11B
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 08:24:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 13:44:47 +0530
Message-Id: <20231026081449.3967346-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/2] Add XE support for kms_fb_coherency
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add XE support for kms_fb_coherency

Bhanuprakash Modem (2):
  tests/i915/kms_fb_coherency: Add XE support
  tests/intel-ci: Drop kms_fb_coherency test from XE blocklist

 tests/intel-ci/xe.blocklist.txt |  1 -
 tests/intel/kms_fb_coherency.c  | 43 ++++++++++++++++++---------------
 2 files changed, 23 insertions(+), 21 deletions(-)

--
2.40.0
