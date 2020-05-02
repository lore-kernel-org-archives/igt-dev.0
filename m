Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat,  2 May 2020 14:40:07 +0100
Message-Id: <20200502134009.1597325-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] intel-ci: Only skip the hanging
 gem_exec_fence tests
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

gem_exec_fence includes a bunch of functional syncobj tests that are
currently being skipped due to an eagerness to avoid the intentionally
very slow hang tests.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/intel-ci/blacklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 08333afff..ecbec5080 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -26,7 +26,7 @@ igt@gem_evict_alignment(@.*)?
 igt@gem_evict_everything(@.*)?
 igt@gem_exec_big@(?!.*single).*
 igt@gem_exec_capture@many-(?!4K-).*
-igt@gem_exec_fence@(?!.*basic).*
+igt@gem_exec_fence@.*hang.*
 igt@gem_exec_flush@(?!.*basic).*
 igt@gem_exec_latency(@.*)?
 igt@gem_exec_lut_handle(@.*)?
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
