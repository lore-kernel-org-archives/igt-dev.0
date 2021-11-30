Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE986EB91
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Nov 2021 07:38:33 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Tue, 30 Nov 2021 09:38:00 +0200
Message-Id: <20211130073803.46388-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Biplanar testcases
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
List-ID: <igt-dev@lists.freedesktop.org>

This patch set is introducing testcases for testing biplanar plane with
PSR2 functionalities. It is adding couple of automated testcases and one
manually checked. Also offset change is done for existing testcase to
reveal better problems with offset configuration.

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>

Jouni Högander (3):
  tests/kms_psr2_su: Add offset to drawn rectangle
  tests/kms_psr2_su: add biplanar selective update tests
  tests/kms_psr2_sf: Add new subtest for biplanar format

 tests/i915/kms_psr2_sf.c | 92 +++++++++++++++++++++++++++++++---------
 tests/i915/kms_psr2_su.c | 91 +++++++++++++++++++++++++--------------
 2 files changed, 131 insertions(+), 52 deletions(-)

-- 
2.25.1
