Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8692410E22F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 14:25:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id o2so316242wro.12
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 07:25:15 -0700 (PDT)
Message-ID: <3b2966e6-c41f-2004-a3da-8a50e8aee13a@gmail.com>
Date: Thu, 16 Mar 2023 16:25:12 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20230316022659.73202-1-zack@kde.org>
 <20230316022659.73202-9-zack@kde.org>
 <DM6PR05MB70990327C01C62C72489C001AEBC9@DM6PR05MB7099.namprd05.prod.outlook.com>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <DM6PR05MB70990327C01C62C72489C001AEBC9@DM6PR05MB7099.namprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 8/8] lib/igt_kms: vmwgfx returns 8
 crtc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


LGTM

Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin


On 16.03.23 г. 14:57 ч., Martin Krastev wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> To avoid crashes in multiple tests we need to extend the number of
> available pipe's to match the numbers returned by the virtualized drivers.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   lib/igt_kms.c | 2 +-
>   lib/igt_kms.h | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 8c7dd85b..d2e9eccc 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -839,7 +839,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_pipe_t *p
>    */
>   const char *kmstest_pipe_name(enum pipe pipe)
>   {
> -       static const char str[] = "A\0B\0C\0D\0E\0F";
> +       static const char str[] = "A\0B\0C\0D\0E\0F\0G\0H";
>
>          _Static_assert(sizeof(str) == IGT_MAX_PIPES * 2,
>                         "Missing pipe name");
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index be5482e0..64807a7f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -62,6 +62,8 @@ enum pipe {
>           PIPE_D,
>           PIPE_E,
>           PIPE_F,
> +       PIPE_G,
> +       PIPE_H,
>           IGT_MAX_PIPES
>   };
>   const char *kmstest_pipe_name(enum pipe pipe);
> --
> 2.38.1
>
