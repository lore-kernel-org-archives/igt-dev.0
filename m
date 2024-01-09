Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF3C10E3C6
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 09:30:12 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_live_ktest: Add mocs kunit test
Date: Tue, 9 Jan 2024 09:30:08 +0000
Message-ID: <BL3PR11MB574768C5157975CEBC539A1FD06A2@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240109090422.2188202-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240109090422.2188202-1-janga.rahul.kumar@intel.com>
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
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>janga.rahul.kumar@intel.com
>Sent: Tuesday, January 9, 2024 2:34 PM
>To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi <ramadevi.gandi@intel.c=
om>;
>Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
>Subject: [PATCH i-g-t] tests/intel/xe_live_ktest: Add mocs kunit test
>
>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
>Enable mocs kunit execution from IGT.
>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>---
> tests/intel/xe_live_ktest.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c ind=
ex
>7170a017c..5f5f1dff7 100644
>--- a/tests/intel/xe_live_ktest.c
>+++ b/tests/intel/xe_live_ktest.c
>@@ -24,6 +24,11 @@
>  *	Kernel dynamic selftests to check if page table migrations
>  *	are working properly.
>  * Functionality: migrate
>+ *
>+ * SUBTEST: mocs
>+ * Description:
>+ *	Kernel dynamic selftests to check mocs configuration.
>+ * Functionality: mocs
>  */
>
> struct kunit_tests {
>@@ -35,6 +40,7 @@ static const struct kunit_tests live_tests[] =3D {
> 	{ "xe_bo_test",		"bo" },
> 	{ "xe_dma_buf_test",	"dmabuf" },
> 	{ "xe_migrate_test",	"migrate" },
>+	{ "xe_mocs_test",	"mocs" },
> };
>
Looks good to me.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> igt_main
>--
>2.25.1
