Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C795610E9CC
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 06:07:15 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 May 2022 09:06:57 +0300
Message-Id: <20220530060701.406219-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Fixes for big_fb test handling
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

This patch set fixes issues in big fb test handling and does some
clean-ups to make it easier to add new big fb tests in the future.

Cc: Mika Kahola <mika.kahola@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>

Jouni Högander (4):
  tests/i915/kms_psr2_sf.c: Fix for setting wrong size for cursor fb
  tests/i915_kms_psr2_sf: Set big_fb_test as 0 by default
  tests/i915/kms_psr2_sf: Make setting fb and plane sz/pos more clear
  tests/i915/kms_psr2_sf: Fix setting wrong fb size

 tests/i915/kms_psr2_sf.c | 65 ++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 26 deletions(-)

-- 
2.25.1
