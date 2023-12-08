Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB6F10E0E3
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 00:30:03 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/2] Add GT IP version query support
Date: Thu,  7 Dec 2023 16:29:42 -0800
Message-ID: <20231208002944.1290951-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

v2:
 - Rename 'revid' to 'rev' to match kernel series update.

Matt Roper (2):
  drm-uapi/xe: Add IP version to GT query
  tests/xe_query: Query and sanity-check GT ip versions

 include/drm-uapi/xe_drm.h | 10 +++++++++-
 tests/intel/xe_query.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.43.0
