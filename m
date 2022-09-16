Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E4F10EC7F
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Sep 2022 11:32:05 +0000 (UTC)
Date: Fri, 16 Sep 2022 14:31:23 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <YyRei4rBOJC/tJz6@platvala-desk.ger.corp.intel.com>
References: <20220915193503.1502352-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915193503.1502352-1-alex.hung@amd.com>
Subject: Re: [igt-dev] [PATCH] Revert "tests/kms_concurrent: remove an AMD
 device check"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 15, 2022 at 01:35:03PM -0600, Alex Hung wrote:
> This reverts commit 79ebd88d01d679ffe9f6f24108c6ac4dc3f04ddd.
> 
> The interdependent kernel patch is not merged yet so revert
> 79ebd88d to avoid regressions.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>


Changing IGT back and forth to "sync up" with kernel changes is an
exercise in futility.

What tests should do is what's the "correct" way to handle things
according to documentation/specification. Whether kernel does it
correct doesn't matter for the question of what the tests should
do. Tests should always just be "this should do that" and tell whether
it does.

As a simplified comparison: Consider having a new feature xyz. Tests
for xyz should get merged without waiting for kernel parts to get
merged. With an old kernel the test just says "xyz doesn't work" (or
more correctly, "xyz doesn't exist" but that's besides the point).

For changes like this where there's some kind of a bug-fixing
functional change (?)  and the test and kernel need "synchronized"
updates, the best practice is to ignore the synchronization. After
updating the test for the behaviour that should be there, the results
might be a "failure" but the best-practice way to handle that is "ah,
the kernel wasn't updated yet", not "ah, we need to rewind tests".

After all, you can't force the entire world to update their
kernel. There's LTS for example.



-- 
Petri Latvala



> ---
>  tests/kms_concurrent.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 3ad51569..6f8ffd4a 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -276,6 +276,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
>  		/* switch to lower resolution */
>  		igt_output_override_mode(output, mode_lo);
>  		free(mode_lo);
> +		if (is_amdgpu_device(data->drm_fd))
> +			igt_output_set_pipe(output, PIPE_NONE);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		/* switch back to higher resolution */
> -- 
> 2.37.3
> 
