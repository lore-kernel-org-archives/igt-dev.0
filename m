Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC1A10E26D
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 18:35:21 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Fri, 12 May 2023 20:35:10 +0200
Message-Id: <20230512183512.57843-1-kamil.konieczny@linux.intel.com>
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

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Craig Small (1):
  Use the new procps library libproc2

Kamil Konieczny (1):
  lib/igt_aux: unify procps processing

 lib/igt_aux.c   | 277 +++++++++++++++++++++++++++++++-----------------
 lib/meson.build |   7 +-
 meson.build     |  10 +-
 3 files changed, 195 insertions(+), 99 deletions(-)

-- 
2.39.2


