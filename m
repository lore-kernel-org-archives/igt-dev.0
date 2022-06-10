Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F250410F11B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 13:23:21 +0000 (UTC)
Date: Fri, 10 Jun 2022 16:21:18 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Message-ID: <YqNFTr+oj9LAjCem@platvala-desk.ger.corp.intel.com>
References: <20220527081353.3800969-1-bhanuprakash.modem@intel.com>
 <20220527081353.3800969-2-bhanuprakash.modem@intel.com>
 <YpDGenChwpnUApdR@platvala-desk.ger.corp.intel.com>
 <YqMroYxv6mMCWi8R@platvala-desk.ger.corp.intel.com>
 <6e30e12a2c97804b0f2d3d3219c093678e72a994.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e30e12a2c97804b0f2d3d3219c093678e72a994.camel@intel.com>
Subject: Re: [igt-dev] [RFC i-g-t 1/4] runner: Introduce --resolution to
 igt_runner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 03:16:25PM +0300, Knop, Ryszard wrote:
> On Fri, 2022-06-10 at 14:31 +0300, Petri Latvala wrote:
> > On Fri, May 27, 2022 at 03:39:22PM +0300, Petri Latvala wrote:
> > > On Fri, May 27, 2022 at 01:43:50PM +0530, Bhanuprakash Modem wrote:
> > > > Allow finer control of taking default DRM display mode for
> > > > subtests
> > > > instead of taking the preferred mode exposed by the Kernel.
> > > >
> > > > Example:
> > > > Eventhough we have an 8K panel, Kernel may expose 4K or lesser
> > > > mode
> > > > as a preferred mode. So all subtests will take this mode as a
> > > > default
> > > > may cause losing the coverage.
> > > >
> > > > This patch will set the environment variable based on the user
> > > > request,
> > > > and IGT will parse this environment variable and take the
> > > > decision to
> > > > choose the mode from the available list.
> > > >
> > > > The default is still to take the preferred mode exposed by the
> > > > Kernel.
> > > > Other options are:
> > > > * highest: Choose the mode with highest possible resolution.
> > > > * lowest:  Choose the mode with lowest possible resolution.
> > > >
> > > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > > Cc: Swati Sharma <swati2.sharma@intel.com>
> > > > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > > ---
> > > >  runner/executor.c |  3 +++
> > > >  runner/settings.c | 47
> > > > +++++++++++++++++++++++++++++++++++++++++++++++
> > > >  runner/settings.h |  7 +++++++
> > > >  3 files changed, 57 insertions(+)
> > > >
> > > > diff --git a/runner/executor.c b/runner/executor.c
> > > > index 6e6ca9cc..fc805c30 100644
> > > > --- a/runner/executor.c
> > > > +++ b/runner/executor.c
> > > > @@ -2056,6 +2056,9 @@ bool execute(struct execute_state *state,
> > > >         }
> > > >
> > > >   end:
> > > > +       if (getenv("IGT_KMS_RESOLUTION"))
> > > > +               unsetenv("IGT_KMS_RESOLUTION");
> > > > +
> > > >         if (settings->enable_code_coverage && !settings-
> > > > >cov_results_per_test) {
> > > >                 char *reason = NULL;
> > > >
> > > > diff --git a/runner/settings.c b/runner/settings.c
> > > > index bb63a9f4..a20bcd01 100644
> > > > --- a/runner/settings.c
> > > > +++ b/runner/settings.c
> > > > @@ -30,6 +30,7 @@ enum {
> > > >         OPT_COV_RESULTS_PER_TEST,
> > > >         OPT_VERSION,
> > > >         OPT_PRUNE_MODE,
> > > > +       OPT_RESOLUTION,
> > > >         OPT_HELP = 'h',
> > > >         OPT_NAME = 'n',
> > > >         OPT_DRY_RUN = 'd',
> > > > @@ -78,6 +79,16 @@ static struct {
> > > >         { 0, 0 },
> > > >  };
> > > >
> > > > +static struct {
> > > > +       int value;
> > > > +       const char *name;
> > > > +} resolution_modes[] = {
> > > > +       { RESOLUTION_DEFAULT, "default" },
> > > > +       { RESOLUTION_HIGHEST, "highest" },
> > > > +       { RESOLUTION_LOWEST, "lowest" },
> > > > +       { 0, 0 },
> > > > +};
> > > > +
> > > >  static bool set_log_level(struct settings* settings, const char
> > > > *level)
> > > >  {
> > > >         typeof(*log_levels) *it;
> > > > @@ -130,6 +141,26 @@ static bool set_prune_mode(struct settings*
> > > > settings, const char *mode)
> > > >         return false;
> > > >  }
> > > >
> > > > +static bool set_resolution_mode(struct settings *settings, const
> > > > char *mode)
> > > > +{
> > > > +       typeof(*resolution_modes) *it;
> > > > +       char res[2];
> > > > +
> > > > +       for (it = resolution_modes; it->name; it++) {
> > > > +               if (!strcmp(mode, it->name)) {
> > > > +                       settings->resolution = it->value;
> > > > +
> > > > +                       sprintf(res, "%d", it->value);
> > > > +                       setenv("IGT_KMS_RESOLUTION", res, 1);
> > > > +
> > > > +                       return true;
> > > > +               }
> > > > +       }
> > > > +       setenv("IGT_KMS_RESOLUTION", "0", 1);
> > > > +
> > > > +       return false;
> > > > +}
> > > > +
> > > >  static bool parse_abort_conditions(struct settings *settings,
> > > > const char *optarg)
> > > >  {
> > > >         char *dup, *origdup, *p;
> > > > @@ -279,6 +310,12 @@ static const char *usage_str =
> > > >         "                                                  not in
> > > > the requested test set.\n"
> > > >         "                                                  Useful
> > > > when you have a hand-written\n"
> > > >         "
> > > > testlist.\n"
> > > > +       "  --resolution <mode>   Control of taking default DRM
> > > > display mode for subtests\n"
> > > > +       "                        instead of taking the preferred
> > > > mode exposed by the Kernel.\n"
> > > > +       "                        Possible options:\n"
> > > > +       "                         default  - Use preferred mode.
> > > > (default)\n"
> > > > +       "                         highest  - Use the mode with
> > > > highest possible resolution.\n"
> > > > +       "                         lowest   - Use the mode with
> > > > lowest possible resolution.\n"
> > > >         "  -b, --blacklist FILENAME\n"
> > > >         "                        Exclude all test matching to
> > > > regexes from FILENAME\n"
> > > >         "                        (can be used more than once)\n"
> > > > @@ -532,6 +569,7 @@ bool parse_options(int argc, char **argv,
> > > >                 {"dmesg-warn-level", required_argument, NULL,
> > > > OPT_DMESG_WARN_LEVEL},
> > > >                 {"prune-mode", required_argument, NULL,
> > > > OPT_PRUNE_MODE},
> > > >                 {"blacklist", required_argument, NULL,
> > > > OPT_BLACKLIST},
> > > > +               {"resolution", optional_argument, NULL,
> > > > OPT_RESOLUTION},
> > > >                 {"list-all", no_argument, NULL, OPT_LIST_ALL},
> > > >                 { 0, 0, 0, 0},
> > > >         };
> > > > @@ -640,6 +678,12 @@ bool parse_options(int argc, char **argv,
> > > >
> > > > absolute_path(optarg)))
> > > >                                 goto error;
> > > >                         break;
> > > > +               case OPT_RESOLUTION:
> > > > +                       if (!set_resolution_mode(settings,
> > > > optarg)) {
> > > > +                               usage("Cannot parse resolution
> > > > mode", stderr);
> > > > +                               goto error;
> > > > +                       }
> > > > +                       break;
> > >
> > > If you only set the env var here, it won't be set on resumes.
> > >
> > > >                 case OPT_LIST_ALL:
> > > >                         settings->list_all = true;
> > > >                         break;
> > > > @@ -854,6 +898,7 @@ bool serialize_settings(struct settings
> > > > *settings)
> > > >         SERIALIZE_LINE(f, settings, piglit_style_dmesg, "%d");
> > > >         SERIALIZE_LINE(f, settings, dmesg_warn_level, "%d");
> > > >         SERIALIZE_LINE(f, settings, prune_mode, "%d");
> > > > +       SERIALIZE_LINE(f, settings, resolution, "%d");
> > > >         SERIALIZE_LINE(f, settings, test_root, "%s");
> > > >         SERIALIZE_LINE(f, settings, results_path, "%s");
> > > >         SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
> > > > @@ -886,6 +931,7 @@ bool read_settings_from_file(struct settings
> > > > *settings, FILE *f)
> > > >         char *name = NULL, *val = NULL;
> > > >
> > > >         settings->dmesg_warn_level = -1;
> > > > +       settings->resolution = 0;
> > >
> > > If a zero val is the default, you don't need to set it here
> > > explicitly. Anything calling this function has called init_settings
> > > which memsets the whole object to 0.
> > >
> > >
> > >
> > > I'll look into this in more detail next week. I need to form an
> > > actual
> > > opinion on a few subjects, such as whether this is needed in runner
> > > at
> > > all (one can set environment variables when executing and let
> > > runner
> > > just pass them through, it doesn't clean the environment), whether
> > > --resolution is a good name for the switch, and whether I want a
> > > more
> > > generic environment storing/handling in the runner instead now or
> > > later.
> >
> > Alright, my opinion is that it's better to have a generic --env flag
> > on igt_runner instead. It's useful to have the support for making
> > sure
> > other env vars also get correctly set on resumes, notably IGT_DEVICE.
> >
> > In short, we need --environment=key=value, and also --environment=key
> > (gets the var from the current environment, stores the
> > value). Repeated flags store more values.
> >
> > If you don't have the bandwidth to work on that change yourself, I
> > suppose Ryszard might be able to pick this up. Ryszard, what do you
> > think?
> >
> >
> 
> Yeah, I can take this. The runner should not touch the
> IGT_KMS_RESOLUTION var at all in that case, rather have that handled in
> the test process, and any vars marked via --environment will get saved
> for resumes.
> 
> Just one question, if the var is not set in the environment and the
> flag gets set to just the name, should the runner error out, or just
> set an empty var?

I say error out. It's most probably a user mistake.


-- 
Petri Latvala
