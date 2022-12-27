Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1366D10E091
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Dec 2022 07:21:10 +0000 (UTC)
From: "Sharma, Ananya" <ananya.sharma@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Dec 2022 07:21:05 +0000
Message-ID: <CO1PR11MB48345161FF94FEB1CD82168EFDED9@CO1PR11MB4834.namprd11.prod.outlook.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-25-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-25-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 24/52] tests/kms_plane_cursor: Add support
 for Bigjoiner
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Bhanupra=
kash Modem
Sent: 15 November 2022 22:38
To: igt-dev@lists.freedesktop.org
Subject: [igt-dev] [i-g-t v5 24/52] tests/kms_plane_cursor: Add support for=
 Bigjoiner

This patch will add a check to Skip the subtest if a selected pipe/output c=
ombo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ananya Sharma <ananya.sharma@intel.com>

 tests/kms_plane_cursor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c index 9b27=
586c..9e317cbf 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -85,6 +85,12 @@ static void test_init(data_t *data, enum pipe pipe_id, i=
gt_output_t *output)
 	data->overlay =3D igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVER=
LAY);
 	data->cursor =3D igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSO=
R);
=20
+	igt_output_set_pipe(data->output, data->pipe_id);
+	igt_require(i915_pipe_output_combo_valid(display));
+
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
+
 	igt_require_pipe_crc(data->drm_fd);
 	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
--
2.38.0
