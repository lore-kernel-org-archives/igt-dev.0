Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5EF10E722
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 11:19:13 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Wed,  8 Nov 2023 16:52:48 +0530
Message-Id: <20231108112251.819141-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add wait fence Negative tests
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Negative tests to check XE_WAIT_USER_FENCE ioctl.

Janga Rahul Kumar (3):
  tests/intel/xe_waitfence: Add invalid-flag subtest
  tests/intel/xe_waitfence: Add invalid-ops subtest
  tests/intel/xe_waitfence: Add invalid-engine subtest

 tests/intel/xe_waitfence.c | 103 +++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

-- 
2.25.1
