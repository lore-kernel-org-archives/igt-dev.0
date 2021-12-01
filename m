Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235596E483
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 04:05:21 +0000 (UTC)
From: "Katragadda, MastanX" <mastanx.katragadda@intel.com>
Date: Wed, 1 Dec 2021 04:05:18 +0000
Message-ID: <BN9PR11MB5290767E3D5BE80FBD0A898897689@BN9PR11MB5290.namprd11.prod.outlook.com>
References: <20211129073148.1044976-1-mastanx.katragadda@intel.com>
 <DM8PR11MB5608FC16E95E96405A341E74FD689@DM8PR11MB5608.namprd11.prod.outlook.com>
 <BN9PR11MB52900AC12BB5C33EAA81E3FC97689@BN9PR11MB5290.namprd11.prod.outlook.com>
 <DM8PR11MB5608E98BFEAFDF30B8EFD83FFD689@DM8PR11MB5608.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5608E98BFEAFDF30B8EFD83FFD689@DM8PR11MB5608.namprd11.prod.outlook.com>
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
To: "Bhatt, Jigar" <jigar.bhatt@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Surendrakumar Upadhyay, TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jigar,=20
                I have seen this failure on gen12 platforms as well as gen9=
 , if we ran dc6-dpms followed by dc9-dpms tests both are passes. Because w=
hen ever dc6-dpms is ran last counter greater than 0 due to that dc9-dpms g=
ets pass. But in case CI shards  subtest dc9-dpms only running there we see=
n this failures. Same thing observed in gen12 platforms locally.

Thanks,
Mastan

-----Original Message-----
From: Bhatt, Jigar <jigar.bhatt@intel.com>=20
Sent: 01 December 2021 09:26
To: Katragadda, MastanX <mastanx.katragadda@intel.com>; igt-dev@lists.freed=
esktop.org; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.=
upadhyay@intel.com>
Subject: RE: [i-g-t] tests/i915/i915_pm_dc: Fix DC9 test case

Hi Mastan,

So after this change is it incrementing like 0 to other value(1 or 2 or els=
e)  ? so older platforms have issue which is reading 0 only ? =20

Thanks and regards,
Jigar Bhatt

-----Original Message-----
From: Katragadda, MastanX <mastanx.katragadda@intel.com>=20
Sent: Wednesday, December 1, 2021 9:23 AM
To: Bhatt, Jigar <jigar.bhatt@intel.com>; igt-dev@lists.freedesktop.org; Su=
rendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel=
.com>
Subject: RE: [i-g-t] tests/i915/i915_pm_dc: Fix DC9 test case

Hi Jigar,=20
	  If we  ran dc9-dpms subtest only  prev_dc counter is 0 always, compariso=
n 0 after reset tests get failed.

Thanks

-----Original Message-----
From: Bhatt, Jigar <jigar.bhatt@intel.com>=20
Sent: 01 December 2021 09:16
To: Katragadda, MastanX <mastanx.katragadda@intel.com>; igt-dev@lists.freed=
esktop.org; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.=
upadhyay@intel.com>
Subject: RE: [i-g-t] tests/i915/i915_pm_dc: Fix DC9 test case

Hi Mastan,

What's the reason to change ? If you are reading counter value in beginning=
 of test and after checking DC states are allowed what's the different in c=
ounter value ?
=20
Thanks and regards,
Jigar Bhatt

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
