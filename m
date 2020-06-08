Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF31C6E1F7
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2020 10:18:32 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date: Mon,  8 Jun 2020 15:43:32 +0530
Message-Id: <20200608101334.19684-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] [Patch][i-g-t v2 0/2] tests/kms_content_protection:
 Enhancements
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
Cc: jani.nikula@intel.com, petri.latvala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This patch series adds support for testing HDCP1.4 and HDCP2.2 version.
This is continuation of the earlier patch series:
https://patchwork.freedesktop.org/patch/358240/

It also enhances the IGT to test the cases, where SRM table is not
present.

Ankit Nautiyal (2):
  tests/kms_content_protection: Bifurcate tests into HDCP1.4 & 2.2
  tests/kms_content_protection: Remove pre-existing SRM table before the
    test

 tests/kms_content_protection.c | 235 ++++++++++++++++++++++-----------
 1 file changed, 161 insertions(+), 74 deletions(-)

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
