Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF29910E898
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 02:45:17 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Sep 2022 02:45:02 +0000
Message-ID: <DM4PR11MB6312372FA487D843C9D6705A90559@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-3-kunal1.joshi@intel.com>
In-Reply-To: <20220926185321.2897136-3-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1 2/5] tests/i915/kms_pipe_b_c_ivb.c:
 test cleanup
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

Hi Kunal,=20

> -----Original Message-----
> From: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Sent: Tuesday, September 27, 2022 12:23 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; B, Jeevan <jeevan.b@intel.com=
>
> Subject: [PATCH i-g-t v1 2/5] tests/i915/kms_pipe_b_c_ivb.c: test cleanup
>=20
> -> Sanitize the state before starting the subtest close drm_fd
>=20
> Cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/i915/kms_pipe_b_c_ivb.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/tests/i915/kms_pipe_b_c_ivb.c b/tests/i915/kms_pipe_b_c_ivb.=
c
> index 5823ae2a..4f49d7b2 100644
> --- a/tests/i915/kms_pipe_b_c_ivb.c
> +++ b/tests/i915/kms_pipe_b_c_ivb.c
> @@ -142,6 +142,12 @@ test_dpms(data_t *data)
>  	igt_output_t *output1, *output2;
>  	int ret;
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);

Can we call this inside fixture ?=20

Thanks=20
Jeevan B=20

> +
>  	find_outputs(data, &output1, &output2);
>=20
>  	igt_info("Pipe %s will use connector %s\n", @@ -164,6 +170,12 @@
> test_lane_reduction(data_t *data)
>  	igt_output_t *output1, *output2;
>  	int ret;
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>  	find_outputs(data, &output1, &output2);
>=20
>  	igt_info("Pipe %s will use connector %s\n", @@ -187,6 +199,12 @@
> test_disable_pipe_B(data_t *data)
>  	igt_output_t *output1, *output2;
>  	int ret;
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>  	find_outputs(data, &output1, &output2);
>=20
>  	igt_info("Pipe %s will use connector %s\n", @@ -213,6 +231,12 @@
> test_from_C_to_B_with_3_lanes(data_t *data)
>  	igt_output_t *output1, *output2;
>  	int ret;
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>  	find_outputs(data, &output1, &output2);
>=20
>  	igt_info("Pipe %s will use connector %s\n", @@ -236,6 +260,12 @@
> test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
>  	igt_output_t *output1, *output2;
>  	int ret;
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>  	find_outputs(data, &output1, &output2);
>=20
>  	igt_info("Pipe %s will use connector %s\n", @@ -291,5 +321,6 @@
> igt_main
>=20
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> +		close(data.drm_fd);
>  	}
>  }
> --
> 2.25.1
