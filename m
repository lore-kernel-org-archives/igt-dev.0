Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958656E2DC
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2020 11:10:15 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date: Wed, 27 May 2020 16:35:05 +0530
Message-Id: <20200527110507.16902-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] [RFC 0/2] tests/kms_content_protection: Enhancements
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

 tests/kms_content_protection.c | 234 +++++++++++++++++++++++----------
 1 file changed, 162 insertions(+), 72 deletions(-)

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
