Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF28CC1C5F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 14:52:18 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id b124so7352714vsc.9
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 07:52:18 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: Petri Latvala <petri.latvala@intel.com>,
	igt-dev@lists.freedesktop.org
Date: Mon, 15 Aug 2022 11:51:42 -0300
Message-Id: <20220815145146.24038-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/4] add kselftest runner documentation
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

# Changelog (https://patchwork.freedesktop.org/series/106921/)

## v2 -> v3:

- Rebased the series

- In the third patch, inside igt_kselftest_begin(), replace igt_assert_fd()
with igt_require_fd()  to skip tests instead of failing, which would imply
there's a problem with the kernel. Suggested by Petri Latvala <petri.latvala@intel.com>.

- In the 4th patch, rephrase igt_kselftest_begin() documentation to say "skips"
instead of "fails"

## v1 -> v2:

- Added R-b in the 1st patch

- Moved gtkdoc link above igt_require to match occurrence in text in
the 2nd patch

- In the 3rd patch, instead of returning non-zero in the function
igt_kselftest_begin() from errors while opening /dev/kmsg, assert a
success and skip the whole kselftest on failures.

- Fix code style issues in the 4th patch

Tales Aparecida (4):
  lib/igt_kmod: fix trivial typos
  CONTRIBUTING: Add reference for GTKDoc
  lib/kselftests: Skip kselftest when opening kmsg fails
  lib/igt_kmod: add igt_kselftests documentation

 CONTRIBUTING.md |   7 +++
 lib/igt_kmod.c  | 120 +++++++++++++++++++++++++++++++++++++++++++++---
 lib/igt_kmod.h  |  20 +++++++-
 3 files changed, 140 insertions(+), 7 deletions(-)


base-commit: d47beef9b01595f721c584070940c95be1cf11e8
-- 
2.37.1
