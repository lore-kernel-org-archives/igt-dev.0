Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1886EAA8
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 06:25:41 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 24 Sep 2020 11:55:23 +0530
Message-Id: <20200924062525.13878-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200907032622.6837-1-mohammed.khajapasha@intel.com>
References: <20200907032622.6837-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 0/2] tests/kms_chamelium: Test HPD for a connector
 with all valid pipes
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

Test hpd test for a connector with all it's valid pipes
in valid crtc mask.

v1: Add hpd test case for a connector with all valid pipes
v2: Add hpd test for VGA <Joshi, Kunal1>

Mohammed Khajapasha (2):
  tests/kms_chamelium: Test HPD for connector with all valid pipes
  HAX: Run in BAT

 tests/intel-ci/fast-feedback.testlist |  2 +
 tests/kms_chamelium.c                 | 54 +++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
