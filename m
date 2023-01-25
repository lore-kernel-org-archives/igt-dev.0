Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAC110E75D
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 09:08:05 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 11:07:40 +0200
Message-Id: <20230125090742.1599761-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Psr2 dsc testcases
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

This patch set is doing some cleanup to kms_psr2_sf testcases and adding
mechanism to stress other features with PSR2. It is utilizing this new
mechanism for testing DSC with PSR2.

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Jouni Högander (2):
  tests/i915/kms_psr2_sf: Some cleanups after
  kms_psr2_sf: Add dynamic subtests which use DSC feature

 tests/i915/kms_psr2_sf.c | 368 +++++++++++++++++++++++++--------------
 tests/meson.build        |   9 +-
 2 files changed, 246 insertions(+), 131 deletions(-)

-- 
2.34.1
