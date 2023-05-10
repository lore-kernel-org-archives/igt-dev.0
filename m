Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B49E10E47D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 May 2023 10:18:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-306281edf15so6570396f8f.1
 for <igt-dev@lists.freedesktop.org>; Wed, 10 May 2023 03:18:44 -0700 (PDT)
Message-ID: <3a8a2485-f851-46ec-c4b9-aa98d5d0076a@gmail.com>
Date: Wed, 10 May 2023 13:18:33 +0300
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20230503203205.117841-1-mcanal@igalia.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230503203205.117841-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Only set
 rotation if rotation != rotate-0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Look ok to me. I didn't spot any of those ci shard run failures to 
relate to this change.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 3.5.2023 23.32, Maíra Canal wrote:
> If you run the kms_plane_scaling tests on drivers that don't support the
> rotation property, you end up getting the following error:
> 
> (kms_plane_scaling:29327) igt_kms-CRITICAL: Test assertion failure function
> igt_atomic_prepare_plane_commit, file ../lib/igt_kms.c:3309:
> (kms_plane_scaling:29327) igt_kms-CRITICAL: Failed assertion: plane->props[i]
> (kms_plane_scaling:29327) igt_kms-CRITICAL: Last errno: 38, Function not implemented
> Dynamic subtest pipe-A-Virtual-1 failed.
> 
> This error indicates that the rotation property is not implemented in
> the driver, making the test fail instead of skip/pass. This happens
> because, even if the test don't test rotation, it sets the rotation to
> IGT_ROTATE_0.
> 
> Therefore, before setting the rotation property, verify if the
> rotation parameter is IGT_ROTATE_0. Only set the rotation property if
> the rotation is different than IGT_ROTATE_0. This way the
> kms_plane_scaling tests will skip/pass gracefully even without the
> rotation property implemented.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   tests/kms_plane_scaling.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index a37abd16..0e7cd4a2 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -441,7 +441,8 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	else
>   		igt_plane_set_size(plane, width, height);
>   
> -	igt_plane_set_rotation(plane, rot);
> +	if (rot != IGT_ROTATION_0)
> +		igt_plane_set_rotation(plane, rot);
>   	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>   
>   	igt_plane_set_fb(plane, NULL);
