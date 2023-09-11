Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6463110E2DB
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 12:23:00 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Sep 2023 15:22:54 +0300
Message-Id: <20230911122256.30665-1-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] i915_pipe_stress fixes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

- Fix for intel_buf initialization in create_buf
- Fix for the Bigjoiner-related issues

Stanislav Lisovskiy (2):
  tests/intel/i915_pipe_stress: Fix create_buf function
  tests/intel/i915_pipe_stress: Use only first pipe if Bigjoiner is used

 tests/intel/i915_pipe_stress.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.37.3
