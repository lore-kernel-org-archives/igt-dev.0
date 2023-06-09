Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E70210E24E
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 09:36:53 +0000 (UTC)
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 11:36:40 +0200
Message-Id: <20230609093641.2075459-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] lib: Avoid macro redifinition in
 gen7/gen8_media.h
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently PIPELINE_SELECT_3D macros are redifined. This can lead to
compiler warnings when including headers containing those redifinitions.
Upstream a simple patch that fixes that.

Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Christoph Manszewski (1):
  lib: Let gen7 inherit gen4_render.h

 lib/gen7_media.h | 2 +-
 lib/gen8_media.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.40.1
