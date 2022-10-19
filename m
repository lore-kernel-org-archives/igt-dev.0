Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E24610F24E
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 14:41:01 +0000 (UTC)
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: petri.latvala@intel.com, kamil.konieczny@linux.intel.com,
 igt-dev@lists.freedesktop.org
Date: Wed, 19 Oct 2022 15:40:45 +0100
Message-Id: <20221019144048.2421051-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 0/3] Context isolation uAPI fixes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adrian.larumbe@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch series was prompted by a requirement laid out in
https://gitlab.freedesktop.org/drm/intel/-/issues/4264

There's a parallel kernel patch at
https://lists.freedesktop.org/archives/intel-gfx/2022-July/302530.html

It addresses two main issues:
 - Determine whether a given engine has context isolation support in UM rather
than querying the kernel driver through a param IOCTL, because its semantics
are due to change from an engine availability bitmask to a simple boolean.
 - Skip tests where a reset is involved and both RCS and CSS engines are present.
Currently the only device where this would be the case is DG2.

Adrian Larumbe (3):
  lib/i915/i915_drm_local: Remove COMPUTE class engine
  i915/gem_ctx_isolation: Change semantics of ctx isolation uAPI
  i915/gem_ctx_isolation: Skip engine reset context test on DG2

 lib/i915/i915_drm_local.h      |  2 -
 tests/i915/gem_ctx_isolation.c | 99 ++++++++++++++++++++++------------
 2 files changed, 65 insertions(+), 36 deletions(-)

-- 
2.38.0
