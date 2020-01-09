Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu,  9 Jan 2020 15:01:23 +0100
Message-Id: <20200109140125.18483-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 0/2] tests/prime_vgem: Examine blitter
 access path
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On future hardware with missing GGTT BAR we won't be able to exercise
dma-buf access via that path.  An alternative to basic-gtt subtest for
testing dma-buf access is required, as well as basic-fence-mmap and
coherency-gtt subtest alternatives for testing WC coherency.

Access to the dma sg list feature exposed by dma-buf can be tested
through blitter.  Unfortunately we don't have any equivalently simple
tests that use blitter.  Provide them.

Blitter XY_SRC_COPY method implemented by igt_blitter_src_copy__raw()
IGT library function has been chosen.

v2: As fast copy is not supported on platforms older than Gen 9,
    use XY_SRC_COPY instead (Chris),
  - bundle with a patch providing XY_SRC_COPY implementation,
  - add subtest descriptions.

Janusz Krzysztofik (1):
  tests/prime_vgem: Examine blitter access path

Vanshidhar Konda (1):
  lib/intel_batchbuffer: Add blitter copy using XY_SRC_COPY_BLT

 lib/intel_batchbuffer.c | 185 ++++++++++++++++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  21 +++++
 tests/prime_vgem.c      | 192 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 398 insertions(+)

-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
