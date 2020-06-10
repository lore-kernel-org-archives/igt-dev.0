Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1684589DD3
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2020 19:38:13 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 11 Jun 2020 01:07:23 +0530
Message-Id: <20200610193724.16436-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [[RFC] i-g-t 0/1] lib/igt_kms: Add support for display
 with
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
List-ID: <igt-dev@lists.freedesktop.org>

Add support for non-contiguous pipe display by allocating
upper bound pipes array for display. Set the pipe enum name
to igt pipe for enabled pipes in drm.

Mohammed Khajapasha (1):
  lib/igt_kms: Add support for display with non-contiguous pipes

 lib/igt_kms.c | 30 +++++++++++++++++++++++++-----
 lib/igt_kms.h | 13 ++++++++-----
 2 files changed, 33 insertions(+), 10 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
