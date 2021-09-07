Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6C2897B5
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Sep 2021 12:15:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q26so13167233wrc.7
 for <igt-dev@lists.freedesktop.org>; Tue, 07 Sep 2021 05:15:28 -0700 (PDT)
References: <20210907075514.492714-1-bhanuprakash.modem@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <5df66859-7707-07dc-8780-889814ed8bc8@gmail.com>
Date: Tue, 7 Sep 2021 15:15:20 +0300
MIME-Version: 1.0
In-Reply-To: <20210907075514.492714-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Handle invalid
 cursor sizes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 7.9.2021 10.55, Bhanuprakash Modem wrote:
> As there are many possibilities to fail the commit, instead
> of considering all the failures we must take -EINVAL only into
> account.
> 

you have some special failure case in mind? I quickly looking noticed 
only -EINVAL and -ENOMEM possibilities for this commit which -ENOMEM I 
think could never really happen as here's just set the new size fb in place.

> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_cursor_crc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index f478ae08d..d53f5d249 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -651,7 +651,10 @@ static void require_cursor_size(data_t *data, int w, int h)
>   	igt_remove_fb(data->drm_fd, &primary_fb);
>   	igt_output_set_pipe(output, PIPE_NONE);
>   
> -	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w, h);
> +	if (ret < 0) {
> +		igt_assert_eq(errno, EINVAL);
> +		igt_skip("Cursor size %dx%d not supported by driver\n", w, h);
> +	}
>   }
>   
>   static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
> 
