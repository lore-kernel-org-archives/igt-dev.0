Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Nov 2023 10:59:36 +0100
Message-ID: <20231106095935.7031-4-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] lib/kunit: Execute test cases
 synchronously
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Load KUnit modules in a way that only one selected test case is executed
per each IGT dynamic sub-subtest.

Janusz Krzysztofik (2):
  lib/kunit: Split out reusable part of test case list gathering
  lib/kunit: Execute test cases synchronously

 lib/igt_kmod.c | 262 +++++++++++++++++++++----------------------------
 1 file changed, 111 insertions(+), 151 deletions(-)

-- 
2.42.0
