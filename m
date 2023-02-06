Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD83310E42D
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 18:01:49 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p26so36471497ejx.13
 for <igt-dev@lists.freedesktop.org>; Mon, 06 Feb 2023 10:01:49 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 o13-20020a17090611cd00b0088bd62b1cbbsm5713158eja.192.2023.02.06.10.01.45
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:01:45 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso11404455wms.0
 for <igt-dev@lists.freedesktop.org>; Mon, 06 Feb 2023 10:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20230202180139.3528829-1-markyacoub@google.com>
 <20230203165748.250937-1-markyacoub@google.com>
 <20230206171844.cxzvw5x36fdietko@kamilkon-desk1>
In-Reply-To: <20230206171844.cxzvw5x36fdietko@kamilkon-desk1>
From: Alexandru M Stan <amstan@chromium.org>
Date: Mon, 6 Feb 2023 10:01:06 -0800
Message-ID: <CAHNYxRyU55qzm6PJ5Op3NSaOmN9CDZ-c7eNTBQmdWAnPRnbwCQ@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mark Yacoub <markyacoub@chromium.org>, adrinael@adrinael.net,
 bhanuprakash.modem@intel.com, khaled.almahallawy@intel.com,
 seanpaul@chromium.org, markyacoub@google.com, ihf@google.com,
 amstan@chromium.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH v4] Chamelium: Get Chamelium Logs on RPC
 failure
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

On Mon, Feb 6, 2023 at 9:18 AM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Mark,
>
> On 2023-02-03 at 11:57:48 -0500, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@chromium.org>
> >
> > [Why]
> > Currently, Chamelium acts like a black box, we can't tell what
> > is going on there when a failure occur. Seeing its logs will
> > allow us to debug better.
> >
> > [How]
> > On chamelium_rpc failure, print out the logs in debug so it
> > wouldn't clutter good tests.
> >
> > v2:
> > - Added missing #includes
> > v3:
> > - C-style comments (Kamil Konieczny)
> > - Cut commit messages to 65 char tops (Kamil Konieczny)
> > v4:
> > - Don't get the logs if it's not a cv3 (Petri)
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  lib/igt_chamelium.c                    | 73 ++++++++++++++++++++++++--
> >  lib/igt_chamelium.h                    |  1 +
> >  tests/chamelium/kms_chamelium_helper.c | 18 +++++++
> >  3 files changed, 89 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > index a235f3c8..5cdff70f 100644
> > --- a/lib/igt_chamelium.c
> > +++ b/lib/igt_chamelium.c
> > @@ -129,6 +129,8 @@ struct chamelium {
> >       struct igt_list_head edids;
> >       struct chamelium_port ports[CHAMELIUM_MAX_PORTS];
> >       int port_count;
> > +     // Chamelium V3 requires some work arounds and has some extra functionalities. This keeps things safe.
> > +     bool is_cv3;
> >  };
> >
> >  bool igt_chamelium_allow_fsm_handling = true;
> > @@ -447,6 +449,9 @@ chamelium_wait_for_conn_status_change(igt_display_t *display,
> >               usleep(50000);
> >       }
> >
> > +     /* If we timeout, it means Chamelium didn't respond on time. Print its logs*/
> > +     igt_debug("Timeout. Chamelium logs:\n%s\n", chamelium_get_logs(chamelium));
> > +
> >       igt_assert_f(false, "Timed out waiting for %s to get %s\n",
> >                                chamelium_port_get_name(port),
> >                                kmstest_connector_status_str(status));
> > @@ -658,6 +663,8 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
> >       xmlrpc_value *res;
> >       va_list va_args;
> >       int fsm_trials_left = 5;
> > +     bool did_fault_occur = false;
> > +     char fault_string[1024];
> >
> >       if (strcmp(method_name, "CaptureVideo") == 0
> >           || strcmp(method_name, "StartCapturingVideo") == 0) {
> > @@ -680,9 +687,35 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
> >                                        format_str, va_args);
> >               va_end(va_args);
> >       }
> > -     igt_assert_f(!chamelium->env.fault_occurred,
> > -                  "Chamelium RPC call[%s] failed: %s\n", method_name,
> > -                  chamelium->env.fault_string);
> > +
> > +     did_fault_occur = chamelium->env.fault_occurred;
> > +     if (did_fault_occur) {
> > +             /*
> > +              * Save the fault string before getting the logs which will
> > +              * clear the string if it is works.
> > +              */
> > +             strncpy(fault_string, chamelium->env.fault_string, 1024);
> > +
> > +             if (strcmp(method_name, "GetChameleondLogs") == 0) {
> > +                     did_fault_occur = false;
> > +                     igt_debug("Failed to get chamelium logs: %s\n", fault_string);
> > +                     igt_debug("Sometimes this happens at the beginning of the test when the logs haven't "
> > +                     "been cleared for a while and the XMLRPC lib can't consume it all. "
> > +                     "Regardless, we shouldn't fail on failing to get the logs.\n");
> > +             /*
> > +              * We call GetChameleondLogs on an xmlrpc failure. Let's not
> > +              * call it when the xmlrpc failure is for GetChameleondLogs
> > +              * itself as this can cause a recursive behavior.
> > +              */
>
> This comment should be after if (strcmp...), please also align it.
>
> > +             } else {
> > +                     char *logs = chamelium_get_logs(chamelium);
> > +                     igt_debug("CHAMELIUM LOGS:\n%s\n", logs);
> > +                     free(logs);
> > +             }
> > +     }
> > +
> > +     igt_assert_f(!did_fault_occur, "Chamelium RPC call [%s] failed: %s\n",
> > +                  method_name, fault_string);
> >
> >       return res;
> >  }
> > @@ -737,6 +770,34 @@ void chamelium_assert_reachable(struct chamelium *chamelium, int timeout)
> >                    "Couldn't connect to Chamelium for %ds", timeout);
> >  }
> >
> > +/**
> > + * chamelium_get_logs - Get the logs from the chamelium daemon
> > + * @chamelium: The Chamelium instance to use
> > + *
> > + * Returns: The logs from the last time this was called.
> > + */
> > +
> > +const char *chamelium_get_logs(struct chamelium *chamelium)
> > +{
> > +     xmlrpc_value *res;
> > +     const char *logs = NULL;
> > +
> > +     if (!chamelium->is_cv3) {
> > +             igt_debug("Chamelium is not a Cv3, not calling GetChameleondLogs\n");
> > +             return NULL;
> > +     }
> > +
> > +     igt_debug(
> > +             "Calling GetChameleondLogs - Logs returned are from the last time "
>
> Please move this to above line, so
>         igt_debug("Your message ..."
>                   " continued\n");
>
>
> > +             "this was called.\n");
> > +
> > +     res = chamelium_rpc(chamelium, NULL, "GetChameleondLogs", "(s)", "IGT");
> > +     xmlrpc_read_string(&chamelium->env, res, &logs);
> > +     xmlrpc_DECREF(res);
> > +
> > +     return logs;
> > +}
> > +
> >  /**
> >   * chamelium_plug:
> >   * @chamelium: The Chamelium instance to use
> > @@ -2890,6 +2951,7 @@ struct chamelium *chamelium_init(int drm_fd, igt_display_t *display)
> >  {
> >       struct chamelium *chamelium = chamelium_init_rpc_only();
> >       bool mismatching_ports_found = false;
> > +     int port_ids[CHAMELIUM_MAX_PORTS];
> >
> >       if (chamelium == NULL)
> >               return NULL;
> > @@ -2958,6 +3020,11 @@ struct chamelium *chamelium_init(int drm_fd, igt_display_t *display)
> >        * the outputs to grab all supported connectors.*/
> >       igt_display_reset_outputs(display);
> >
> > +     if (chamelium_get_video_ports(chamelium, port_ids) <= 0)
> > +             goto error;
> > +     // Chamelium V3 port IDs start with 0, while V2 port IDs start with 1.
> ------- ^
> Please use C-style comment /* Your comment here */.
>
> > +     chamelium->is_cv3 = port_ids[0] == 0;
>
> How is start number of video port related to rpc daemon ?

On v3 the ports in chameleond start at 0. Mark's trying to use that
implementation detail as a heuristic to know which chameleon version
it is. I do not like it, see my other reply.

Alexandru Stan (amstan)
