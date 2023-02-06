Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708D310E438
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 18:16:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id l14so2654227eds.4
 for <igt-dev@lists.freedesktop.org>; Mon, 06 Feb 2023 10:16:47 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 p10-20020aa7cc8a000000b004a21c620266sm5440206edt.83.2023.02.06.10.16.43
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:16:43 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ba1so7172141wrb.5
 for <igt-dev@lists.freedesktop.org>; Mon, 06 Feb 2023 10:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20230202180139.3528829-1-markyacoub@google.com>
 <20230203165748.250937-1-markyacoub@google.com>
In-Reply-To: <20230203165748.250937-1-markyacoub@google.com>
From: Alexandru M Stan <amstan@chromium.org>
Date: Mon, 6 Feb 2023 10:16:04 -0800
Message-ID: <CAHNYxRw1b5yZ5ZtBU08fmzuD1RykoZX+GAA0mk+7LL=X+gCAFQ@mail.gmail.com>
To: Mark Yacoub <markyacoub@chromium.org>
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
Cc: ihf@google.com, igt-dev@lists.freedesktop.org, seanpaul@chromium.org,
 markyacoub@google.com, khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 3, 2023 at 8:57 AM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@chromium.org>
>
> [Why]
> Currently, Chamelium acts like a black box, we can't tell what
> is going on there when a failure occur. Seeing its logs will
> allow us to debug better.
>
> [How]
> On chamelium_rpc failure, print out the logs in debug so it
> wouldn't clutter good tests.
>
> v2:
> - Added missing #includes
> v3:
> - C-style comments (Kamil Konieczny)
> - Cut commit messages to 65 char tops (Kamil Konieczny)
> v4:
> - Don't get the logs if it's not a cv3 (Petri)
No, logs getting should have nothing to do if it's a cv3 or not.

There's no reason why cv2 can't get this API too.

>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/igt_chamelium.c                    | 73 ++++++++++++++++++++++++--
>  lib/igt_chamelium.h                    |  1 +
>  tests/chamelium/kms_chamelium_helper.c | 18 +++++++
>  3 files changed, 89 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index a235f3c8..5cdff70f 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -129,6 +129,8 @@ struct chamelium {
>         struct igt_list_head edids;
>         struct chamelium_port ports[CHAMELIUM_MAX_PORTS];
>         int port_count;
> +       // Chamelium V3 requires some work arounds and has some extra functionalities. This keeps things safe.
> +       bool is_cv3;
>  };
>
>  bool igt_chamelium_allow_fsm_handling = true;
> @@ -447,6 +449,9 @@ chamelium_wait_for_conn_status_change(igt_display_t *display,
>                 usleep(50000);
>         }
>
> +       /* If we timeout, it means Chamelium didn't respond on time. Print its logs*/
> +       igt_debug("Timeout. Chamelium logs:\n%s\n", chamelium_get_logs(chamelium));
> +
>         igt_assert_f(false, "Timed out waiting for %s to get %s\n",
>                                  chamelium_port_get_name(port),
>                                  kmstest_connector_status_str(status));
> @@ -658,6 +663,8 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
>         xmlrpc_value *res;
>         va_list va_args;
>         int fsm_trials_left = 5;
> +       bool did_fault_occur = false;
> +       char fault_string[1024];
>
>         if (strcmp(method_name, "CaptureVideo") == 0
>             || strcmp(method_name, "StartCapturingVideo") == 0) {
> @@ -680,9 +687,35 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
>                                          format_str, va_args);
>                 va_end(va_args);
>         }
> -       igt_assert_f(!chamelium->env.fault_occurred,
> -                    "Chamelium RPC call[%s] failed: %s\n", method_name,
> -                    chamelium->env.fault_string);
> +
> +       did_fault_occur = chamelium->env.fault_occurred;
> +       if (did_fault_occur) {
Please gather logs for every test invocation regardless of if
fault_occured. I have seen some recent tests happily claiming that
things passed ;) but that was not the case. It's still useful to have
logs for debugging when that happens. It's also useful to see what a
normal invocation of the test looks like.

> +               /*
> +                * Save the fault string before getting the logs which will
> +                * clear the string if it is works.
> +                */
> +               strncpy(fault_string, chamelium->env.fault_string, 1024);
> +
> +               if (strcmp(method_name, "GetChameleondLogs") == 0) {
> +                       did_fault_occur = false;
> +                       igt_debug("Failed to get chamelium logs: %s\n", fault_string);
> +                       igt_debug("Sometimes this happens at the beginning of the test when the logs haven't "
> +                       "been cleared for a while and the XMLRPC lib can't consume it all. "
> +                       "Regardless, we shouldn't fail on failing to get the logs.\n");
> +               /*
> +                * We call GetChameleondLogs on an xmlrpc failure. Let's not
> +                * call it when the xmlrpc failure is for GetChameleondLogs
> +                * itself as this can cause a recursive behavior.
> +                */
> +               } else {
> +                       char *logs = chamelium_get_logs(chamelium);
> +                       igt_debug("CHAMELIUM LOGS:\n%s\n", logs);
> +                       free(logs);
> +               }
> +       }
> +
> +       igt_assert_f(!did_fault_occur, "Chamelium RPC call [%s] failed: %s\n",
> +                    method_name, fault_string);
>
>         return res;
>  }
> @@ -737,6 +770,34 @@ void chamelium_assert_reachable(struct chamelium *chamelium, int timeout)
>                      "Couldn't connect to Chamelium for %ds", timeout);
>  }
>
> +/**
> + * chamelium_get_logs - Get the logs from the chamelium daemon
> + * @chamelium: The Chamelium instance to use
> + *
> + * Returns: The logs from the last time this was called.
> + */
> +
> +const char *chamelium_get_logs(struct chamelium *chamelium)
> +{
> +       xmlrpc_value *res;
> +       const char *logs = NULL;
> +
> +       if (!chamelium->is_cv3) {
Please just call GetChameleondLogs all the time, if you get the
obvious NotImplementedError, you just return, recording the error
somewhere.

> +               igt_debug("Chamelium is not a Cv3, not calling GetChameleondLogs\n");
> +               return NULL;
> +       }
> +
> +       igt_debug(
> +               "Calling GetChameleondLogs - Logs returned are from the last time "
> +               "this was called.\n");
> +
> +       res = chamelium_rpc(chamelium, NULL, "GetChameleondLogs", "(s)", "IGT");
> +       xmlrpc_read_string(&chamelium->env, res, &logs);
> +       xmlrpc_DECREF(res);
> +
> +       return logs;
> +}
> +
>  /**
>   * chamelium_plug:
>   * @chamelium: The Chamelium instance to use
> @@ -2890,6 +2951,7 @@ struct chamelium *chamelium_init(int drm_fd, igt_display_t *display)
>  {
>         struct chamelium *chamelium = chamelium_init_rpc_only();
>         bool mismatching_ports_found = false;
> +       int port_ids[CHAMELIUM_MAX_PORTS];
>
>         if (chamelium == NULL)
>                 return NULL;
> @@ -2958,6 +3020,11 @@ struct chamelium *chamelium_init(int drm_fd, igt_display_t *display)
>          * the outputs to grab all supported connectors.*/
>         igt_display_reset_outputs(display);
>
> +       if (chamelium_get_video_ports(chamelium, port_ids) <= 0)
> +               goto error;
> +       // Chamelium V3 port IDs start with 0, while V2 port IDs start with 1.
Please don't, there should be absolutely no reason that you need to
keep track of this, and even if you did, some random implementation
difference is not the proper way to do this.

Prefer feature detection. Same spirit as
https://developer.mozilla.org/en-US/docs/Web/HTTP/Browser_detection_using_the_user_agent

> +       chamelium->is_cv3 = port_ids[0] == 0;
> +
>         return chamelium;
>  error:
>         close(chamelium->drm_fd);
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index d979de4a..159c75ec 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -159,6 +159,7 @@ chamelium_reset_state(igt_display_t *display,
>
>  bool chamelium_wait_reachable(struct chamelium *chamelium, int timeout);
>  void chamelium_assert_reachable(struct chamelium *chamelium, int timeout);
> +const char *chamelium_get_logs(struct chamelium *chamelium);
>  void chamelium_plug(struct chamelium *chamelium, struct chamelium_port *port);
>  void chamelium_unplug(struct chamelium *chamelium, struct chamelium_port *port);
>  bool chamelium_is_plugged(struct chamelium *chamelium,
> diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms_chamelium_helper.c
> index 197d29be..54f8ebfc 100644
> --- a/tests/chamelium/kms_chamelium_helper.c
> +++ b/tests/chamelium/kms_chamelium_helper.c
> @@ -24,7 +24,19 @@
>   *    Lyude Paul <lyude@redhat.com>
>   */
>
> +#include <fcntl.h>
> +#include <stdint.h>
> +#include <string.h>
> +#include <stdatomic.h>
> +#include <xf86drmMode.h>
> +
> +#include "config.h"
> +#include "igt.h"
> +#include "igt_chamelium.h"
>  #include "igt_edid.h"
> +#include "igt_eld.h"
> +#include "igt_vc4.h"
> +#include "igt_infoframe.h"
>  #include "kms_chamelium_helper.h"
>
>  void chamelium_init_test(chamelium_data_t *data)
> @@ -47,6 +59,12 @@ void chamelium_init_test(chamelium_data_t *data)
>         /* we need to initalize chamelium after igt_display_require */
>         data->chamelium = chamelium_init(data->drm_fd, &data->display);
>         igt_require(data->chamelium);
> +       /*
> +        * Get the logs so we can reset the chamelium logs at this cursor.
> +        * The logs are then retrieved when any call fails so we can debug
> +        * chamelium if needed.
> +        */
> +       free(chamelium_get_logs(data->chamelium));
>
>         data->ports = chamelium_get_ports(data->chamelium, &data->port_count);
>
> --
> 2.39.1.519.gcb327c4b5f-goog
>

NAK from me (chameleond author for v3), needs more polishing and doing
things the right way.

Alexandru Stan (amstan)
