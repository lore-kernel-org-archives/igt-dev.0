Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E483C10E7E9
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 05:27:11 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id 125so16778725vsd.5
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Aug 2022 22:27:11 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: igt-dev@lists.freedesktop.org,
	Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  3 Aug 2022 02:26:50 -0300
Message-Id: <20220803052654.98827-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] add kselftest runner documentation
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
While writing igt_kselftest_begin() documentation I realized it always
returned 0. Instead of documenting that behavior, the function now
returns non-zero if it fails to open /dev/kmsg.

As an extra, add instructions about writing documentation.

Tales Aparecida (4):
  lib/igt_kmod: fix trivial typos
  CONTRIBUTING: Add reference for GTKDoc
  lib/kselftests: return non-zero on open(kmsg) failure
  lib/igt_kmod: add igt_kselftests documentation

 CONTRIBUTING.md |   7 +++
 lib/igt_kmod.c  | 113 +++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kmod.h  |  18 ++++++++
 3 files changed, 136 insertions(+), 2 deletions(-)

-- 
2.37.0
