Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C016FF12
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 06:10:32 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Fri, 24 Jan 2020 11:40:23 +0530
Message-Id: <20200124061024.18369-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/1] tests/kms_concurrent: Move
 simultaneously allowed
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

High resolution consumes more bandwidth so if amount of max planes is
calculated during low resolution switch back to high resolution will
immediately fail with bandwidth problem.

To avoid bandwidth exceed,move the simultaneously allowed planes to
before switching to low resolution mode in main thread.

Mohammed Khajapasha (1):
  tests/kms_concurrent: Move simultaneously allowed planes to main
    thread

 tests/kms_concurrent.c | 65 +++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
