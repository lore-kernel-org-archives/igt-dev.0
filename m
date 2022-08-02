Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC66F112E72
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Aug 2022 09:34:29 +0000 (UTC)
Message-ID: <09427270-6b9b-ddd5-9500-d462d1c40eac@intel.com>
Date: Tue, 2 Aug 2022 15:03:55 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220801110710.95609-1-mohammed.thasleem@intel.com>
 <20220801110710.95609-3-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220801110710.95609-3-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 2/2] tests/kms_lease: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon-01-08-2022 04:37 pm, Mohammed Thasleem wrote:
> Sanitize the system state before starting the subtest.
> 
> v2: Minor changes.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_lease.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 6126ded9..1d4ff904 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c

Why are we still trying to get a pipe from crtc_id (inside prepare_crtc)
enum pipe pipe = crtc_id_to_pipe(display, crtc_id);

As we already preserving it in data->pipe, can't we reuse it?

> @@ -136,7 +136,7 @@ static void cleanup_crtc(lease_t *lease, igt_output_t *output)
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit(display);
>   }
>   
> @@ -1235,12 +1235,15 @@ igt_main
>   		data.master.fd = drm_open_driver_master(DRIVER_ANY);
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.master.display, data.master.fd);
> +		igt_display_require_output(&data.master.display);

Please fix this, few subtests doesn't required any output.

Example: implicit-plane-lease

>   	}
>   
>   	for (f = funcs; f->name; f++) {
>   
>   		igt_describe(f->desc);
>   		igt_subtest_with_dynamic_f("%s", f->name) {
> +			igt_display_reset(&data.master.display);

Infact this is required for every subtest, hence it should be moved 
inside of igt_dynamic()

- Bhanu

> +			igt_display_commit(&data.master.display);
>   			for_each_pipe_with_valid_output(&data.master.display, p, output) {
>   				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p),
>   					      igt_output_name(output)) {
> @@ -1277,4 +1280,9 @@ igt_main
>   	igt_describe("Tests all the uevent cases");
>   	igt_subtest("lease-uevent")
>   		lease_uevent(&data);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.master.display);
> +		close(data.master.fd);
> +	}
>   }
