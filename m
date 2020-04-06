Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon,  6 Apr 2020 18:32:35 +0200
Message-Id: <20200406163237.28293-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/gem_userptr_blits: Refresh
 still MMAP_GTT dependent subtests
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Refresh subtests which are still using pre-v4 MMAP_GTT API.

v2: Patch 2/2: clear 'map' before reuse (Zbigniew).

Janusz Krzysztofik (2):
  tests/gem_userptr_blits: Refresh readonly-mmap-unsync exercise
  tests/gem_userptr_blits: Refresh other still MMAP_GTT dependent
    subtests

 tests/i915/gem_userptr_blits.c | 132 ++++++++++++++++++++++++---------
 1 file changed, 97 insertions(+), 35 deletions(-)

-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
