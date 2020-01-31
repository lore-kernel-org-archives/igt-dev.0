Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 31 Jan 2020 14:20:36 +0100
Message-Id: <20200131132037.23319-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 0/1] drm/i915: Never allow userptr into the
 new mapping types
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Test-with: <20200131131234.23058-2-janusz.krzysztofik@linux.intel.com>

As I'm proposing to change an error code returned by an IOCTL, this
patch must be tested with a corresponding patch on the IGT side.

Janusz Krzysztofik (1):
  drm/i915: Never allow userptr into the new mapping types

 drivers/gpu/drm/i915/gem/i915_gem_mman.c         | 5 ++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h       | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c      | 2 +-
 drivers/gpu/drm/i915/i915_gem.c                  | 4 ++--
 5 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.21.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
