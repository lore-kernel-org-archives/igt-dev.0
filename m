Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EF42BF0B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 06:51:18 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Jul 2022 08:51:11 +0200
Message-Id: <20220713065113.12916-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Decrease module reload fault
 injection time
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

Some tests can be affected by unresponsive driver when fault injection
would leave loaded driver in fault state. Series decreases number of
checkpoints (they are get randomly some during module reload) and
ensures driver is unloaded when test completes.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6393

v2: Addressing review comments (Kamil)

Chris Wilson (2):
  i915/i915_module_load: Randomise fault injection
  i915/i915_module_load: Raise a fatal-error on failing to unload a
    module

 tests/i915/i915_module_load.c | 56 ++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 7 deletions(-)

-- 
2.34.1
