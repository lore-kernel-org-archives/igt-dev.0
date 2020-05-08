Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri,  8 May 2020 15:56:29 +0200
Message-Id: <20200508135631.8099-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/gem_exec_nop: Remove submission
 batching
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Execbuf requests are now submitted by subtests in batches of 1024
repetitions.  That may be too many under some circumstances (e.g.,
intensive logging output) and subtests may take far more time than
expected.

Kill obsolete showcase for an old GuC failure, then remove submission
batching from subtests which don't require submicrosecond precision.

Janusz Krzysztofik (2):
  tests/gem_exec_nop: Kill obsolete pass/fail metric
  tests/gem_exec_nop: Remove submission batching

 tests/i915/gem_exec_nop.c | 137 ++++++++++++++++----------------------
 1 file changed, 59 insertions(+), 78 deletions(-)

-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
