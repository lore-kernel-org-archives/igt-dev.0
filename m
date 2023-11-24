Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7435810E1C3
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 11:21:57 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 24 Nov 2023 11:21:52 +0000
Message-ID: <BYAPR11MB341345DCA79BD1473130396DD0B8A@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20231124102946.2650848-1-badal.nilawar@intel.com>
 <20231124102946.2650848-2-badal.nilawar@intel.com>
In-Reply-To: <20231124102946.2650848-2-badal.nilawar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] test/intel/xe_guc_pc: Skip
 freq_*_idle tests on PVC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Badal
>Nilawar
>Sent: Friday, November 24, 2023 4:00 PM
>To: igt-dev@lists.freedesktop.org
>Subject: [igt-dev] [PATCH i-g-t 1/2] test/intel/xe_guc_pc: Skip freq_*_idl=
e tests
>on PVC
>
>PVC does not support RC6 so skip freq_fixed_idle and freq_range_idle tests=
.
>
>Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>---
> tests/intel/xe_guc_pc.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c index
>3376e838f..c23017501 100644
>--- a/tests/intel/xe_guc_pc.c
>+++ b/tests/intel/xe_guc_pc.c
>@@ -295,6 +295,7 @@ igt_main
> 	}
>
> 	igt_subtest("freq_fixed_idle") {
>+		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
> 		xe_for_each_gt(fd, gt) {
> 			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000,
>10),
> 				      "GT %d should be in C6\n", gt); @@ -303,6
>+304,7 @@ igt_main
> 	}
>
> 	igt_subtest("freq_range_idle") {
>+		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
LGTM
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 		xe_for_each_gt(fd, gt) {
> 			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000,
>10),
> 				      "GT %d should be in C6\n", gt);
>--
>2.25.1
