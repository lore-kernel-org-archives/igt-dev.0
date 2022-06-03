Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Fri,  3 Jun 2022 08:55:44 -0700
Message-Id: <20220603155546.2248816-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v4 i-g-t 0/2] Update DRM UAPI and add test for
 new hw info query
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Various UMDs require hardware configuration information about the
current platform. A new interface has been added to the KMD to return
this information. So, add a test for the new interface.

Also, update to the latest DRM UAPI header file that contains the new
query enums.

v2: Rebased to newer baseline.
v3: Update UAPI header file.
v4: Use correct method for updating header file.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  include/drm-uapi: Update to latest i915_drm.h

Rodrigo Vivi (1):
  tests/i915/query: Query, parse and validate the hwconfig table

 include/drm-uapi/i915_drm.h | 398 ++++++++++++++++++++++++++++--------
 lib/intel_hwconfig_types.h  | 118 +++++++++++
 tests/i915/i915_query.c     | 179 ++++++++++++++++
 3 files changed, 609 insertions(+), 86 deletions(-)
 create mode 100644 lib/intel_hwconfig_types.h

-- 
2.36.0
