Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF2B10E1B1
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 05:13:18 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 10:56:40 +0530
Message-Id: <20231109052644.357727-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/4] Add multi-gt support for RC6 residency test
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

Add multi-gt support for the i915_pm_rc6_residency test. 

Sujaritha Sundaresan (4):
  tests/intel: Add multi-gt support for rc6-idle test
  tests/intel: Add multi-gt support for rc6-fence test
  tests/intel: Add multi-gt support for rc6-accuracy test
  tests/intel: Print drpc info for rc6_residency test

 tests/intel/i915_pm_rc6_residency.c | 133 ++++++++++++++++++----------
 1 file changed, 84 insertions(+), 49 deletions(-)

-- 
2.25.1
