Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D8410E2B0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 17:19:56 +0000 (UTC)
Message-ID: <f8b84c9d-6e19-aef7-7189-c6051b5ac778@amd.com>
Date: Mon, 10 Jul 2023 11:19:51 -0600
Content-Language: en-US
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
References: <20230710075749.2377896-1-chiahsuan.chung@amd.com>
 <20230710075749.2377896-9-chiahsuan.chung@amd.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20230710075749.2377896-9-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t,
 v4 8/8] tests/amdgpu/amd_freesync_video_mode: Add
 amd_freesync_video_mode to meson.build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2023-07-10 01:57, Tom Chung wrote:
> Add amd_freesync_video_mode to meson.build file.
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>   tests/amdgpu/meson.build | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index e6e6eaabf..f45d9fb95 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -12,6 +12,7 @@ if libdrm_amdgpu.found()
>   			  'amd_cs_nop',
>   			  'amd_deadlock',
>   			  'amd_dp_dsc',
> +			  'amd_freesync_video_mode',
>   			  'amd_hotplug',
>   			  'amd_ilr',
>   			  'amd_info',
