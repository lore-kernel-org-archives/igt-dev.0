Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B2A89B38
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 17:32:39 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Tue, 10 Nov 2020 23:02:15 +0530
Message-Id: <20201110173216.11507-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20201106102222.8674-1-mohammed.khajapasha@intel.com>
References: <20201106102222.8674-1-mohammed.khajapasha@intel.com>
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
