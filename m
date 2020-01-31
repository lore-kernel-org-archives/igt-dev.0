Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A0A6E952
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 09:26:06 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Fri, 31 Jan 2020 11:26:02 +0200
Message-Id: <20200131092603.24223-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 0/1] Fix CRC mismatch
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On newer gens we experience CRC mismatch errors. These are caused by
comparison between HDR and SDR planes. This patch series proposes
a fix that compares HDR primary plane to HDR overlay planes and
SDR primary plane to SDR overlay planes.

Yf tiling is not supported by GEN12. We should intentionally skip
a test with that tiling mode.

v2: HDR planes are not defined for gen9 and older (CI)
    Drop platform spesific check for tiling (Jani)

Mika Kahola (1):
  tests/kms_plane_lowres: Fix CRC mismatch

 tests/kms_plane_lowres.c | 142 +++++++++++++++++++++++++--------------
 1 file changed, 90 insertions(+), 52 deletions(-)

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
