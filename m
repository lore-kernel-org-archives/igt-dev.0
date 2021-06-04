Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216756F89D
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jun 2021 18:43:07 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i9so15449756lfe.13
 for <igt-dev@lists.freedesktop.org>; Fri, 04 Jun 2021 11:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <1622176367-12608-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1622176367-12608-1-git-send-email-vidya.srinivas@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 4 Jun 2021 14:42:54 -0400
Message-ID: <CAJUqKUovbY4fT8wgeDfU+OoD4S-oBbSG80gn-BdFxGGc1GYo9A@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] [RFC] tests/drm_read: Fix subtest
 invalid-buffer
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
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 28, 2021 at 12:41 AM Vidya Srinivas
<vidya.srinivas@intel.com> wrote:
>
> Using (void *)-1 directly in read is aborting on chrome systems.
> Following message is seen.
>
> Starting subtest: invalid-buffer
> *** buffer overflow detected ***: terminated
> Received signal SIGABRT.
> Stack trace:
> Aborted (core dumped)
>
> Patch just adds a pointer variable and uses it in read.
>
Tested on ChromeOS on TGL (Delbin) and JSL (Drawlat)
Tested-by: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/drm_read.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index ccf9d822fd8d..2fdec5be4078 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -103,10 +103,11 @@ static void teardown(int fd)
>  static void test_invalid_buffer(int in)
>  {
>         int fd = setup(in, 0);
> +       void *add = (void *)-1;
>
>         alarm(1);
>
> -       igt_assert_eq(read(fd, (void *)-1, 4096), -1);
> +       igt_assert_eq(read(fd, add, 4096), -1);
>         igt_assert_eq(errno, EFAULT);
>
>         teardown(fd);
> --
> 2.7.4
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
