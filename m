Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F19710E273
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 12:22:43 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 8 Mar 2022 12:22:39 +0000
Message-ID: <1c71322dfdea44d2a8bc2c68b7b54943@intel.com>
References: <20220308091227.272415-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220308091227.272415-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915_pm_rpm: Skip i2c read test for DP
 MST connectors
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
> Sent: Tuesday, March 8, 2022 2:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Gupta,
> Anshuman <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t] i915_pm_rpm: Skip i2c read test for DP MST connect=
ors
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
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/i915/i915_pm_rpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c index
> 1df0ed2223..2b687e63c0 100644
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
>  	bool edid_mistmach_i2c_vs_drm =3D false; @@ -690,6 +697,9 @@ static
> void test_i2c(struct mode_set_data *data)
>=20
>  		bool edids_equal;
>=20
> +		if (is_mst_connector(drm_fd, data->connectors[i]-
> >connector_id))
> +			continue;
Presumably this will ignore the static DP-MST connector and dynamic DP-MST =
connector as well?
If above is true then I believe we need a one more check see if connector i=
s disconnected before ignoring=20
the connector. I mean for dynamic MST connector if those are connected, we =
should not be losing the coverage.

Thanks,
Anshuman Gupta.
> +
>  		/* We fail to detect some VGA monitors using our i2c method.
> If you look
>  		 * at the dmesg of these cases, you'll see the Kernel complaining
> about
>  		 * the EDID reading mostly FFs and then disabling bit-banging.
> Since we
> --
> 2.35.1
