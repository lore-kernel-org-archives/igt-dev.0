Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146F110E31C
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 16:12:49 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 8 Mar 2022 16:08:52 +0000
Message-ID: <b92ae9812a894c5e863842a2006d952e@intel.com>
References: <20220308091227.272415-1-bhanuprakash.modem@intel.com>
 <20220308152214.280041-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220308152214.280041-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 i-g-t] i915_pm_rpm: Skip i2c read test for DP MST
 connectors
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



> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, March 8, 2022 8:52 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Gupta,
> Anshuman <anshuman.gupta@intel.com>
> Subject: [v2 i-g-t] i915_pm_rpm: Skip i2c read test for DP MST connectors
>=20
> IGT finds the i2c edid over drm i2c node, which will actually the particu=
lar DDI or
> TC port.
>=20
> In case of DP MST there will be one static primary connector, that is ass=
ociated
> with actual DDI/PORT and igt will read a valid edid on the parent/primary
> connector but at drm level that connector will be disconnected. Hence end=
up
> with EDID mismatch on connector.
>=20
> This patch will ignore the DP-MST connectors.
>=20
> V2:
> * Check if connector is disconnected before ignoring (Anshuman)
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/i915/i915_pm_rpm.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c index
> 1df0ed2223..9afe74272d 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -670,6 +670,13 @@ static void format_hex_string(const unsigned char
> edid[static EDID_BLOCK_SIZE],
>  		sprintf(buf+i*5, "0x%02x ", edid[i]);  }
>=20
> +static bool is_mst_connector(int fd, uint32_t connector_id) {
> +	return kmstest_get_property(fd, connector_id,
> +				    DRM_MODE_OBJECT_CONNECTOR,
> +				    "PATH", NULL, NULL, NULL);
> +}
> +
>  static void test_i2c(struct mode_set_data *data)  {
>  	bool edid_mistmach_i2c_vs_drm =3D false; @@ -690,6 +697,10 @@ static
> void test_i2c(struct mode_set_data *data)
>=20
>  		bool edids_equal;
>=20
> +		if (data->connectors[i]->connection !=3D
> DRM_MODE_CONNECTED ||
> +		    is_mst_connector(drm_fd, data->connectors[i]-
> >connector_id))
> +			continue;
> +
>  		/* We fail to detect some VGA monitors using our i2c method.
> If you look
>  		 * at the dmesg of these cases, you'll see the Kernel complaining
> about
>  		 * the EDID reading mostly FFs and then disabling bit-banging.
> Since we
> --
> 2.35.1
