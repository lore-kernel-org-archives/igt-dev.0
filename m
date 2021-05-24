Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC796E8CD
 for <igt-dev@lists.freedesktop.org>; Mon, 24 May 2021 16:34:54 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Mon, 24 May 2021 18:34:28 +0200
Message-Id: <20210524163429.5658-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/1] Fix the multiprocess mode of intel
 allocator
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

In the multiprocess mode all requests to the allocator are
processed in the parent. However, in certain scenarios
(for example gem_exec_capture@pi), a child process may want
to create an allocator instance using its own private file
desriptor.  Thus all ioctls used to determine available gtt size
must be called in the child process and not in the parent.

This patch implements the above change.



Andrzej Turko (1):
  lib/intel_allocator: Move the ioctl calls to client processes

 lib/intel_allocator.c        | 51 ++++++++++++++++++++++++++----------
 lib/intel_allocator_random.c | 28 ++++++++------------
 lib/intel_allocator_reloc.c  | 20 ++++----------
 lib/intel_allocator_simple.c | 44 ++++---------------------------
 4 files changed, 58 insertions(+), 85 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
