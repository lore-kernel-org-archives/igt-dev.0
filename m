Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A39E10E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Mar 2023 15:51:03 +0000 (UTC)
Message-ID: <01bf7c6e-6455-4ebb-2e10-1b5b0c332fe1@amd.com>
Date: Fri, 17 Mar 2023 11:51:56 -0400
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, alex.hung@amd.com, aurabindo.pillai@amd.com
References: <20230317144745.24785-1-hersenxs.wu@amd.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230317144745.24785-1-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_dp_dsc: fix test
 crash signal sigsegv
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

On 3/17/23 10:47, Hersen Wu wrote:
> array size of data.output is 6. when n_outputs is greater than 6,
> test will crash. valid combinations of pipe and output are available
> for pipes with display->pipes[i].enable = true. macro for_each_pipe
> should be used for loop.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>

Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

> ---
>   tests/amdgpu/amd_dp_dsc.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index b3f3cafb..e782ce84 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -110,7 +110,7 @@ static void test_dsc_enable(data_t *data)
>   	test_init(data);
>   	igt_enable_connectors(data->fd);
>   
> -	for (i = 0; i < display->n_outputs; i++) {
> +	for_each_pipe(&data->display, i) {
>   		/* Setup the output */
>   		output = data->output[i];
>   		if (!output || !igt_output_is_connected(output))
> @@ -248,7 +248,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>   	test_init(data);
>   	igt_enable_connectors(data->fd);
>   
> -	for (i = 0; i < display->n_outputs; i++) {
> +	for_each_pipe(&data->display, i) {
>   		/* Setup the output */
>   		output = data->output[i];
>   		if (!output || !igt_output_is_connected(output))
> @@ -341,7 +341,7 @@ static void test_dsc_link_settings(data_t *data)
>       test_init(data);
>   
>       /* Setup all outputs */
> -	for (i = 0; i < display->n_outputs; i++) {
> +	for_each_pipe(&data->display, i) {
>   		output = data->output[i];
>   		if (!output || !igt_output_is_connected(output))
>   			continue;
> @@ -358,7 +358,7 @@ static void test_dsc_link_settings(data_t *data)
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>   
>       /* Collect reference CRCs */
> -	for (i = 0; i < display->n_outputs; i++) {
> +	for_each_pipe(&data->display, i) {
>   		output = data->output[i];
>   		if (!output || !igt_output_is_connected(output))
>   			continue;
> @@ -369,7 +369,7 @@ static void test_dsc_link_settings(data_t *data)
>   	for (lc = 0; lc < ARRAY_SIZE(lane_count_vals); lc++) {
>   		for (lr = 0; lr < ARRAY_SIZE(link_rate_vals); lr++) {
>   			/* Write new link_settings */
> -			for (i = 0; i < display->n_outputs; i++) {
> +			for_each_pipe(&data->display, i) {
>   				output = data->output[i];
>   				if (!output || !igt_output_is_connected(output))
>   					continue;
> @@ -387,7 +387,7 @@ static void test_dsc_link_settings(data_t *data)
>   			/* Trigger commit after writing new link settings */
>   			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
> -			for (i = 0; i < display->n_outputs; i++) {
> +			for_each_pipe(&data->display, i) {
>   				output = data->output[i];
>   				if (!output || !igt_output_is_connected(output))
>   					continue;
> @@ -416,7 +416,7 @@ static void test_dsc_link_settings(data_t *data)
>   	}
>   
>   	/* Cleanup all fbs */
> -	for (i = 0; i < display->n_outputs; i++) {
> +	for_each_pipe(&data->display, i) {
>   		output = data->output[i];
>   		if (!output || !igt_output_is_connected(output))
>   			continue;
> @@ -439,7 +439,7 @@ static void test_dsc_bpc(data_t *data)
>       test_init(data);
>   
>   	/* Find max supported bpc */
> -	for (i = 0; i < display->n_outputs; i++) {
> +	for_each_pipe(&data->display, i) {
>   		output = data->output[i];
>   		if (!output || !igt_output_is_connected(output))
>   			continue;
> @@ -451,7 +451,7 @@ static void test_dsc_bpc(data_t *data)
>   	for (bpc = 0; bpc < ARRAY_SIZE(bpc_vals); bpc++) {
>   		igt_info("Testing bpc = %d\n", bpc_vals[bpc]);
>   
> -		for (i = 0; i < display->n_outputs; i++) {
> +		for_each_pipe(&data->display, i) {
>   			output = data->output[i];
>   			if (!output || !igt_output_is_connected(output))
>   				continue;
> @@ -474,7 +474,7 @@ static void test_dsc_bpc(data_t *data)
>   
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>   
> -		for (i = 0; i < display->n_outputs; i++) {
> +		for_each_pipe(&data->display, i) {
>   			output = data->output[i];
>   			if (!output || !igt_output_is_connected(output))
>   				continue;
> @@ -501,7 +501,7 @@ static void test_dsc_bpc(data_t *data)
>   		}
>   
>   		/* Cleanup all fbs */
> -		for (i = 0; i < display->n_outputs; i++) {
> +		for_each_pipe(&data->display, i) {
>   			output = data->output[i];
>   			if (!output || !igt_output_is_connected(output))
>   				continue;

-- 
Hamza
