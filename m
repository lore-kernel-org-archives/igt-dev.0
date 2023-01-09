Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8064410E0B0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 13:42:40 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 19:10:40 +0530
Message-Id: <20230109134046.85340-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] Modified few kms tests to reduce
 execution time
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

Modified few tests to reduce the overall execution time
of the test by restricting all the subtests to execute
only on single pipe instead of all the pipes.

Nidhi Gupta (6):
  tests/i915/kms_mmap_write_crc: Restrict the number of iteration to
    reduce the execution time
  tests/kms_plane_alpha_blend: Restrict the execution of subtest to
    single pipe
  tests/kms_color: Restrict the execution of subtests to single pipe
  tests/kms_plane_scaling: Restrict the execution of subtest to single
    pipe
  tests/kms_pipe_crc_basic: Restrict the execution of subtest to single
    pipe
  tests/kms_async_flips: Restrict the execution of the subtest to single
    pipe

 tests/i915/kms_mmap_write_crc.c |   7 +-
 tests/kms_async_flips.c         |   2 +
 tests/kms_color.c               |   9 +++
 tests/kms_pipe_crc_basic.c      |   6 ++
 tests/kms_plane_alpha_blend.c   |   5 +-
 tests/kms_plane_scaling.c       | 113 +++++++++++++++++++-------------
 6 files changed, 93 insertions(+), 49 deletions(-)

-- 
2.25.1
