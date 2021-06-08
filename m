Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E59E89449
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 15:29:03 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id t7so25622054lff.0
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 08:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210608003217.83582-1-khaled.almahallawy@intel.com>
In-Reply-To: <20210608003217.83582-1-khaled.almahallawy@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 8 Jun 2021 11:28:50 -0400
Message-ID: <CAJUqKUqeftPuDMGSOH0B2q0rDkKD8wPK9rMB5F+TUurGb3tbVw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: Skip if
 not able to create display_hdcp_srm.bin
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
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Cc: igt-dev@lists.freedesktop.org, Lee Shawn C <shawn.c.lee@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 7, 2021 at 8:32 PM Khaled Almahallawy
<khaled.almahallawy@intel.com> wrote:
>
> On Chrome devices, SRM subtest fails to create display_hdcp_srm.bin file because
> Chrome OS rootfs is mounted read-only by default
> (https://chromium.googlesource.com/chromiumos/docs/+/HEAD/developer_mode.md#disable-verity).
> The error below is observed in Chrome:
>
>     (kms_content_protection:9022) DEBUG: Test requirement passed: data.display.is_atomic
>     (kms_content_protection:9022) CRITICAL: Test assertion failure function __real_main720, file ../igt-gpu-tools-1.25/tests/kms_content_protection.c:807:
>     (kms_content_protection:9022) CRITICAL: Failed assertion: ret
>     (kms_content_protection:9022) CRITICAL: Last errno: 9, Bad file descriptor
>     (kms_content_protection:9022) CRITICAL: SRM update failedStack trace:
>
> This patch fixes that by checking if the file descriptor returned from the
> open call is valid and skip if it is not.
>
Tested on TGL (Delbin) and Zork with rootfs verification enabled.
> Tested-by: Mark Yacoub <markyacoub@chromium.org>
> Reported-by: Shawn Lee <shawn.c.lee@intel.com>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  tests/kms_content_protection.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 1d1a439a98fb..3cd279fe5704 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -296,6 +296,8 @@ static bool write_srm_as_fw(const __u8 *srm, int len)
>
>         fd = open("/lib/firmware/display_hdcp_srm.bin",
>                   O_WRONLY | O_CREAT, S_IRWXU);
> +       igt_require(fd >= 0);
> +
>         do {
>                 ret = write(fd, srm + total, len - total);
>                 if (ret < 0)
> --
> 2.25.1
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
