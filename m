Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB096E506
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 07:47:10 +0000 (UTC)
From: "Bhatt, Jigar" <jigar.bhatt@intel.com>
Date: Wed, 1 Dec 2021 07:47:07 +0000
Message-ID: <DM8PR11MB560846E6F6FFE7558D405C64FD689@DM8PR11MB5608.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/i915/i915_pm_dc: Fix DC9 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Katragadda, MastanX" <mastanx.katragadda@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Surendrakumar Upadhyay, TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



-----Original Message-----
From: Katragadda, MastanX <mastanx.katragadda@intel.com>=20
Sent: Wednesday, December 1, 2021 11:57 AM
To: igt-dev@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX <tej=
askumarx.surendrakumar.upadhyay@intel.com>
Cc: Katragadda, MastanX <mastanx.katragadda@intel.com>; Bhatt, Jigar <jigar=
.bhatt@intel.com>
Subject: [i-g-t] tests/i915/i915_pm_dc: Fix DC9 subtest

Reading prev_dc counter is most of the times 0 after reset comparison with =
0 test gets failed. taken prev_dc counter after enterd into shallow DC stat=
e.

changes since V1:
        - Removed new lines and warnings from checkpatch.pl

Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
Reviewed-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index 4ebeb3=
eb..2c2c5086 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -434,22 +434,22 @@ static void setup_dc9_dpms(data_t *data, int dc_targe=
t)
 	dpms_off(data);
 	igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
 				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
+	prev_dc =3D read_dc_counter(data->debugfs_fd, dc_target);
 	dpms_on(data);
 	cleanup_dc_dpms(data);
+	dpms_off(data);
+	sleep(1); /* wait for counters reset*/
+	check_dc9(data, dc_target, prev_dc);
+	dpms_on(data);
 }
=20
 static void test_dc9_dpms(data_t *data)  {
-	int prev_dc, dc_target;
+	int dc_target;
=20
 	require_dc_counter(data->debugfs_fd, CHECK_DC5);
 	dc_target =3D support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
-	prev_dc =3D read_dc_counter(data->debugfs_fd, dc_target);
 	setup_dc9_dpms(data, dc_target);
-	dpms_off(data);
-	sleep(1); /* wait for counters reset*/
-	check_dc9(data, dc_target, prev_dc);
-	dpms_on(data);
 }
=20
 static void kms_poll_state_restore(int sig)
--
2.25.1
