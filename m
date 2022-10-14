Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A384F10EA68
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Oct 2022 04:38:20 +0000 (UTC)
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 14 Oct 2022 04:37:22 +0000
Message-ID: <MWHPR11MB1741BD7E3BE558E2830359C2E3249@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <20221010093547.14296-1-jeevan.b@intel.com>
In-Reply-To: <20221010093547.14296-1-jeevan.b@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] RFC: kms_content_protection: Add a test
 for HDCP-MST with suspend resume
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

Hi Jeevan
>=20
> +static void
> +test_content_protection_mst_suspend_resume(int content_type) {
> +	igt_display_t *display =3D &data.display;
> +	igt_output_t *output;
> +	int valid_outputs =3D 0, dp_mst_outputs =3D 0, ret, count, max_pipe =3D=
 0;
> +	enum pipe pipe;
> +	igt_output_t *mst_output[IGT_MAX_PIPES],
> +*hdcp_mst_output[IGT_MAX_PIPES];
> +
> +	for_each_pipe(display, pipe)
> +		max_pipe++;
> +
> +	pipe =3D PIPE_A;
> +
> +	for_each_connected_output(display, output) {
> +		if (!output_is_dp_mst(output, dp_mst_outputs))
> +			continue;
> +
> +		igt_assert_f(igt_pipe_connector_valid(pipe, output), "Output-
> pipe
> +combination invalid\n");
> +
> +		igt_output_set_pipe(output, pipe);
> +		prepare_modeset_on_mst_output(output);
> +		mst_output[dp_mst_outputs++] =3D output;
> +
> +		pipe++;
> +
> +		if (pipe > max_pipe)
> +			break;

Also in addition to what Petri Latvala said the condition should be >=3D

> +	}
> +
> +	igt_require_f(dp_mst_outputs > 1, "No DP MST set up with >=3D 2
> outputs
> +found in a single topology\n");
> +
> +	if (igt_display_try_commit_atomic(display,
> +				DRM_MODE_ATOMIC_TEST_ONLY |
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL) !=3D 0) {
> +		bool found =3D
> igt_override_all_active_output_modes_to_fit_bw(display);
> +		igt_require_f(found, "No valid mode combo found for MST
> modeset\n");
> +
> +		for (count =3D 0; count < dp_mst_outputs; count++)
> +
> 	prepare_modeset_on_mst_output(mst_output[count]);
> +	}
> +
> +	ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> +	igt_require_f(ret =3D=3D 0, "Commit failure during MST modeset\n");
> +
> +	for (count =3D 0; count < dp_mst_outputs; count++) {
> +		if (!output_hdcp_capable(mst_output[count], content_type))
> +			continue;
> +
> +		hdcp_mst_output[valid_outputs++] =3D mst_output[count];
> +	}
> +
> +	igt_require_f(valid_outputs > 1, "DP MST outputs do not have the
> +required HDCP support\n");
> +
> +	for (count =3D 0; count < valid_outputs; count++) {
> +		igt_output_set_prop_value(hdcp_mst_output[count],
> +IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> +
> +		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> +			igt_output_set_prop_value(hdcp_mst_output[count],
> IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
> +	}
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	for (count =3D 0; count < valid_outputs; count++) {
> +		ret =3D wait_for_prop_value(hdcp_mst_output[count],
> CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		igt_assert_f(ret, "Content Protection not enabled on %s\n",
> hdcp_mst_output[count]->name);
> +	}

IGT should try to authenticate hdcp two more time incase it does not get HD=
CP
CP Enabled property as userspace need to try HDCP authentication thrice
before failing the authentication

> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	for (count =3D 0; count < valid_outputs; count++) {
> +		ret =3D wait_for_prop_value(hdcp_mst_output[count],
> CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		igt_assert_f(ret, "Content Protection not enabled on %s\n",
> hdcp_mst_output[count]->name);
> +	}
> +}
> +
>  static void test_content_protection_cleanup(void)
>  {
>  	igt_display_t *display =3D &data.display; @@ -817,6 +897,11 @@ static
> const struct {
>  	  .cp_tests =3D CP_LIC,
>  	  .content_type =3D HDCP_CONTENT_TYPE_1,
>  	},
> +	{ .desc =3D "Test Content protection(Type 1) over DP MST with LIC.",
> +          .name =3D "dp-mst-suspend_resume",
> +          .cp_tests =3D SUSPEND_RESUME,
> +          .content_type =3D HDCP_CONTENT_TYPE_0,
> +        },
Can we have this as HDCP_CONTENT_TYPE_1
>  };

Best Regards,
Suraj Kandpal
> 2.36.0
