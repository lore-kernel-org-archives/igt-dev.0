Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CA38CFA0
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 16:46:26 +0000 (UTC)
Message-ID: <10bea995-4d44-1f86-a92b-d9e4552e1463@igalia.com>
Date: Mon, 15 Aug 2022 13:46:01 -0300
MIME-Version: 1.0
Content-Language: en-US
To: Tales Aparecida <tales.aparecida@gmail.com>
References: <20220815145146.24038-1-tales.aparecida@gmail.com>
 <20220815145146.24038-5-tales.aparecida@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <tonyk@igalia.com>
In-Reply-To: <20220815145146.24038-5-tales.aparecida@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/4] lib/igt_kmod: add igt_kselftests
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, siqueirajordao@riseup.net,
 magalilemes00@gmail.com, igt-dev@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Tales,

On 8/15/22 11:51, Tales Aparecida wrote:
> Add documentation for igt_kselftests functions and structs. Also adds
> comments to non trivial lines.
> 
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---
> 
> Notes:
>      v2 -> v3: rephrase igt_kselftest_begin() documentation to say skips instead of fails
> 
>   lib/igt_kmod.c | 109 +++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kmod.h |  18 ++++++++
>   2 files changed, 127 insertions(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 5864f68c..a39bec18 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -792,6 +792,12 @@ igt_amdgpu_driver_unload(void)
>   	return IGT_EXIT_SUCCESS;
>   }
>   
> +/**
> + * kmsg_dump:
> + * @fd: file descriptor for `/dev/kmsg` opened for reading

In other places you refer to this file as 
<filename>/dev/kmsg</filename>, should it be the same here?
