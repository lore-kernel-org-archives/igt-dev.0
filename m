Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue,  3 Mar 2020 13:15:07 +0100
Message-Id: <20200303121509.29662-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 0/2] tests/gem_userptr_blits: Refresh
 other now MMAP_GTT dependent subtests
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
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Together with recently submitted "tests/gem_userptr_blits: Refresh
map-fixed-invalidate* subtests" (Chris' R-b: already collected) and
"tests/gem_userptr_blits: Exercise new invalid mapping types" (a part
of "tests/gem_userptr_blits: Enhance invalid mapping exercise" series,
still waiting for someone to provide a review) patches, this series
concludes MMAP_OFFSET related changes required for gem_userptr_blits,
I believe.

Thanks,
Janusz


Janusz Krzysztofik (2):
  tests/gem_userptr_blits: Refresh readonly-mmap-unsync exercise
  tests/gem_userptr_blits: Refresh other now MMAP_GTT dependent subtests

 tests/i915/gem_userptr_blits.c | 129 ++++++++++++++++++++++++---------
 1 file changed, 95 insertions(+), 34 deletions(-)

-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
