Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Sat, 5 Jun 2021 05:46:55 +0000
Message-ID: <BY5PR11MB4372AD9AACA7DDF226FD4797893A9@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1622176367-12608-1-git-send-email-vidya.srinivas@intel.com>
 <CAJUqKUovbY4fT8wgeDfU+OoD4S-oBbSG80gn-BdFxGGc1GYo9A@mail.gmail.com>
In-Reply-To: <CAJUqKUovbY4fT8wgeDfU+OoD4S-oBbSG80gn-BdFxGGc1GYo9A@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Lin,
 Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Thank you very much Mark, for testing the patch and providing the "Tested-by" tag.

Regards
Vidya

-----Original Message-----
From: Mark Yacoub <markyacoub@chromium.org> 
Sent: Saturday, June 5, 2021 12:13 AM
To: Srinivas, Vidya <vidya.srinivas@intel.com>
Cc: intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org; Almahallawy, Khaled <khaled.almahallawy@intel.com>; Lin, Charlton <charlton.lin@intel.com>
Subject: Re: [PATCH i-g-t] [RFC] tests/drm_read: Fix subtest invalid-buffer

On Fri, May 28, 2021 at 12:41 AM Vidya Srinivas <vidya.srinivas@intel.com> wrote:
>
> Using (void *)-1 directly in read is aborting on chrome systems.
> Following message is seen.
>
> Starting subtest: invalid-buffer
> *** buffer overflow detected ***: terminated Received signal SIGABRT.
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
> diff --git a/tests/drm_read.c b/tests/drm_read.c index 
> ccf9d822fd8d..2fdec5be4078 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -103,10 +103,11 @@ static void teardown(int fd)  static void 
> test_invalid_buffer(int in)  {
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
