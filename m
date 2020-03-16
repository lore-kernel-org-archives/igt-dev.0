Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 16 Mar 2020 09:45:41 +0100
Message-Id: <20200316084543.15421-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RESUBMIT PATCH 0/2] tests/gem_userptr_blits: Refresh
 other now MMAP_GTT dependent subtests
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
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Together with recently submitted patches, this series concludes
MMAP_OFFSET related changes required for gem_userptr_blits.

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
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
