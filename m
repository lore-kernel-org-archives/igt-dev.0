Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F55F10E411
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Nov 2022 07:08:20 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 30 Nov 2022 08:07:58 +0100
Message-Id: <cover.1669791691.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Support custom contexts in exec_blit()
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

The series changes how exec_blit() sets blitter engine id in
execbuf used by igt_blitter_src_copy() and
igt_blitter_fast_copy__raw(). Currently, the function assumes
a legacy engine identifier, which won't work for contexts that
have non-standard engine layout.

With this patch series, it will be possible to find a copy
engine based on intel_ctx_cfg_t passed in by the blitter
copy functions. To make it possible, find_engine() had to be
slightly modified. Here, instead of using intel_bb (which
limits the function usage to this structure only), we use
context config extracted from intel_bb, making find_engine()
more flexible.

Karolina Stolarek (2):
  lib/intel_batchbuffer: Make find_engine() more flexible
  lib/intel_batchbuffer: Use correct engine id in exec_blit()

 lib/igt_fb.c            |  4 +--
 lib/intel_batchbuffer.c | 60 ++++++++++++++++++++++++-----------------
 lib/intel_batchbuffer.h |  2 ++
 tests/kms_prime.c       |  6 +++--
 tests/prime_vgem.c      | 14 +++++-----
 5 files changed, 50 insertions(+), 36 deletions(-)

--
2.25.1
