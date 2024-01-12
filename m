Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2860A10EAB8
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 09:07:54 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_store: Remove redundant code
Date: Fri, 12 Jan 2024 09:07:45 +0000
Message-ID: <BL3PR11MB5747D05B4745FE94B30A3B9BD06F2@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240112074902.2455804-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240112074902.2455804-1-janga.rahul.kumar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
>From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
>Sent: Friday, January 12, 2024 1:19 PM
>To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi <ramadevi.gandi@intel.c=
om>;
>Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; Ch, Sai Gowtham
><sai.gowtham.ch@intel.com>
>Subject: [PATCH i-g-t] tests/intel/xe_exec_store: Remove redundant code
>
>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
>Remove redundant code related to exec queue creation.
>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>---
> tests/intel/xe_exec_store.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c ind=
ex
>870394d3c..3fa8880ba 100644
>--- a/tests/intel/xe_exec_store.c
>+++ b/tests/intel/xe_exec_store.c
>@@ -148,7 +148,6 @@ static void basic_inst(int fd, int inst_type, struct
>drm_xe_engine_class_instanc
> 	else
> 		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
>
>-	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> 	exec.exec_queue_id =3D exec_queue;
> 	exec.address =3D data->addr;
> 	sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
>--
Looks good to me.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>2.25.1
