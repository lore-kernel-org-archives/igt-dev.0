Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02872BF9C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Aug 2022 16:18:32 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id 5so492227uay.5
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Aug 2022 09:18:32 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 12 Aug 2022 13:18:22 -0300
Message-Id: <20220812161826.4074-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/4] add kselftest runner documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: siqueirajordao@riseup.net, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In the interest of making the code more accessible, add documentation
on structs and functions related to the kselftest.
As an extra, add instructions about writing documentation and fixes
igt_kselftest_begin() always returning zero.

Sorry about the resend, I missed the mailing list address earlier.

Changes from v1 (https://patchwork.freedesktop.org/series/106921/):

- Added R-b in the first patch

- Moved gtkdoc link above igt_require to match occurrence in text in
the 2nd patch

- Fix code style issues reported by Petri Latvala
<petri.latvala@intel.com> in the last patch

- In the third patch, instead of returning non-zero in the function
igt_kselftest_begin() from errors while opening /dev/kmsg, assert a
success and skip the whole kselftest on failures.
Suggested by Kamil Konieczny <kamil.konieczny@linux.intel.com>.

The expected output when failing to open kmsg is something like:
  igt_kmod-CRITICAL: Test assertion failure function igt_kselftest_begin, file ../lib/igt_kmod.c:936:
  igt_kmod-CRITICAL: Failed assertion: tst->kmsg >= 0
  igt_kmod-CRITICAL: Last errno: 2, No such file or directory
  igt_kmod-CRITICAL: file descriptor tst->kmsg failed

Tales Aparecida (4):
  lib/igt_kmod: fix trivial typos
  CONTRIBUTING: Add reference for GTKDoc
  lib/kselftests: Skip kselftest when opening kmsg fails
  lib/igt_kmod: add igt_kselftests documentation

 CONTRIBUTING.md |   7 +++
 lib/igt_kmod.c  | 120 +++++++++++++++++++++++++++++++++++++++++++++---
 lib/igt_kmod.h  |  20 +++++++-
 3 files changed, 140 insertions(+), 7 deletions(-)

-- 
2.37.1
