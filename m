Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B4E10E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 19:39:57 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id 125so5134717vsx.7
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 12:39:57 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50]) by smtp.gmail.com with ESMTPSA id
 p21-20020a67f415000000b0034c00d40507sm610581vsn.3.2022.07.15.12.39.56
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 12:39:56 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id w188so4984877vsb.6
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 12:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220715191539.1780049-1-markyacoub@chromium.org>
In-Reply-To: <20220715191539.1780049-1-markyacoub@chromium.org>
From: Alexandru M Stan <amstan@chromium.org>
Date: Fri, 15 Jul 2022 15:39:15 -0400
Message-ID: <CAHNYxRxGPveoOziHd_OReKJSog=fLKqMLjzPYn4L5LvAkY8wiA@mail.gmail.com>
To: Mark Yacoub <markyacoub@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] lib/igt_chamelium: Only plug in the ports
 configured in the config file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com,
 Ilja Friedel <ihf@google.com>, igt-dev@lists.freedesktop.org,
 seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 15, 2022 at 3:15 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> [Why]
> Some Chamelium setups do not have all ports connected.
> On current Chamelium V3, the hardware is limited to only plug in 1 port
> at time. [hardware bug is to be fixed]

The background for that is if you want to use the ITE path (which is
the only supported way right now). There exists only one ITE chip on a
v3, with all 4 ports having some muxing to it. Obviously then only one
port can be connected.
There's another video path where the FPGA could decode the video
directly without the ITE's help. In that case multiple ports could
work at the same time. This path has not been implemented yet.

I wouldn't consider this a hardware bug or that it will ever be fixed
(eg: if you want to use HDCP you'll be forced to use the ITE path for
that one test therefore you'll always have this limitation).

> When all prompted to be connected, plugging any port will unplug
> everything before it, which is not what we want.
>
> [How]
> Iterate over the ~/.igtrc config file and only plug the ports there.
> This guarantees that each setup is in control of what makes the most
> sense for it.
>
> Test: ./kms_chamelium --run-subtest dp-hp
> Tested on: Volteer & cv3
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/igt_chamelium.c | 30 ++++++++++++++++++++----------
>  lib/igt_chamelium.h |  2 +-
>  lib/igt_kms.c       |  2 +-
>  3 files changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 55cbfa12..c7b99ebc 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2830,25 +2830,35 @@ void chamelium_deinit(struct chamelium *chamelium)
>         chamelium_deinit_rpc_only(chamelium);
>  }
>
> -bool chamelium_plug_all(struct chamelium *chamelium)
> +bool chamelium_plug_all_connected(struct chamelium* chamelium)
>  {
> -       size_t port_count;
> -       int port_ids[CHAMELIUM_MAX_PORTS];
> -       xmlrpc_value *v;
> +       /* Iterate over all ports in the config file and plug them all. */
> +       char** group_list = g_key_file_get_groups(igt_key_file, NULL);
> +       int i;
> +
> +       for (i = 0; group_list[i] != NULL; i++) {
> +               int port_id;
> +               GError* error = NULL;
> +               xmlrpc_value* v;
> +               char* group = group_list[i];
> +
> +
> +               if (!strstr(group, "Chamelium:"))
> +                       continue;
> +
> +               port_id = g_key_file_get_integer(igt_key_file, group,
> +                       "ChameliumPortID",
> +                       &error);
>
> -       port_count = chamelium_get_video_ports(chamelium, port_ids);
> -       if (port_count <= 0)
> -               return false;
>
> -       for (int i = 0; i < port_count; ++i) {
> -               v = __chamelium_rpc(chamelium, NULL, "Plug", "(i)", port_ids[i]);
> +               v = __chamelium_rpc(chamelium, NULL, "Plug", "(i)", port_id);
>
>                 if (v != NULL)
>                         xmlrpc_DECREF(v);
>
>                 if (chamelium->env.fault_occurred) {
>                         igt_debug("Chamelium RPC call failed: %s\n",
> -                            chamelium->env.fault_string);
> +                               chamelium->env.fault_string);
>
>                         return false;
>                 }
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index f40e848e..78985469 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -244,7 +244,7 @@ void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump, int width,
>  void chamelium_destroy_frame_dump(struct chamelium_frame_dump *dump);
>  void chamelium_destroy_audio_file(struct chamelium_audio_file *audio_file);
>  void chamelium_infoframe_destroy(struct chamelium_infoframe *infoframe);
> -bool chamelium_plug_all(struct chamelium *chamelium);
> +bool chamelium_plug_all_connected(struct chamelium *chamelium);
>  bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
>                                                    int drm_fd);
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d8867f09..81eb1881 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2349,7 +2349,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>                 if (chamelium) {
>                         igt_abort_on_f(!chamelium_wait_reachable(chamelium, 20),
>                                        "cannot reach the configured chamelium!\n");
> -                       igt_abort_on_f(!chamelium_plug_all(chamelium),
> +                       igt_abort_on_f(!chamelium_plug_all_connected(chamelium),
>                                        "failed to plug all the chamelium ports!\n");
>                         igt_abort_on_f(!chamelium_wait_all_configured_ports_connected(chamelium, drm_fd),
>                                        "not all configured chamelium ports are connected!\n");
> --
> 2.37.0.170.g444d1eabd0-goog
>

This seems prudent, SGTM your "How?" and implementation, just not "Why?".

Alexandru Stan (amstan)
