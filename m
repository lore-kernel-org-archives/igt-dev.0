Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2486E4B1
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 09:50:18 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Wed, 24 Nov 2021 11:50:00 +0200
Message-Id: <20211124095002.130684-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Biplanar testcases
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This patch set is introducing testcases for testing biplanar plane with
PSR2 functionalities. It is adding couple of automated testcases and one
manually checked.

Jouni Högander (2):
  tests/kms_psr2_su: add biplanar selective update tests
  tests/kms_psr2_sf: Add new subtest for biplanar format

 tests/i915/kms_psr2_sf.c | 92 +++++++++++++++++++++++++++++++---------
 tests/i915/kms_psr2_su.c | 91 +++++++++++++++++++++++++--------------
 2 files changed, 131 insertions(+), 52 deletions(-)

-- 
2.25.1
