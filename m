Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F88110E073
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 19:25:45 +0000 (UTC)
Message-ID: <edf68c01-79c9-a1d2-bf0f-51bf87cca519@intel.com>
Date: Sat, 31 Dec 2022 00:55:38 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org
References: <20221229155842.2448977-1-andrzej.hajda@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20221229155842.2448977-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: remove fb
 after test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

We have
cleanup_fbs(data) defined in the IGT.
Should we use this?

On 29-Dec-22 9:28 PM, Andrzej Hajda wrote:
> igt_create_color_fb should be accompanied with igt_remove_fb.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7331
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>   tests/kms_plane_scaling.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 4c621cce842..1a8f1581f3e 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -367,6 +367,8 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	igt_plane_set_fb(plane, NULL);
>   	igt_plane_set_position(plane, 0, 0);
>   
> +	igt_remove_fb(d->drm_fd, &d->fb[0]);
> +
>   	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
>   		      "Unsupported scaling factor with fb size %dx%d\n",
>   		      w, h);

-- 
~Swati Sharma
