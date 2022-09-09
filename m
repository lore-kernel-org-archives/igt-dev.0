Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0665010E299
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 10:33:11 +0000 (UTC)
Date: Fri, 9 Sep 2022 12:33:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YxsWY5y3Imjdot2R@kamilkon-desk1>
References: <20220901063705.12600-1-karthik.b.s@intel.com>
 <cff5e872-8cab-acc8-3f91-14908e20a2fb@intel.com>
 <f59eaa95-1cc2-5452-d83a-aa3f79f0de69@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f59eaa95-1cc2-5452-d83a-aa3f79f0de69@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: Convert
 tests to Dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Karthik,

On 2022-09-09 at 10:34:27 +0530, Karthik B S wrote:
> On 9/5/2022 3:13 PM, Modem, Bhanuprakash wrote:
> > On Thu-01-09-2022 12:07 pm, Karthik B S wrote:
> > > Covert the existing subtests to dynamic subtests at pipe/output level.
> > > Also move the cleanup part outside the subtest so that it is run even if
> > > a failure is seen in the subtest.
> > > 
> > > Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> > > ---
> > >   tests/kms_content_protection.c | 366 ++++++++++++++++++---------------
> > >   1 file changed, 196 insertions(+), 170 deletions(-)
> > > 
> > > diff --git a/tests/kms_content_protection.c
> > > b/tests/kms_content_protection.c
> > > index 3041f1cd..dde6345c 100644

[cut]

> > > +
> > >   static void
> > >   test_content_protection(enum igt_commit_style s, int content_type)
> > >   {
> > >       igt_display_t *display = &data.display;
> > >       igt_output_t *output;
> > > +    enum pipe pipe;
> > >       int valid_tests = 0;
> > >         if (data.cp_tests & CP_MEI_RELOAD)
> > >           igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
> > >                     "mei_hdcp module is not loaded\n");
> > >   +    if (data.cp_tests & CP_UEVENT) {
> > > +        data.uevent_monitor = igt_watch_uevents();
> > > +        igt_flush_uevents(data.uevent_monitor);
> > > +    }
> > > +
> > > +    igt_display_reset(display);
> > 
> > Reset could be inside igt_dynamic()?

> I actually found an issue with the current test. Since the modeset is not
> being done before checking if output is HDCP capable, the test is skipping
> on the second output on MST configuration. So will move the modeset before
> the HDCP capable check and so will retain igt_reset also outside. Sounds
> good?

imho if it is a fix, is it worth to do fix before convert to dynamic ?
What about sending fix first ?

--
Kamil

[cut]
> > 
> > https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_content_protection.c#n840
> > 
> > 
> > Can we move test_content_protection_cleanup() to test_fini()?
> 
> This wouldn't be possible as we're using the same fb across all the
> subtests, we're removing the fb directly at the end.  And making sure all
> outputs have CP disabled. So could this be retained as is?
> 
> Thanks,
> Karthik.B.S
> 
> > 
> > - Bhanu
> > 
> > 
> 
