Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B976E445
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2020 15:07:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j18so3300585wmi.3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2020 08:07:21 -0700 (PDT)
References: <20200623135342.7046-1-stanislav.lisovskiy@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <79815182-5f59-cdb3-75da-741042273457@gmail.com>
Date: Tue, 23 Jun 2020 18:07:10 +0300
MIME-Version: 1.0
In-Reply-To: <20200623135342.7046-1-stanislav.lisovskiy@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] igt/tests: Clear pipes properly in
 kms_atomic_transition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 23.6.2020 16.53, Stanislav Lisovskiy wrote:
> There is an issue happening from time to time in kms_atomic_transition
> (bug #1918). We periodically get assertion that some two outputs
> attempt to use same pipe like this:
> 
> "Failed assertion: output->pending_pipe != b->pending_pipe"
> 
> After some investigation came to conclusion that this is happening
> because we are calling igt_output_set_pipe(output, PIPE_NONE) only
> for connected outputs, which is wrong.
> Periodically igt_display_refresh/igt_output_refresh call calls can
> update the output state to disconnected. However that doesn't clear
> the pipe being assigned(i.e output->pending_pipe).
> So this causes assertion to be triggered on next igt_display_refresh
> called during commit.
> 
> Bugzilla: https://gitlab.freedesktop.org/drm/intel/-/issues/1918
> 
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>   tests/kms_atomic_transition.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 754a4969..a55388cd 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -665,8 +665,9 @@ static unsigned set_combinations(igt_display_t *display, unsigned mask, struct i
>   	enum pipe pipe;
>   	unsigned event_mask = 0;
>   
> -	for_each_connected_output(display, output)
> -		igt_output_set_pipe(output, PIPE_NONE);
> +	for_each_pipe(display, pipe)
> +		for_each_valid_output_on_pipe(display, pipe, output)
> +			igt_output_set_pipe(output, PIPE_NONE);
>   
>   	for_each_pipe(display, pipe) {
>   		igt_plane_t *plane = igt_pipe_get_plane_type(&display->pipes[pipe],
> 

Look ok to me.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
