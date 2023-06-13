Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE7110E3F1
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 23:28:50 +0000 (UTC)
Message-ID: <01f59943-9127-4af3-7cbb-d700c028c07e@amd.com>
Date: Tue, 13 Jun 2023 17:28:15 -0600
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com, stylon.wang@amd.com,
 hamza.mahfooz@amd.com
References: <20230613124647.37529-1-hersenxs.wu@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20230613124647.37529-1-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_vrr_range: fix test
 crash when n_pipes > n_outputs
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

Reviewed-by: Alex Hung <alex.hung@amd.com>


On 2023-06-13 06:46, Hersen Wu wrote:
> Fix test crash by looping outputs using
> for_each_connected_output(display, output).
> 
> When n_pipes > n_outputs, i >= n_outputs,
> display->outputs[i]->config.connector within
> for_each_pipe(display, i) are invalid.
> Invalid connectors cause test crash.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>   tests/amdgpu/amd_vrr_range.c | 20 ++++++--------------
>   1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
> index 3f8f23e9a..611f41f95 100644
> --- a/tests/amdgpu/amd_vrr_range.c
> +++ b/tests/amdgpu/amd_vrr_range.c
> @@ -258,18 +258,14 @@ static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
>   	const struct edid *edid;
>   	range_t range, expected_range;
>   	igt_output_t *output;
> -	int i, j, test_conn_cnt = 0;
> +	int j, test_conn_cnt = 0;
> +	igt_display_t *display = &data->display;
>   
>   	test_init(data);
>   
>   	igt_amd_require_hpd(&data->display, data->fd);
>   
> -	for_each_pipe(&data->display, i) {
> -		/* setup the output */
> -		output = data->output[i];
> -		if (!output || !igt_output_is_connected(output))
> -			continue;
> -
> +	for_each_connected_output(display, output) {
>   		/* find a test EDID */
>   		j = find_test_edid_index(output->config.connector->connector_type);
>   
> @@ -335,18 +331,14 @@ static void test_freesync_range_base(data_t *data, uint32_t test_flags)
>   {
>   	range_t range;
>   	igt_output_t *output;
> -	int i, test_conn_cnt = 0;
> +	int test_conn_cnt = 0;
> +	igt_display_t *display = &data->display;
>   
>   	test_init(data);
>   
>   	igt_amd_require_hpd(&data->display, data->fd);
>   
> -	for_each_pipe(&data->display, i) {
> -		/* setup the output */
> -		output = data->output[i];
> -		if (!output || !igt_output_is_connected(output))
> -			continue;
> -
> +	for_each_connected_output(display, output) {
>   		igt_debug_on_f(!has_vrr(output), "Requires output supports VRR\n");
>   
>   		if (!has_vrr(output)) {
