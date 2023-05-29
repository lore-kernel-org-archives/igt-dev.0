Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E97E10E288
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 12:35:11 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51403554f1dso5040713a12.1
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 05:35:11 -0700 (PDT)
Message-ID: <6dc23a8c-c694-4577-55dd-2f21ef11595f@gmail.com>
Date: Mon, 29 May 2023 15:35:03 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230526064520.310041-1-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230526064520.310041-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/kms_cursor_crc: limit test to
 one pipe for sim
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
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 26.5.2023 9.45, Swati Sharma wrote:
> To reduce execution time in simulation, lets limit test to
> one pipe only.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_cursor_crc.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 3a353a03..f837dbc4 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -728,6 +728,10 @@ static bool execution_constraint(enum pipe pipe)
>   	    pipe != active_pipes[last_pipe])
>   		return true;
>   
> +	if (!extended && igt_run_in_simulation() &&
> +	    pipe != active_pipes[0])
> +		return true;
> +
>   	return false;
>   }
>   
