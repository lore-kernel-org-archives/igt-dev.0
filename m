Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 10 Jun 2021 14:52:45 -0700
Message-Id: <20210610215247.2996757-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 0/2] Add tests for new hw info queries
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Various UMDs require hardware configuration information about the
current platform. New interfaces have been added to the KMD to return
this informatio. So, add some tests for the new interfaces.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  tests/i915/query: Add test for L3 bank count

Rodrigo Vivi (1):
  tests/i915/query: Query, parse and validate the hwconfig table

 include/drm-uapi/i915_drm.h |   2 +
 lib/intel_hwconfig_types.h  | 102 ++++++++++++++++++++++
 tests/i915/i915_query.c     | 163 ++++++++++++++++++++++++++++++++++++
 3 files changed, 267 insertions(+)
 create mode 100644 lib/intel_hwconfig_types.h

-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
