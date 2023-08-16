Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E4810E09A
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 10:22:33 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Wed, 16 Aug 2023 15:54:28 +0530
Message-Id: <20230816102431.2014326-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add Xe lib support for hang & GT reset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com, kunal1.joshi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add library support for hang and resetting all the GT's.

v2:
Create xe library for GT which contains hang and reset helpers.(kamil)
Create separate patch for igt gt lib changes.(kamil)
Extend hang library to support all rings.
Correct Indentation issues. (kamil/Anna)

v3:
Skip hang config for render engine request on PVC (Gowtham)
Extend force reset (Gowtham)

v4:
Address review comments. (Kamil/Gowtham)

v5:
library header includes cleanUp. (kamil)

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Anna Karas <anna.karas@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Tested-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Janga Rahul Kumar (3):
  lib/xe: Add support to reset all GT's
  lib/xe: Add hang library support
  lib/igt_gt: Extend hang library support to XE

 lib/igt_gt.c    |  29 ++++++++--
 lib/meson.build |   1 +
 lib/xe/xe_gt.c  | 143 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h  |  15 +++++
 4 files changed, 184 insertions(+), 4 deletions(-)
 create mode 100644 lib/xe/xe_gt.c
 create mode 100644 lib/xe/xe_gt.h

-- 
2.25.1
