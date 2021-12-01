Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1A16EC3A
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 05:41:59 +0000 (UTC)
From: "Bhatt, Jigar" <jigar.bhatt@intel.com>
Date: Wed, 1 Dec 2021 05:41:56 +0000
Message-ID: <DM8PR11MB5608A636D2C44D0E8997BAADFD689@DM8PR11MB5608.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/i915/i915_pm_dc: Fix DC9 test case
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
Sent: Monday, November 29, 2021 1:02 PM
To: igt-dev@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX <tej=
askumarx.surendrakumar.upadhyay@intel.com>
Cc: Katragadda, MastanX <mastanx.katragadda@intel.com>; Bhatt, Jigar <jigar=
.bhatt@intel.com>
Subject: [i-g-t] tests/i915/i915_pm_dc: Fix DC9 test case

Reading prev_dc counter is most of the times 0 after reset comparison with =
0 test gets failed. taken prev_dc counter after enterd into shallow DC stat=
e.

Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
Reviewed-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index 4ebeb3=
eb..074b765b 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -434,22 +434,24 @@ static void setup_dc9_dpms(data_t *data, int dc_targe=
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
+
+
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
