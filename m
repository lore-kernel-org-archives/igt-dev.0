Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232E410E24B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 18:46:14 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Mon, 15 May 2023 20:46:02 +0200
Message-Id: <20230515184604.64135-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Use new procps library libproc2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is resend of following patch with minor corrections:

https://patchwork.freedesktop.org/series/111015/
Use the new procps library libproc2

I also added second patch with some simplifications suggested
by Mauro in:

https://patchwork.freedesktop.org/series/116896/
Use new library libproc2

v2: corrected 2/2 "lib/igt_aux: unify procps processing"
    on old lib path

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Craig Small (1):
  Use the new procps library libproc2

Kamil Konieczny (1):
  lib/igt_aux: unify procps processing

 lib/igt_aux.c   | 276 +++++++++++++++++++++++++++++++-----------------
 lib/meson.build |   7 +-
 meson.build     |  10 +-
 3 files changed, 194 insertions(+), 99 deletions(-)

-- 
2.39.2


