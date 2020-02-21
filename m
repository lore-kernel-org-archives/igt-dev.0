Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F626F44B
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 13:55:33 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id g13so669551uab.7
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 05:55:33 -0800 (PST)
MIME-Version: 1.0
References: <20200219142445.69061-1-emil.l.velikov@gmail.com>
 <20200221115825.GF25209@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200221115825.GF25209@platvala-desk.ger.corp.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 21 Feb 2020 13:55:18 +0000
Message-ID: <CACvgo50TohYm7aYw2HMej5w8faXOPVSa5SXk5RDhowz=bJvWqg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] ts/core_setmaster: new test for
 drop/set master semantics
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

Thank you for having a look.

On Fri, 21 Feb 2020 at 11:58, Petri Latvala <petri.latvala@intel.com> wrote:

> > +static void check_drop_set(void)
> > +{
> > +     int master;
> > +
> > +     master = __drm_open_driver(DRIVER_ANY);
> > +
> > +     /* Double-check if open has failed */
> > +     igt_assert_neq(master, -1);
>
> Just use drm_open_driver(). For sure you don't want to produce a
> 'FAIL' when running on a system without GPU drivers. 'SKIP' is correct
> for that case.
>
This sounds very strange. Why would anyone run IGT if they lack _any_
GPU drivers.
If I'm running GPU tests and my GPU doesn't show up for any reason,
I'd expect a hard failure.

Even if we ignore that, a quick look around shows that there are
multiple tests that will happily pass -1 to forward.
If anything, the only way to trigger this is my dropping the chown() calls.

Hmm ... actually using an igt_skip with drop_root root-less case seems
to be broken.
How about we follow other tests and remove the check?


> > +static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
> > +{
> > +     char path[256];
> > +     struct stat st;
> > +     unsigned i;
> > +
> > +     for (i = 0; i < max_perm; i++) {
> > +             snprintf(path, sizeof(path), "/dev/dri/card%u", i);
> > +
> > +             /* Existing userspace assumes there's no gaps, do the same. */
> > +             if (stat(path, &st) != 0)
> > +                     break;
> > +
> > +             if (save) {
> > +                     /* Save and toggle */
> > +                     saved_perm[i] = st.st_mode & (S_IROTH | S_IWOTH);
> > +                     st.st_mode |= S_IROTH | S_IWOTH;
> > +             } else {
> > +                     /* Clear and restore */
> > +                     st.st_mode &= ~(S_IROTH | S_IWOTH);
> > +                     st.st_mode |= saved_perm[i];
> > +             }
> > +
> > +             /* In the extremely unlikely case of this failing, there't not
> > +              * much we can do.
>
> We can igt_require that it works though. chmod failing means we get a
> false 'FAIL' from the test.
>
> Restoring failure leaves the system to a state that is going to scare
> people with the extra perms...
>
AFAICT igt_require will effectively become "igt_skip" on failure.

Thus if it triggers during restore we end up with partially restored attributes.
If it happens during the toggle state, even with the fixture approach
below, we will end up with garbage in saved_perm or the length
variable. And using that data for restore will be bad.

IMHO there isn't any reason this will ever fail... I was super
paranoid as I wrote the comment.
It makes more sense to drop the misleading comment.

What do you think?


> > +     igt_subtest("master-drop-set-user") {
> > +             uint8_t saved_perm[255];
> > +             unsigned num;
> > +
> > +             /* Upon dropping root we end up as random user, which
> > +              * a) is not in the video group, and
> > +              * b) lacks logind ACL, thus
> > +              * any open() fill fail.
> > +              *
> > +              * As such, save the state of original other rw permissions
> > +              * and toggle them on.
> > +              */
> > +             num = tweak_perm(saved_perm, ARRAY_SIZE(saved_perm), true);
> > +
> > +             igt_fork(child, 1) {
> > +                     igt_drop_root();
> > +                     check_drop_set();
> > +             }
> > +             igt_waitchildren();
> > +
> > +             /* Restore the orignal permissions */
> > +             tweak_perm(saved_perm, num, false);
>
> If the test fails we never restore the permissions with this flow. I
> suppose this would be the best (but still ugly) way to make that
> happen:
>
> igt_fixture {
>    tweak_perm(...)
> }
>
> igt_subtest("master-drop-set-user") {
> ...
> }
>
> igt_fixture {
>   tweak_perm(saved);
> }
>
> Wrapping all that in an igt_subtest_group not required but could be
> used to communicate to human readers that this is the subtest these
> two fixtures are for.
>
Indeed this way the permissions are restored on failure - how did I
miss that. Added the fixtures, small comment and a subtest_group.

Let me know how if you agree with my suggestions, and I'll send out v3.

Thanks
Emil
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
