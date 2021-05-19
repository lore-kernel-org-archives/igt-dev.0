Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3707D6E859
 for <igt-dev@lists.freedesktop.org>; Wed, 19 May 2021 05:50:26 +0000 (UTC)
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
 <20210512170536.4778-11-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <8659fced-2dc6-d12e-3be2-08e1f4f637e5@intel.com>
Date: Wed, 19 May 2021 11:20:21 +0530
MIME-Version: 1.0
In-Reply-To: <20210512170536.4778-11-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v6 i-g-t 10/14] tests/kms_cursor_edge_walk: Reset
 the state before exiting the test
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

LGTM.

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
>   tests/kms_cursor_edge_walk.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 69662afec..d1d8a9143 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -225,6 +225,7 @@ static void cleanup_crtc(data_t *data)
>   
>   	igt_remove_fb(data->drm_fd, &data->primary_fb);
>   	igt_remove_fb(data->drm_fd, &data->fb);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   }
>   
>   static void prepare_crtc(data_t *data)
> @@ -268,6 +269,8 @@ static void test_crtc(data_t *data, unsigned int edges)
>   	create_cursor_fb(data, data->curw, data->curh);
>   
>   	test_edges(data, edges);
> +
> +	cleanup_crtc(data);
>   }
>   
>   static int opt_handler(int opt, int opt_index, void *_data)
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
