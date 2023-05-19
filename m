Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB43310E5D0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 06:51:52 +0000 (UTC)
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 19 May 2023 12:14:49 +0530
Message-Id: <20230519064453.1334690-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] some cleanup on kms_async_clip
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The series cleans up the kms_async_flip and add test for all supported
modifiers.

Arun R Murthy (4):
  tests/kms_async_flips: Get rid of i915 specific fb creation
  tests/kms_async_flips: Run the test for all outputs
  tests/kms_async_flips: Split test_init()
  tests/kms_async_flips: Test all modifiers

 tests/kms_async_flips.c | 128 +++++++++++++++++++++-------------------
 1 file changed, 68 insertions(+), 60 deletions(-)

-- 
2.25.1
