Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6E689CF4
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 19:38:49 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p7so5761138lfg.4
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 12:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210607183110.259414-1-markyacoub@chromium.org>
 <20210609191545.jfya5x2zi3vu7a4q@outlook.office365.com>
In-Reply-To: <20210609191545.jfya5x2zi3vu7a4q@outlook.office365.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 9 Jun 2021 15:38:37 -0400
Message-ID: <CAJUqKUpHPArv8HKeKf0toidyG_C0AmLrLzOnwUhHENHKaZztCQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_content_protection: Skip on
 hdcp_sink_capability is not found.
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
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: igt-dev@lists.freedesktop.org, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, Sean Paul <seanpaul@chromium.org>, Petri Latvala <petri.latvala@intel.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 9, 2021 at 3:15 PM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> On 06/07, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > In some configurations such as kernel 5.4 on Zork with no DP connected,
> > debugfs will not contain hdcp_sink_capability file.
> >
> > [How]
> > Check for hdcp_sink_capability but skip the test if file is not found.
> >
> > Tested on ChromeOS Zork Kernel 5.4
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  tests/kms_content_protection.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> > index 1d1a439a..a0a136da 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -402,6 +402,7 @@ static void test_content_protection_on_output(igt_output_t *output,
> >  static void __debugfs_read(int fd, const char *param, char *buf, int len)
> >  {
> >       len = igt_debugfs_simple_read(fd, param, buf, len);
> > +     igt_require(len != -ENOENT);
> >       if (len < 0)
> >               igt_assert_eq(len, -ENODEV);
> >  }
> > --
> > 2.32.0.rc1.229.g3e70b5a671-goog
> >
>
> Hi Mark,
>
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>
> After applying this patch, which tests start to pass in your Zork
> system?
all the tests of kms_content_protection (except for srm that has
another fix in flight) stopped failing on Zork running
chromeos-kernel-5_4 with rootfs verification enabled and no external
display connected.
>
> + Bhawan
>
> Thanks
>
> --
> Rodrigo Siqueira
> https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
