Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453DA10E0AA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Apr 2023 09:23:52 +0000 (UTC)
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 10 Apr 2023 09:23:48 +0000
Message-ID: <PH0PR11MB4806F631424D8759F0CDC710E4959@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20230406141657.529728-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230406141657.529728-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_lease: Fix the usage of pipe
 for lessee
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

-----Original Message-----
From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>=20
Sent: Thursday, April 6, 2023 7:47 PM
To: igt-dev@lists.freedesktop.org; Thasleem, Mohammed <mohammed.thasleem@in=
tel.com>
Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t] tests/kms_lease: Fix the usage of pipe for lessee

Use pipe enum from the lessee display structure.
Update the name from -->lessee to -->lease
With above change:=20
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

---
 tests/kms_lease.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c index cb020cc3dab..29a77=
4ae865 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -77,7 +77,7 @@ static int prepare_crtc(lease_t *lease, data_t *data)
 	drmModeModeInfo *mode;
 	igt_display_t *display =3D &lease->display;
 	igt_output_t *output =3D connector_id_to_output(display, data->connector_=
id);
-	enum pipe pipe =3D data->pipe;
+	enum pipe pipe =3D display->pipes[data->pipe].pipe;
 	igt_plane_t *primary;
 	int ret;
=20
--
2.40.0
