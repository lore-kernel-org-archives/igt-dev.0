Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84376EC59
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 10:02:01 +0000 (UTC)
From: "Varide, Nischal" <nischal.varide@intel.com>
Date: Thu, 14 Oct 2021 10:01:58 +0000
Message-ID: <DM8PR11MB565421EFBB92943EA3C29CD19EB89@DM8PR11MB5654.namprd11.prod.outlook.com>
References: <20211013105744.2869089-1-jigar.bhatt@intel.com>
In-Reply-To: <20211013105744.2869089-1-jigar.bhatt@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/i915/i915_pm_dc: Fix condition
 in dc9-test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Bhatt, Jigar" <jigar.bhatt@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



-----Original Message-----
From: Bhatt, Jigar <jigar.bhatt@intel.com>=20
Sent: Wednesday, October 13, 2021 4:28 PM
To: igt-dev@lists.freedesktop.org
Cc: Bhatt, Jigar <jigar.bhatt@intel.com>; Latvala, Petri <petri.latvala@int=
el.com>; Varide, Nischal <nischal.varide@intel.com>
Subject: [PATCH i-g-t v5] tests/i915/i915_pm_dc: Fix condition in dc9-test

1.Inside dc9_wait_entry, we do not have DC9 counter, so we rely on dc5/dc6 =
counter reset to check if display engine was in DC9.
Test is passed if live counter is less
than the previous counter. Correcting condition igt_wait(read_dc_counter(de=
bugfs_fd, dc_target) <
			prev_dc, seconds, 100);

2.Moving prev_dc =3D read_dc_counter(data->debugfs_fd, dc_target); before s=
etup_dc9_dpms avoid 0 reading.

3.Add sleep(1) after dpms_off waiting for reset counters.

Fixes: 2f4e6430a97f04284d1cafb1479e7c1b0b2d596a ("tests/i915/i915_pm_dc: Fi=
x DC9 test")
Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Nischal Varide<nischal.varide@intel.com>
---
 tests/i915/i915_pm_dc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index 3a7ce5=
bf..4ebeb3eb 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -410,7 +410,7 @@ static bool dc9_wait_entry(uint32_t debugfs_fd, int dc_=
target, int prev_dc, int
 	 * since we do not have DC9 counter,
 	 * so we rely on dc5/dc6 counter reset to check if display engine was in =
DC9.
 	 */
-	return igt_wait(read_dc_counter(debugfs_fd, dc_target) >
+	return igt_wait(read_dc_counter(debugfs_fd, dc_target) <
 			prev_dc, seconds, 100);
 }
=20
@@ -444,9 +444,10 @@ static void test_dc9_dpms(data_t *data)
=20
 	require_dc_counter(data->debugfs_fd, CHECK_DC5);
 	dc_target =3D support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
-	setup_dc9_dpms(data, dc_target);
 	prev_dc =3D read_dc_counter(data->debugfs_fd, dc_target);
+	setup_dc9_dpms(data, dc_target);
 	dpms_off(data);
+	sleep(1); /* wait for counters reset*/
 	check_dc9(data, dc_target, prev_dc);
 	dpms_on(data);
 }
--
2.25.1
