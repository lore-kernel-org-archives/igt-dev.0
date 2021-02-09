Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5289F6EA8C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Feb 2021 04:22:23 +0000 (UTC)
References: <20210208120951.15224-1-jeevan.b@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <cc804c72-753a-af56-47da-c886dcee5372@intel.com>
Date: Tue, 9 Feb 2021 09:52:18 +0530
MIME-Version: 1.0
In-Reply-To: <20210208120951.15224-1-jeevan.b@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: restrict
 execution based on number of outputs connected
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
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2/8/2021 5:39 PM, Jeevan B wrote:
> In multi display scenario test used to exit after running on two pipes and
> it would skip other displays connected. so added a variable to correct this
> behavior.

With multidisplay set ups, the test ran only the first pipe on 2 outputs 
rather than two pipes?

With this fix in commit message, the patch looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_rotation_crc.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 6d4e87ed..eb66260b 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -424,13 +424,16 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   	drmModeModeInfo *mode;
>   	igt_output_t *output;
>   	enum pipe pipe;
> -	int pipe_count = 0;
> +	int pipe_count = 0, connected_outputs = 0;
>   
>   	if (plane_type == DRM_PLANE_TYPE_CURSOR)
>   		igt_require(display->has_cursor_plane);
>   
>   	igt_display_require_output(display);
>   
> +	for_each_connected_output(&data->display, output)
> +		connected_outputs++;
> +
>   	for_each_pipe_with_valid_output(display, pipe, output) {
>   		igt_plane_t *plane;
>   		int i, j, c;
> @@ -467,7 +470,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   			continue;
>   
>   		/* restricting the execution to 2 pipes to reduce execution time*/
> -		if (pipe_count == 2 && !data->extended)
> +		if (pipe_count == 2 * connected_outputs && !data->extended)
>   			break;
>   		pipe_count++;
>   


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
