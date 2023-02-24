Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4372410EC59
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Feb 2023 15:12:37 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Feb 2023 20:44:56 +0530
Message-Id: <20230224151459.17177-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/3] Validate max source size
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

i915 specific test is added to validate max source size width.

Swati Sharma (3):
  tests/kms_plane_scaling: Prep work
  tests/kms_plane_scaling: Minor fixes
  tests/kms_plane_scaling: Add test to validate max source size

 tests/kms_plane_scaling.c | 133 ++++++++++++++++++++++++++++++++------
 1 file changed, 115 insertions(+), 18 deletions(-)

-- 
2.25.1
