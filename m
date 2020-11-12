Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0F16E125
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2020 06:01:31 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 12 Nov 2020 11:31:23 +0530
Message-Id: <20201112060124.25189-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/1] tests/kms_plane_scaling: Don't run
 plane scaler
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
Cc: petri.latvala@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Don't run plane scaler tests on each output of a pipe.
We probably don't need to test plane scaler tests on each
output of a pipe.

$ time ./build/tests/kms_plane_scaling
- real    17m6.593s
+ real    6m33.515s

v2: Review comments for indentation of igt_dynamic_f block <petri>

Cc: petri.latvala@intel.com
Cc: mika.kahola@intel.com
Cc: juha-pekka.heikkila@intel.com
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Mohammed Khajapasha (1):
  tests/kms_plane_scaling: Don't run plane scaler tests on each output

 tests/kms_plane_scaling.c | 44 +++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 18 deletions(-)

-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
