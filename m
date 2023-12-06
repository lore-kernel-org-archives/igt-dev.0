Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739C110E766
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 20:49:51 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 12:49:40 -0800
Message-ID: <20231206204942.1105505-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add GT IP version query support
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

Update the Xe uapi header to match the proposed XeKMD uapi (i.e.,
replacing one of the reserved qwords of the GT query with IP version
fields) and add support to the Xe query test.

Matt Roper (2):
  drm-uapi/xe: Add IP version to GT query
  tests/xe_query: Query and sanity-check GT ip versions

 include/drm-uapi/xe_drm.h | 10 +++++++++-
 tests/intel/xe_query.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.43.0
