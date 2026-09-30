Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1111DCA5FB1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 07:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B230510F1FA;
	Wed, 30 Sep 2026 07:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzBfcUlQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC8C10F1F2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790752203; x=1822288203;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=MlvL+JqSUmNgYLW6FkXoxtstkV0/6ypCgJiz7KT/s2Y=;
 b=JzBfcUlQMq0K3zQyaDZxERLNS+SuocQSeOTnjQsK0CkO8fJdRM856a3o
 8XdG5H4MTu1JEUseSm9+khW45JzzicnPP1jV9zgMIIq6Q26AVZVKXTVjD
 gO8LPiRixD4ECeIyTRylwJ6QkW5HQtTuhnFl1wf6hkGt+bkqQGay6hbOQ
 HBHLwepaE2j6hV5fZDolUpEYjTp5Q8mXjHcreWQHjEm27d+hWvF7IivB7
 u13yUCKzmtdBRGmXmxWklRUTCcB1W272+uKc+yuz6bvgejjD1GlE/i7D8
 PMpFsFjv3EetTU4iSXmHwxC/a7RbIoAXTixnkGBSuFSmYaIHZkWPeIErC w==;
X-CSE-ConnectionGUID: j1d37hZVQsakIXzHpRVXKw==
X-CSE-MsgGUID: HiXaUcErSA6uKG9Q0oR+JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102051926"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102051926"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 00:10:02 -0700
X-CSE-ConnectionGUID: XH36RJWqQnix9eM8GFzd6w==
X-CSE-MsgGUID: gPfuCgRWQs2eQmz3XQa25w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="279403493"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 00:10:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Naladala Ramanaidu
 <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/kms_force_connector_basic: Add EDID
 bit-banging read test
In-Reply-To: <20260929204450.793812-1-ramanaidu.naladala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260929204450.793812-1-ramanaidu.naladala@intel.com>
Date: Wed, 30 Sep 2026 10:09:57 +0300
Message-ID: <7177489852a712f06485a2f0245fe8ff4a48e233@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, 30 Sep 2026, Naladala Ramanaidu <ramanaidu.naladala@intel.com> wrot=
e:
> Add a new IGT subtest to verify EDID retrieval through the I2C
> bit-banging path.
>
> The test forces EDID accesses to use the fallback software-driven I2C
> mechanism, triggers connector reprobe, and verifies that a valid EDID
> is exposed by the connector. It then restores the default EDID access
> path and repeats the verification.
> =C2=A0
> This provides coverage for EDID detection through both the fallback
> and default mechanisms, helping to catch regressions in connector
> probing and display identification.
>
> Assisted-by: OpenAI Codex:GPT-5
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_force_connector_basic.c | 91 ++++++++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connecto=
r_basic.c
> index c4252ea02..1f2ff3595 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -31,6 +31,7 @@
>   */
>=20=20
>  #include "igt.h"
> +#include "igt_edid.h"
>=20=20
>  /**
>   * SUBTEST: force-load-detect
> @@ -45,6 +46,10 @@
>   *
>   * SUBTEST: prune-stale-modes
>   * Description: Tests pruning of stale modes
> + *
> + * SUBTEST: force-edid-read-over-i2c-bit-banging
> + * Description: Test EDID readout over bit banging.
> + * Driver requirement: i915
>   */
>=20=20
>  IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features wo=
rk"
> @@ -300,6 +305,87 @@ static void prune_stale_modes(int drm_fd, drmModeCon=
nectorPtr connector)
>  				FORCE_CONNECTOR_UNSPECIFIED);
>  }
>=20=20
> +static bool connector_has_valid_edid(int drm_fd, drmModeConnectorPtr con=
nector)
> +{
> +	static const uint8_t header[] =3D {
> +		0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> +	};
> +	drmModePropertyBlobPtr blob;
> +	uint64_t blob_id;
> +	uint8_t checksum =3D 0;
> +
> +	if (!kmstest_get_property(drm_fd, connector->connector_id,
> +				  DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
> +				  &blob_id, NULL) || !blob_id)
> +		return false;
> +
> +	blob =3D drmModeGetPropertyBlob(drm_fd, blob_id);
> +	if (!blob || blob->length < EDID_BLOCK_SIZE ||
> +	    memcmp(blob->data, header, sizeof(header))) {
> +		if (blob)
> +			drmModeFreePropertyBlob(blob);
> +		return false;
> +	}
> +
> +	for (size_t i =3D 0; i < EDID_BLOCK_SIZE; i++)
> +		checksum +=3D ((const uint8_t *)blob->data)[i];
> +
> +	drmModeFreePropertyBlob(blob);
> +	return checksum =3D=3D 0;

The kernel won't store the EDID in the property if the base block
checksum is invalid. OTOH, the kernel allows checksum failures in the
CTA extension block, but that's no indication of failure here either.

BR,
Jani.



> +}
> +
> +static void force_edid_over_bit_banging(int drm_fd,
> +					drmModeConnectorPtr connector)
> +{
> +	char connector_name[32];
> +	char debugfs_path[64];
> +	drmModeConnector *temp;
> +
> +	igt_require_i915(drm_fd);
> +	snprintf(connector_name, sizeof(connector_name), "%s-%u",
> +		 kmstest_connector_type_str(connector->connector_type),
> +		 connector->connector_type_id);
> +	snprintf(debugfs_path, sizeof(debugfs_path),
> +		 "%s/intel_force_bit_banging", connector_name);
> +
> +	igt_require_f(igt_debugfs_exists(drm_fd, debugfs_path, O_RDONLY),
> +		      "%s is not available\n", debugfs_path);
> +
> +	igt_assert_eq(igt_debugfs_write_connector_file(drm_fd, connector_name,
> +						       "intel_force_bit_banging",
> +						       "1", 1), 0);
> +
> +	/* Reprobe the connector with bit banging enabled. */
> +	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_OFF);
> +	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
> +	temp =3D drmModeGetConnectorCurrent(drm_fd, connector->connector_id);
> +	igt_assert(temp);
> +	if (!connector_has_valid_edid(drm_fd, connector)) {
> +		igt_warn("No valid EDID found with bit banging enabled\n");
> +		igt_debugfs_write_connector_file(drm_fd, connector_name,
> +						 "intel_force_bit_banging", "0", 1);
> +		igt_reset_connectors();
> +		igt_fail(IGT_EXIT_FAILURE);
> +	}
> +	drmModeFreeConnector(temp);
> +
> +	igt_assert_eq(igt_debugfs_write_connector_file(drm_fd, connector_name,
> +						       "intel_force_bit_banging",
> +						       "0", 1), 0);
> +
> +	/* Reprobe once more after restoring the normal EDID read path. */
> +	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_OFF);
> +	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
> +	temp =3D drmModeGetConnectorCurrent(drm_fd, connector->connector_id);
> +	igt_assert(temp);
> +	if (!connector_has_valid_edid(drm_fd, connector)) {
> +		igt_warn("No valid EDID found after disabling bit banging\n");
> +		igt_reset_connectors();
> +		igt_fail(IGT_EXIT_FAILURE);
> +	}
> +	drmModeFreeConnector(temp);
> +}
> +
>  static int opt_handler(int opt, int opt_index, void *data)
>  {
>  	switch (opt) {
> @@ -338,7 +424,10 @@ int igt_main_args("", long_opts, help_str, opt_handl=
er, NULL)
>  		  force_edid },
>  		{ "prune-stale-modes",
>  		  "Tests pruning of stale modes.",
> -		  prune_stale_modes }
> +		  prune_stale_modes },
> +		{ "force-edid-read-over-i2c-bit-banging",
> +		  "Test EDID readout over bit banging.",
> +		  force_edid_over_bit_banging }
>  	};
>=20=20
>  	igt_fixture() {

--=20
Jani Nikula, Intel
