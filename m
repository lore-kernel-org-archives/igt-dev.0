Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA1710E0FB
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 08:21:45 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Thu,  3 Aug 2023 08:21:33 +0000
Message-Id: <20230803082134.3039513-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] xe.blocklist description update
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Update of description of blocked tests:
* mock DRM KUnit:
	igt@dmabuf.*
	igt@drm_buddy
	igt@drm_mm
	igt@kms_selftest.*
* test blocked as KMD not ready
	igt@xe_sysfs*

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Katarzyna Dec (1):
  tests/intel-ci: Add detailed description to blocked tests

 tests/intel-ci/xe.blocklist.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.34.1


