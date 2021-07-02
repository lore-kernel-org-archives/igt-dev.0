Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24BE6E188
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jul 2021 14:12:51 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id q16so18362066lfr.4
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Jul 2021 07:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210624172436.1467489-1-markyacoub@chromium.org>
In-Reply-To: <20210624172436.1467489-1-markyacoub@chromium.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 2 Jul 2021 10:12:38 -0400
Message-ID: <CAJUqKUp1bk3b2-t4FRGGpNG2=9=__bvrjqy+Mx6O-YP5E_-OwQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH] Add .vscode to gitignore
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 1:24 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@google.com>
>
> Given the popularity of vscode, .vscode is a directory that holds
> the personal vscode preferences.
>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  .gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/.gitignore b/.gitignore
> index 88dd0338..119c80ba 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -50,3 +50,5 @@ results
>  build
>  patches
>  Makefile
> +
> +.vscode
> \ No newline at end of file
> --
> 2.32.0.93.g670b81a890-goog
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
