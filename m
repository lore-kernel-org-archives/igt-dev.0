Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE37310E4B5
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 16:31:09 +0000 (UTC)
Date: Fri, 30 Jun 2023 18:31:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230630163104.yagjvzmdcgsyy3hj@kamilkon-desk1>
References: <20230630111821.126265-1-chiahsuan.chung@amd.com>
 <20230630111821.126265-9-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230630111821.126265-9-chiahsuan.chung@amd.com>
Subject: Re: [igt-dev] [i-g-t,
 v2 8/8] tests/amdgpu/amd_freesync_video_mode: Add
 amd_freesync_video_mode to meson.build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Christian Koenig <christian.koenig@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Tom,

please subscribe to igt-dev mailing list.

On 2023-06-30 at 19:18:21 +0800, Tom Chung wrote:
> Add amd_freesync_video_mode to meson.build file.
> 

Add here peaple on Cc: which can help you in review, for example:

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>  tests/amdgpu/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index ce081c35a..2226e5079 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -24,6 +24,7 @@ if libdrm_amdgpu.found()
>  			  'amd_psr',
>  			  'amd_plane',
>  			  'amd_ilr',
> +			  'amd_freesync_video_mode',
-------------------------- ^^^^^^^^^^^^^^^^^^^^^^^
Put this in alphabetical order.

>  			]
>  	amdgpu_deps += libdrm_amdgpu
>  endif
> -- 
> 2.25.1
> 
