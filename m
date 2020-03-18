Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF306E20B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2020 13:35:24 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Wed, 18 Mar 2020 19:03:25 +0530
Message-Id: <20200318133326.18801-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/1] [RFC 0/1] test/kms: Use bare number of
 crtc index to
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
List-ID: <igt-dev@lists.freedesktop.org>

In non-continous pipe display,
1. if PIPE_B,C is disabled in kernel, PIPE_A & PIPE_D
get registered with 0,1 indexes in display pipes[] array
and kmstest_pipe_name() always prints PIPE_B for enum pipe 1
which is actually PIPE_D in kernel.
2. And in kernel the possible_crtc bit map is based on
crtc index and for PIPE_D second least bit set in possible_crtc,
macro for_each_pipe_with_valid_output() with enum pipe index
always assumes PIPE_B for second least bit in possible_crtc
but it is PIPE_D in kernel.

To avoid this using bare number of crtc index
to get a pipe from display->pipes[] array to support
non-continuous pipe display.
This is a sample change to review on usage of bare number of
https://patchwork.freedesktop.org/series/74431/
crtc index for each pipe, based upon the review the patch series
will be updated with this change.

Mohammed Khajapasha (1):
  test/kms: Use bare number of crtc index to get a pipe

 lib/igt_kms.c                 |  22 ++--
 lib/igt_kms.h                 |  26 ++---
 tests/kms_atomic_transition.c | 196 +++++++++++++++++-----------------
 3 files changed, 121 insertions(+), 123 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
