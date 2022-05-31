Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E972910E00D
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 06:52:17 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Tue, 31 May 2022 08:52:08 +0200
Message-Id: <20220531065211.233242-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Fix issues on benchmarks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

There are two benchmarks that aren't work properly:

- gem_blt is not estimating a loop count that would be close
  to 0.1 ms. The current calculus provide a value that would
  take ~23 days to complete (tested on ADL-P):

	$ sudo timeout 100 ./build/benchmarks/gem_blt || echo "Timeout!"
	Timeout!

- gem_syslatency crashes with SIGSEGV, if the environment is not
  ready to use realtime priority. The root cause is that setting
  realtime now requires some CGroup changes nowadays:

	$ sudo ./build/benchmarks/gem_syslatency
	Received signal SIGSEGV.
	Stack trace:
	 #0 [fatal_sig_handler+0x163]
	 #1 [__sigaction+0x50]
	 #2 [__pthread_clockjoin_ex+0x22]
	 #3 [main+0x346]
	 #4 [__libc_start_call_main+0x80]
	 #5 [__libc_start_main+0x89]
	 #6 [_start+0x25]
	Segmentation fault

This series addresses such issues.

Mauro Carvalho Chehab (3):
  benchmarks/gem_blt: fix baseline estimation
  benchmarks/gem_syslatency: don't die with SIGSEGV
  benchmarks/gem_syslatency: make realtime mode optional

 benchmarks/gem_blt.c        | 18 +++++-------------
 benchmarks/gem_syslatency.c | 28 +++++++++++++++++++++-------
 2 files changed, 26 insertions(+), 20 deletions(-)

-- 
2.36.1
