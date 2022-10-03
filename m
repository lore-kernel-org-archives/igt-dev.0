Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690A210E420
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Oct 2022 16:25:49 +0000 (UTC)
Message-ID: <ae9f24ee-6982-4ef8-ba52-835184c03a25@amd.com>
Date: Mon, 3 Oct 2022 10:25:40 -0600
Content-Language: en-US
To: igt-dev@lists.freedesktop.org, markyacoub@google.com
References: <20220929200644.4160588-1-alex.hung@amd.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20220929200644.4160588-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH][V3] tests/kms_plane_multiple: turn off pipe
 if all planes are off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: michel.daenzer@mailbox.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mark,

As expected, the rev 3 has kms_plane_multiple failures on CI.IGT unlike 
rev 2 which has "is_amdgpu_device()" on the first set_pipe, and the 
failures are as below. The first set_pipe required by amdgpu is not 
needed on all devices.

(kms_plane_multiple:1581) igt_debugfs-CRITICAL: Test assertion failure 
function igt_pipe_crc_start, file 
../../../usr/src/igt-gpu-tools/lib/igt_debugfs.c:884:
(kms_plane_multiple:1581) igt_debugfs-CRITICAL: Failed assertion: 
pipe_crc->crc_fd != -1
(kms_plane_multiple:1581) igt_debugfs-CRITICAL: Last errno: 5, 
Input/output error

The Fi.CI.IGT results are available on 
https://patchwork.freedesktop.org/series/109086/


On 2022-09-29 14:06, Alex Hung wrote:
> amdgpu rejects when crtc is on + all planes are off, and it
> is necessary to turn off crtc when all planes are off in the
> subtest "tiling-none".
> 
> This is revised from https://patchwork.freedesktop.org/series/80904/
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
> V2 - remove second is_amdgpu_device() before setting PIPE_NONE
> 
> V3 - remove both is_amdgpu_device() before setting PIPE_NONE
> 
>   tests/kms_plane_multiple.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index cbe8c189..6c0bc36d 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -311,6 +311,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>   		for_each_plane_on_pipe(&data->display, pipe, plane)
>   			igt_plane_set_fb(plane, NULL);
>   
> +		igt_output_set_pipe(output, PIPE_NONE);
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   		for (int x = 0; x < c; x++)
> @@ -344,6 +345,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>   		for_each_plane_on_pipe(&data->display, pipe, plane)
>   			igt_plane_set_fb(plane, NULL);
>   
> +		igt_output_set_pipe(output, PIPE_NONE);
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   		for (int x = 0; x < c; x++)
