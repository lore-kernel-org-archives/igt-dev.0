Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FAB6E83D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2020 19:12:35 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 11 Jun 2020 00:41:44 +0530
Message-Id: <20200610191146.10380-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [[RFC] PATCH i-g-t 0/2] lib/igt_kms: Add support for
 display with
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
To: kishore.kunche@intel.com, petri.latvala@intel.com, mohammed.khajapasha@freedesktop.org, arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add support for non-contiguous pipe display by allocating
upper bound pipes array for display. Set the pipe enum name
to igt pipe for enabled pipes in drm.

Mohammed Khajapasha (1):
  lib/igt_kms: Add support for display with non-contiguous pipes

Petri Latvala (1):
  lib/drmtest: Don't write ffffffff to a numeric param

 lib/drmtest.c |  2 +-
 lib/igt_kms.c | 30 +++++++++++++++++++++++++-----
 lib/igt_kms.h | 15 +++++++++------
 3 files changed, 35 insertions(+), 12 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
