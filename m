Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB7E6E196
 for <igt-dev@lists.freedesktop.org>; Wed, 19 May 2021 06:24:34 +0000 (UTC)
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
 <20210512170536.4778-15-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <86012bf6-b883-503b-b2fa-3c740766ffc5@intel.com>
Date: Wed, 19 May 2021 11:54:29 +0530
MIME-Version: 1.0
In-Reply-To: <20210512170536.4778-15-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v6 i-g-t 14/14] tests/kms_vblank: Reset the state
 before exiting the test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 5/12/2021 10:35 PM, Bhanuprakash Modem wrote:
> Before starting the next subtest, clean up the states to default
> values, those are assumed by other tests.
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_vblank.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index e561e41d7..93b01eba0 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -96,6 +96,8 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
>   
>   static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
>   {
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit(&data->display);
>   	igt_remove_fb(fd, &data->primary_fb);
>   }
>   
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
