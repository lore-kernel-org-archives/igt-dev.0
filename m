Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Dale B Stimson <dale.b.stimson@intel.com>
Date: Mon, 27 Jan 2020 10:12:18 -0800
Message-Id: <cover.1580147712.git.dale.b.stimson@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] i915/gem_ctx_isolation:
 __for_each_physical_engine + engine mapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

i915/gem_ctx_isolation: __for_each_physical_engine and gem_engine_topology

V2: Use new function gem_context_clone_with_engines

Use __for_each_physical_engine with gem_engine_topology.

Iterates through the definitive list of all engines
present.

Patch 1 was originally posted by Ramalingam C <ramalingam.c@intel.com>.
Since then, slight modifications have been done to it due to
upstream changes.  Patch 1 is being kept separate from patch 2 in
order to assure proper attribution to the author.

Dale B Stimson (1):
  i915/gem_ctx_isolation: use the gem_engine_topology library, part 2

Ramalingam C (1):
  i915/gem_ctx_isolation: use the gem_engine_topology library, part 1

 tests/i915/gem_ctx_isolation.c | 44 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
