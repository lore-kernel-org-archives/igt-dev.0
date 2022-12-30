Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB9B10E478
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 18:55:48 +0000 (UTC)
Message-ID: <7d276e53-0798-dc64-32be-a20bb4fb84a3@linux.intel.com>
Date: Fri, 30 Dec 2022 19:55:44 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org
References: <20221229155842.2448977-1-andrzej.hajda@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20221229155842.2448977-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Andrzej,


While going through  the file I found more such missing igt_remove_fb() 
for example:

test_scaler_with_multi_pipe_plane(). Please include igt_remove_fb() for 
remaining funs as well.


Nirmoy

On 12/29/2022 4:58 PM, Andrzej Hajda wrote:
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
