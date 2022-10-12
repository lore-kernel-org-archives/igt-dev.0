Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9695A10E3D5
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 11:02:39 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Oct 2022 13:02:01 +0200
Message-Id: <20221012110203.644576-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/core_hotunplug: Health check fixes
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

Janusz Krzysztofik (2):
  tests/core_hotunplug: Select health checks for initially detected
    chipset
  tests/core_hotunplug: Always check device health after late close

 tests/core_hotunplug.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.25.1
