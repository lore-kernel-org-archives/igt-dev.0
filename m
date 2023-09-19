Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803ED10E13B
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Sep 2023 17:13:17 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 19 Sep 2023 10:02:29 -0700
Message-Id: <20230919170230.3307408-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] lib/intel_allocator: Limit last page if
 not reserved
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jonathan.cavitt@intel.com, nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We currently limit the last page of the allocator space to avoid a hang
on some platforms when a batch would be pinned in the last page.
However, in the future, we may already be reserving the last page of the
ppgtt in kernel space, so we would not need to limit the last page
because gem_aperture_size would not report its existence in
__intel_allocator_open_full when this is the case.

Check the gtt_size and only limit the last page if it's not already
reserved by kernel space.  This is generalized to if the reported page
count is even.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>
CC: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>

Jonathan Cavitt (1):
  lib/intel_allocator: Limit last page if not reserved

 lib/intel_allocator.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

-- 
2.25.1
