Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6435710E39D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 07:14:52 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Tue, 25 Jul 2023 12:46:20 +0530
Message-Id: <20230725071622.206601-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add Xe lib support for hang & GT reset
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

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Janga Rahul Kumar (2):
  lib/xe: Add support to reset all GT's
  lib/xe: Add hang library support

 lib/igt_gt.c      | 28 ++++++++++++++++++
 lib/xe/xe_ioctl.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  8 ++++++
 3 files changed, 108 insertions(+)

-- 
2.25.1
