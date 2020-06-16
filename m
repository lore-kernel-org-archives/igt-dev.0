Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB1F6E07F
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2020 11:03:02 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date: Tue, 16 Jun 2020 16:28:10 +0530
Message-Id: <20200616105812.21558-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [Patch][i-g-t 0/2] Add support to detect HDCP events
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

This patch-series modifies the igt_kms to add support to detect
connector events. This support is then used for detecting
HDCP events in kms_content_protection. 

Ankit Nautiyal (2):
  lib/igt_kms: Add support for detecting connector events
  tests/kms_content_protection: Use library functions for handling
    uevents

 lib/igt_kms.c                  |  61 ++++++++++----
 lib/igt_kms.h                  |   2 +
 tests/kms_content_protection.c | 145 ++-------------------------------
 3 files changed, 54 insertions(+), 154 deletions(-)

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
