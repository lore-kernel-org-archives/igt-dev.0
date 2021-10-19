Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6676EB56
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 16:02:59 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g10so14516695edj.1
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 09:02:59 -0700 (PDT)
References: <20211019143835.23125-1-petri.latvala@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <b76a6ce3-c3e5-df2e-aba5-b0ce8074acc6@gmail.com>
Date: Tue, 19 Oct 2021 19:00:06 +0300
MIME-Version: 1.0
In-Reply-To: <20211019143835.23125-1-petri.latvala@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Stop executing kms_bw
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 19.10.2021 17.38, Petri Latvala wrote:
> kms_bw has problems running on i915. Block it until it gets fixed.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel-ci/blacklist.txt | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index fa040006..ca361fde 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -123,3 +123,6 @@ igt@core_hotunplug@.*(hot|plug).*
>   
>   # hangs several gens of hosts, and has no immediate fix
>   igt@device_reset@reset-bound
> +
> +# not working for i915
> +igt@kms_bw@.*
> 
