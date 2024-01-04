Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F3510E38C
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jan 2024 05:56:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Subject: [i-g-t 0/2] tests/kms_feature_discovery: Add basic sanity test
Date: Thu,  4 Jan 2024 11:21:04 +0530
Message-Id: <20240104055106.1949767-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add basic sanity test to make sure DRM_IOCTL_MODE_GETRESOURCES is
working fine.

Bhanuprakash Modem (2):
  tests/kms_feature_discovery: Add basic sanity test
  intel-ci: Add feature discovery test to BAT

 tests/intel-ci/fast-feedback.testlist    |  1 +
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/kms_feature_discovery.c            | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

--
2.40.0
