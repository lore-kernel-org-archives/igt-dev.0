Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B80D6E2FF
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 12:51:22 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 31 Mar 2020 15:38:53 +0300
Message-ID: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] Chamelium and TypeC
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

With DP over TypeC there is a behavior change - now we need to disable the mode
for our connector to get any hotplug events from it.

Imre is working on making the kernel side changes[0] to make TypeC behave same a
a native DP but he is hitting issues with DDI timeouts[1]. Anyway, the new
behavior is not entirely wrong either.

The fallout when testing with chamelium (this includes all the kms_ tests where
chamelium is used as a simple display) is quite extensive. We get a lot of flip
flopping skips and straight up failures because the displays are not getting
recognized.

Regular userspace, on the other hand, issues disabling modeset each time we get
a disconnect so we don't see any similar in the wild - this series makes our
tests mimic that common behavior - we always start with disalbed modes and up to
date connector state.

To not loose any coverage I have also added test that verifies hotplugs
while stuck with enabled mode explicitly.

[0]: https://patchwork.freedesktop.org/series/75027/
[1]: https://gitlab.freedesktop.org/drm/intel/-/issues/1069

Arkadiusz Hiler (4):
  lib/kms: Commit reasonable defaults on display init
  lib/kms: Reprobe connector state after disabling modest
  tests/kms_chamelium: Issue disabling modeset when resetting state
  tests/kms_chamelium: Test HPD for different mode handling scenarios

 lib/igt_kms.c         |  28 +++-
 tests/kms_chamelium.c | 294 ++++++++++++++++++++++++++++--------------
 2 files changed, 219 insertions(+), 103 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
