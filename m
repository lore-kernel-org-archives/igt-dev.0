Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929F589193
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 07:01:05 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Fri,  6 Mar 2020 05:32:54 +0530
Message-Id: <1583452975-8507-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4] Test platform supported pixel formats
 through chamelium
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Added capability in kms_chamelium to test both rgb and yuv
pixel formats supported per platform through chamelium.
Earlier, only hard coded pixel formats used to be tested which were
not generic across platforms resulting is SKIPS; to overcome these SKIPS
now only platform supported pixel formats will be tested.

v2: added support for RGB pixel formats (Swati)
v3: simplified constraint and made it more readable (Petri)
v4: -used igt_format_str instead of macro to print fourcc code (Ville)
    -dropped patch#1 because of above change

Kunal Joshi (1):
  tests/kms_chamelium: Add support to validate RGB/YUV pixel formats

 tests/kms_chamelium.c | 124 +++++++++++++++++++-------------------------------
 1 file changed, 48 insertions(+), 76 deletions(-)

-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
