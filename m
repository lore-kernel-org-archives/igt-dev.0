Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439B489D44
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2020 19:14:24 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 11 Jun 2020 00:43:33 +0530
Message-Id: <20200610191334.10436-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [[RFC] PATCH i-g-t 0/1] lib/igt_kms: Add support for
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

 lib/igt_kms.c | 30 +++++++++++++++++++++++++-----
 lib/igt_kms.h | 15 +++++++++------
 2 files changed, 34 insertions(+), 11 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
