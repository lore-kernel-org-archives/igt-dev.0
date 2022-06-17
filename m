Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C37F10E9BF
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 15:56:32 +0000 (UTC)
From: Isabella Basso <isabbasso@riseup.net>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jun 2022 12:47:51 -0300
Message-Id: <20220617154753.30175-1-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add support for KUnit tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunit-dev@googlegroups.com, magalilemes00@gmail.com, maira.canal@usp.br,
 Daniel Latypov <dlatypov@google.com>, n@nfraprado.net,
 leandro.ribeiro@collabora.com, David Gow <davidgow@google.com>,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, brendanhiggins@google.com,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch series was first developed as part of the LKCamp hackathon
that happened last year[1], mainly focusing on refactoring DRM tests to
use KUnit.

KUnit[2][3] is a unified test framework that provides helper tools,
simplifying their development and execution. Using an x86-64 machine
it's possible to run tests in the host's kernel natively using user-mode
Linux[4] (aka UML), which simplifies usage in a wide variety of
scenarios, including integration to CI.

As the tool's adoption widens into graphics testing territory, I and
LKCamp members figured it would be important to support it in IGT, as
it's a core tool for GPU drivers maintainers.

I have then added KUnit support into IGT mainly following the KTAP
specs, and it can be tested using patch 2/2 in this series together with
an AMDGPU patch series[5] available at [6].

[1]: https://groups.google.com/g/kunit-dev/c/YqFR1q2uZvk/m/IbvItSfHBAAJ
[2]: https://kunit.dev
[3]: https://docs.kernel.org/dev-tools/kunit/index.html
[4]: http://user-mode-linux.sourceforge.net
[5]: https://lore.kernel.org/dri-devel/20220608010709.272962-1-maira.canal@usp.br/
[6]: https://gitlab.freedesktop.org/isinyaaa/linux/-/tree/kunit-prototype2

Isabella Basso (2):
  igt_kmod: add compatibility for KUnit
  tests/amdgpu/amd_kunit: add KUnit AMDGPU tests

 lib/igt_kmod.c           | 269 +++++++++++++++++++++++++++++++++++++++
 lib/igt_kmod.h           |   3 +
 tests/amdgpu/amd_kunit.c |  34 +++++
 tests/amdgpu/meson.build |   1 +
 4 files changed, 307 insertions(+)
 create mode 100644 tests/amdgpu/amd_kunit.c

-- 
2.36.1
