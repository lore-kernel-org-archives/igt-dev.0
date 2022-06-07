Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Tue,  7 Jun 2022 14:17:44 -0700
Message-Id: <20220607211747.3335656-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v6 i-g-t 0/3] Update DRM UAPI and add test for new
 hw info query
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Various UMDs require hardware configuration information about the
current platform. A new interface has been added to the KMD to return
this information. So, add a test for the new interface.

Also, update to the latest DRM UAPI header file that contains the new
query enums.

Lastly, none of the query tests had description entries. So made some
up.

v2: Rebased to newer baseline.
v3: Update UAPI header file.
v4: Use correct method for updating header file.
v5: Add descriptions to all the query tests.
v6: Fix typo in description.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  include/drm-uapi: Update to latest i915_drm.h
  tests/i915/query: Add descriptions to existing tests

Rodrigo Vivi (1):
  tests/i915/query: Query, parse and validate the hwconfig table

 include/drm-uapi/i915_drm.h | 398 ++++++++++++++++++++++++++++--------
 lib/intel_hwconfig_types.h  | 118 +++++++++++
 tests/i915/i915_query.c     | 192 +++++++++++++++++
 3 files changed, 622 insertions(+), 86 deletions(-)
 create mode 100644 lib/intel_hwconfig_types.h

-- 
2.36.0
