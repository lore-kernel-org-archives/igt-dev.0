Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536ACC531F9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 14:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABB910E630;
	Fri, 24 Jul 2026 14:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lB9XJtNl";
	dkim-atps=neutral
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C1610E055
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 14:06:22 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-526f963372aso3866231cf.1
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 07:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784901981; cv=none;
 d=google.com; s=arc-20260327;
 b=qbDjbyRhmJuqC2M1XQhPdPv//lCib606GAqmeN+JM4vQXN6i1poR2iBYTeoQ6+d748
 vqJWkVlsJ89vn0tU3PU4qQJLpNtt3t5LA6iiN+ShtX/e8XQJZMuyUiJa0vyCOfkt/Svk
 ymHqa7ev2qlgvPfKWU+7KqYvcN3ucn5lzwcpi6+pkp+BMNIkdmRy06WZruVOqra9nAtK
 mKfVkJafB+0MQV3TzwADKWvi25pO3m2D7Ghk43F9uCcVtcnJvh3o3FPNA+O2wsCx7JK9
 h6vVTJE6dYP8I25pOQBZCQwxHqkV+0cSacb4Zo0wX/r3wCo/BudgZHRyxrDkblNGqAo5
 OKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=uGRwfX9PNq9DoQM8oH6N3m8DYNENp4Mk0pkxyvIK814=;
 fh=H5+q/5ko+pecMG4ag2YgRVFDwQ5EG3qTB9qvjBNSc2k=;
 b=ZofHScbhYYL0P9nKvaGUGzu/ubikdC1QGzpv9UIhWSYQu+mRXmwdd8Xr2zqiclDATc
 0jTJEsxjqt151M9LA1PwpuKftjtWjzH8ShCbFYYyAOzMqk87WPj4VSA6QvFUl5FyyCbO
 /ccW/Vf9fduftAsK7txC7j1DPJXcgLcssdmMi+Rwc99ksA/p1dXJq2FzlDq8AxWdw3Fn
 CgrzloQbOuxMb4TGg+3QVO+HQ9uKbxuX/hBvUitYKKxcYc6EmxYxXRo8+VXKgrHadyaQ
 dBUF+Mh4lY2atXEO1cBoeav6sWyKpg1+jrLjnMhNY1yGJCnmaV6ZBWGLCRfVHwVduw09
 4DFQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784901981; x=1785506781;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=uGRwfX9PNq9DoQM8oH6N3m8DYNENp4Mk0pkxyvIK814=;
 b=lB9XJtNlZBApNkqjPwgiohRXABHPwutLBzyUEvLjls9+/l43fFHsQ2zLiUTrjf3pzL
 vXq3gN9s0E4qgmexbJuRbF0UKMRyMYBqpCMi7EABjPZ8iEkAsMnwLQ6apitdlHlL9KXS
 ifrlPmKexI7FeN51yz5Z4eJHLK7ixYXIySZuH2bWMRFT1k6LG3pS/bpdfEtsVibaOYkS
 ptfKUr8EPAcvY+Ei78gtFkYRniwBoYYTF30xRWW6axPxChVPRVn6SJlU6ol9oqKLPu5D
 XG6uaC5Pciwybh7Mj3AurteVdYV2dm6W2TsTKVWkKfKdclC5Kjbwkiz+fdcmfpI8i8HA
 yQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784901981; x=1785506781;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=uGRwfX9PNq9DoQM8oH6N3m8DYNENp4Mk0pkxyvIK814=;
 b=rW6vK452XKboKEEZGcJCQXvHOaZIPyQ+tmL9nfelP2aoMlBzYngZ8Efyc+N2nGB8bM
 +6sZmPVUKbB49y28vleFbQrMdrQZYTxYWDDIGOzGJw+QZ2buoRw2qdT0eUxHrdDGmZ3+
 e54X76tPjfqwdYdi3e4S8ui9MnfluRg3u3oFcgK+1VdpDQz6Nf/ZGxhyHz8392jyzjk/
 c7SYTX4ytxzw4nM4/BDVTQ1Gjj42KdDwJmqaYX8wlnRJiDJR6cflDsIv1P5p/jpHvwnq
 pR1swaWl3Ve8P3V+NjyU+6+0D39enKk2tFyC+NQ441M2iVovQin3tnvMX04yIBYryTbQ
 LLrw==
X-Gm-Message-State: AOJu0YwHG7kY/lG9sNI19r8asFnn6AM0UuHJui7tlsv04YL9kiHyS0wZ
 CsbXoVneNOgKuPsSlr7Sr25tvpPckhT8NAZw3zLwr31JWu6j5oZt4y3DQDBjCQZm4FH+yos4e9M
 vAtgW9WaWVl/74Qbv6DIKZb0nK3TiE+Y9yWnvSUh1PMQEQcQkWhEjd5BQ
X-Gm-Gg: AR+sD13GxaLcYREl4/dhhbH3EMVimxandoMnJ1XZobFdmg813kkYEKem+F/UdmoxoQj
 D436YVoSDQpaH9gGQGOv+I11eDkqgrxXXW/c0OzkQfV3SyM2qrJwfJQI9j78L6hPI1GiHhyKEMg
 C+3NwzYWCbnRTXC8V28PREzYAb8A6NiqlmAZnr15qMcmVzUvUInDKbx6n9TUrfXXex6qo4MIAf2
 zA6b5i3lla6EoUS1pnalfmS58p9ZQewrdKA9tdM42sh5MVBZ7Z32/bdPATAGvdai8z+Yf/sJuNf
 /N0+mE1+JsL98w==
X-Received: by 2002:ac8:590d:0:b0:51a:8c97:9389 with SMTP id
 d75a77b69052e-5283df63137mr75665061cf.64.1784901979504; Fri, 24 Jul 2026
 07:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260715192949.1984280-3-markyacoub@google.com>
 <20260720205355.321557-1-markyacoub@google.com>
In-Reply-To: <20260720205355.321557-1-markyacoub@google.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Fri, 24 Jul 2026 10:06:07 -0400
X-Gm-Features: AUfX_mxp8qC9zLsGVqz8rXQSwGyffX7_Ob9oOzv8MXtJt_UDUkCbi9iaVG1yUQc
Message-ID: <CAC0gqY66Dzdic9QcBYdi=+8hiGhaSwWpymjJBScS6G32mA0Qqg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/unigraf: Enhance link rate support checking and
 hardware retrain timing
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com
Content-Type: multipart/alternative; boundary="00000000000074920306575be065"
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--00000000000074920306575be065
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello, friendly ping on this

On Mon, Jul 20, 2026 at 4:53=E2=80=AFPM Mark Yacoub <markyacoub@google.com>=
 wrote:

> Refactor hardware capability checks to natively skip unsupported DP link
> parameters dynamically, moving validation cleanly into the core igt_dp
> abstraction layer robustly.
>
> v2:
>  - Downgrade `igt_assert_f` checks across the `igt_dp` layer to
> `igt_require_f` (Louis)
>  - Extract link rate querying into generic `igt_dp_is_link_rate_supported=
`
> helper (Louis)
>  - Add `expected_new_connector_count` to `kms_wait_for_new_connectors` to
> fix discovery race conditions natively (Louis)
>
> TAG=3Dagy
> CONV=3D35e8e1e4-2dfd-4bf2-8c0b-c9bbc6268d92
> ---
>  lib/igt_dp.c                         | 50 ++++++++++++++++++++++++++--
>  lib/igt_dp.h                         |  1 +
>  lib/igt_kms.c                        | 15 ++++++---
>  lib/igt_kms.h                        |  4 ++-
>  lib/vendor/unigraf/unigraf.c         |  1 +
>  tests/unigraf/unigraf_connectivity.c | 19 +++++++++--
>  tests/unigraf/unigraf_lt.c           | 31 +++++++++++++----
>  7 files changed, 104 insertions(+), 17 deletions(-)
>
> diff --git a/lib/igt_dp.c b/lib/igt_dp.c
> index 9f71c9e72..20af6a967 100644
> --- a/lib/igt_dp.c
> +++ b/lib/igt_dp.c
> @@ -107,7 +107,7 @@ int igt_dp_get_max_lane_count(int drm_fd, igt_output_=
t
> *output)
>         if (is_intel_device(drm_fd))
>                 return i915_dp_get_max_lane_count(drm_fd, output);
>
> -       igt_assert_f(false, "Current drm device is not able to report max
> lane count\n");
> +       igt_require_f(false, "Current drm device is not able to report ma=
x
> lane count\n");
>         return -EINVAL;
>  }
>
> @@ -124,7 +124,51 @@ void igt_dp_force_link_retrain(int drm_fd,
> igt_output_t *output, int retrain_cou
>                 return;
>         }
>
> -       igt_assert_f(false, "Current drm device does not support link
> retraining\n");
> +       igt_require_f(false, "Current drm device does not support link
> retraining\n");
> +}
> +
> +/**
> + * igt_dp_is_link_rate_supported: Tests if the specific link rate can be
> forced
> + * @drm_fd:            DRM file descriptor
> + * @output:            igt_output_t object representing the display port
> + * @rate_kb:           Link rate in kbps to test
> + *
> + * Returns: true if device supports enforcing this rate, false otherwise
> + */
> +bool igt_dp_is_link_rate_supported(int drm_fd, igt_output_t *output, int
> rate_kb)
> +{
> +       if (is_intel_device(drm_fd)) {
> +               char buf[512];
> +               int res;
> +               char *token;
> +               int rate_tens =3D rate_kb / 10;
> +
> +               res =3D igt_debugfs_read_connector_file(drm_fd,
> igt_output_name(output),
> +
>  "i915_dp_force_link_rate",
> +                                                     buf, sizeof(buf));
> +               if (res < 0)
> +                       return false;
> +
> +               token =3D strtok(buf, " \n\t,:");
> +               while (token) {
> +                       int rate;
> +                       char *endptr;
> +
> +                       errno =3D 0;
> +                       rate =3D strtol(token, &endptr, 0);
> +                       /*
> +                        * Robustly verify that a number was actually
> parsed (endptr !=3D token)
> +                        * allowing us to safely ignore formatting header=
s
> (e.g. "Rates:")
> +                        */
> +                       if (!errno && endptr !=3D token && rate =3D=3D ra=
te_tens)
> +                               return true;
> +                       token =3D strtok(NULL, " \n\t,:");
> +               }
> +
> +               return false;
> +       }
> +
> +       return igt_dp_get_max_supported_rate(drm_fd, output) >=3D rate_kb=
;
>  }
>
>  /**
> @@ -140,7 +184,7 @@ int igt_dp_get_pending_retrain(int drm_fd,
> igt_output_t *output)
>         if (is_intel_device(drm_fd))
>                 return i915_dp_get_pending_retrain(drm_fd, output);
>
> -       igt_assert_f(false, "Current drm device does not support pending
> retrain count checking\n");
> +       igt_require_f(false, "Current drm device does not support pending
> retrain count checking\n");
>         return -EINVAL;
>  }
>
> diff --git a/lib/igt_dp.h b/lib/igt_dp.h
> index 0c56ad2ec..e5cacad66 100644
> --- a/lib/igt_dp.h
> +++ b/lib/igt_dp.h
> @@ -22,6 +22,7 @@ int igt_dp_get_max_supported_rate(int drm_fd,
> igt_output_t *output);
>  int igt_dp_get_max_lane_count(int drm_fd, igt_output_t *output);
>
>  void igt_dp_force_link_retrain(int drm_fd, igt_output_t *output, int
> retrain_count);
> +bool igt_dp_is_link_rate_supported(int drm_fd, igt_output_t *output, int
> rate_kb);
>
>  int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2eefb773b..041a3356b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8255,10 +8255,17 @@ get_array_diff(const uint32_t *array_a, int
> array_a_len, const uint32_t *array_b
>   */
>  int kms_wait_for_new_connectors(uint32_t **newly_connected,
>                                 const uint32_t *already_connected,
> -                               int already_connected_count, int drm_fd)
> +                               int already_connected_count,
> +                               int expected_new_connector_count,
> +                               int drm_fd)
>  {
>         int newly_connected_count;
>         struct timespec start, end;
> +       int timeout =3D igt_default_display_detect_timeout();
> +
> +       /* MST discovery may be serialized in the kernel; allocate extra
> time for topology settling */
> +       if (expected_new_connector_count > 1)
> +               timeout *=3D 2;
>
>         igt_assert(newly_connected);
>         igt_assert_fd(drm_fd);
> @@ -8269,10 +8276,10 @@ int kms_wait_for_new_connectors(uint32_t
> **newly_connected,
>                         free(*newly_connected);
>                 newly_connected_count =3D
> igt_get_connected_connectors(drm_fd, newly_connected);
>                 igt_assert_eq(igt_gettime(&end), 0);
> -       } while (!get_array_diff(*newly_connected, newly_connected_count,
> +       } while (get_array_diff(*newly_connected, newly_connected_count,
>                                already_connected, already_connected_count=
,
> -                              NULL) &&
> -                igt_time_elapsed(&start, &end) <=3D
> igt_default_display_detect_timeout());
> +                              NULL) < expected_new_connector_count &&
> +                igt_time_elapsed(&start, &end) <=3D timeout);
>
>         return newly_connected_count;
>  }
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 521a03c01..09cec556f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1382,7 +1382,9 @@ uint32_t igt_get_connector_id_from_mst_path(int
> drm_fd, const void *mst_path);
>
>  int kms_wait_for_new_connectors(uint32_t **newly_connected,
>                                 const uint32_t *already_connected,
> -                               int already_connected_count, int drm_fd);
> +                               int already_connected_count,
> +                               int expected_new_connector_count,
> +                               int drm_fd);
>  int
>  get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t
> *array_b, int array_b_len,
>                uint32_t **diff);
> diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
> index 30ee3c72b..bfb06bd0c 100644
> --- a/lib/vendor/unigraf/unigraf.c
> +++ b/lib/vendor/unigraf/unigraf.c
> @@ -270,6 +270,7 @@ static void unigraf_autodetect_connector(int drm_fd)
>         newly_connected_count =3D
> kms_wait_for_new_connectors(&newly_connected,
>
> already_connected,
>
> already_connected_count,
> +                                                           1,
>                                                             drm_fd);
>
>         diff_len =3D get_array_diff(newly_connected, newly_connected_coun=
t,
> diff --git a/tests/unigraf/unigraf_connectivity.c
> b/tests/unigraf/unigraf_connectivity.c
> index 8ae9a2593..e813c9973 100644
> --- a/tests/unigraf/unigraf_connectivity.c
> +++ b/tests/unigraf/unigraf_connectivity.c
> @@ -108,10 +108,20 @@ int igt_main()
>
>                 /* i =3D 0 is SST so we need to process max_count + 1
> streams */
>                 for (int i =3D 0; i <=3D max_count; i++) {
> +                       if (i =3D=3D 1) {
> +                               /* Full physical HPD disconnect/reset
> between SST and MST iterations */
> +                               unigraf_unplug();
> +                               unigraf_hpd_deassert();
> +
>  sleep(igt_default_display_detect_timeout());
> +                               unigraf_reset();
> +
>  sleep(igt_default_display_detect_timeout());
> +                       }
> +                       unigraf_unplug();
>                         unigraf_hpd_deassert();
>                         /* Let the hardware detect the new state  */
>                         sleep(igt_default_display_detect_timeout());
>
> +                       unigraf_plug();
>                         unigraf_set_mst_stream_count(max(i, 1));
>                         if (!i)
>                                 unigraf_set_sst();
> @@ -125,13 +135,18 @@ int igt_main()
>                         newly_connected_count =3D
> kms_wait_for_new_connectors(&newly_connected,
>
>   already_connected,
>
>   already_connected_count,
> +
>  max(i, 1),
>
>   drm_fd);
>
>                         diff_len =3D get_array_diff(newly_connected,
> newly_connected_count,
>                                                   already_connected,
> already_connected_count, &diff);
>
> -                       igt_assert_f(diff_len =3D=3D max(i, 1),
> -                                    "Invalid connected connector count,
> expected %d found %d\n",
> +                       /*
> +                        * We allow diff_len to be between 1 and max(i, 1=
)
> because the DRM driver may incrementally
> +                        * expose MST stream nodes rather than surfacing
> the entire topology at once.
> +                        */
> +                       igt_assert_f(diff_len >=3D 1 && diff_len <=3D max=
(i,
> 1),
> +                                    "Invalid connected connector count,
> expected between 1 and %d found %d\n",
>                                      max(i, 1), diff_len);
>                 }
>
> diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
> index 81e6ecd3f..b5989503d 100644
> --- a/tests/unigraf/unigraf_lt.c
> +++ b/tests/unigraf/unigraf_lt.c
> @@ -107,11 +107,15 @@ int igt_main()
>
>                 for (i =3D 0; i < ARRAY_SIZE(lane_counts); i++) {
>                         igt_dynamic_f("unigraf-dp-lane-count-%d",
> lane_counts[i]) {
> +                               /* Hardware PHY requires physical settle
> time before and after link constraints */
> +
>  sleep(igt_default_display_detect_timeout());
>                                 unigraf_reset();
>                                 unigraf_set_max_lane_count(lane_counts[i]=
);
>                                 unigraf_hpd_pulse(500000);
> +
>  sleep(igt_default_display_detect_timeout());
>
> -                               igt_display_require_output(&display);
> +                               igt_display_reset_outputs(&display);
> +                               connector =3D unigraf_get_connector(drm_f=
d);
>                                 output =3D
> igt_output_from_connector(&display, connector);
>                                 igt_assert(output);
>                                 igt_dp_force_link_retrain(drm_fd, output,
> 2);
> @@ -119,6 +123,9 @@ int igt_main()
>
>                                 current_lanes =3D
> igt_dp_get_current_lane_count(drm_fd, output);
>                                 igt_assert_eq(current_lanes,
> lane_counts[i]);
> +
> +                               igt_modeset_disable_all_outputs(&display)=
;
> +                               igt_display_commit2(&display,
> COMMIT_ATOMIC);
>                         }
>                 }
>         }
> @@ -134,14 +141,21 @@ int igt_main()
>
>                 for (i =3D 0; i < ARRAY_SIZE(rates); i++) {
>                         igt_dynamic_f("unigraf-dp-link-rate-%d", rates[i]=
)
> {
> -                               unigraf_reset();
> -                               unigraf_set_max_link_rate(rates[i]);
> -                               unigraf_hpd_pulse(1000000);
> -                               igt_display_require_output(&display);
> -                               igt_display_reset(&display);
> -                               igt_display_require_output(&display);
> +                               connector =3D unigraf_get_connector(drm_f=
d);
>                                 output =3D
> igt_output_from_connector(&display, connector);
>                                 igt_assert(output);
> +
> +                               /* Fast-fail if graphic card does not
> support enforcing this link rate natively */
> +
>  igt_require(igt_dp_is_link_rate_supported(drm_fd, output,
> unigraf_rate_to_kbs(rates[i])));
> +
> +                               /* Hardware PHY requires physical settle
> time before and after link constraints */
> +
>  sleep(igt_default_display_detect_timeout());
> +                               unigraf_reset();
> +                               unigraf_set_max_link_rate(rates[i]);
> +                               unigraf_hpd_pulse(500000);
> +
>  sleep(igt_default_display_detect_timeout());
> +
> +                               igt_display_reset_outputs(&display);
>                                 igt_dp_force_link_retrain(drm_fd, output,
> 2);
>
>                                 init_output_and_display_pattern(&display,
> output);
> @@ -150,6 +164,9 @@ int igt_main()
>                                 max_supported_rate =3D
> igt_dp_get_max_supported_rate(drm_fd, output);
>                                 igt_require(max_supported_rate >=3D
> unigraf_rate_to_kbs(rates[i]));
>                                 igt_assert_eq(current_rate,
> unigraf_rate_to_kbs(rates[i]));
> +
> +                               igt_modeset_disable_all_outputs(&display)=
;
> +                               igt_display_commit2(&display,
> COMMIT_ATOMIC);
>                         }
>                 }
>         }
> --
> 2.55.0.229.g6434b31f56-goog
>
>

--00000000000074920306575be065
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+aGVsbG8sIGZyaWVuZGx5IHBpbmcgb24gdGhpczwvZGl2Pjxicj48ZGl2
IGNsYXNzPSJnbWFpbF9xdW90ZSBnbWFpbF9xdW90ZV9jb250YWluZXIiPjxkaXYgZGlyPSJsdHIi
IGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIEp1bCAyMCwgMjAyNiBhdCA0OjUz4oCvUE0gTWFy
ayBZYWNvdWIgJmx0OzxhIGhyZWY9Im1haWx0bzptYXJreWFjb3ViQGdvb2dsZS5jb20iPm1hcmt5
YWNvdWJAZ29vZ2xlLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFz
cz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxl
ZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+UmVmYWN0b3Ig
aGFyZHdhcmUgY2FwYWJpbGl0eSBjaGVja3MgdG8gbmF0aXZlbHkgc2tpcCB1bnN1cHBvcnRlZCBE
UCBsaW5rIHBhcmFtZXRlcnMgZHluYW1pY2FsbHksIG1vdmluZyB2YWxpZGF0aW9uIGNsZWFubHkg
aW50byB0aGUgY29yZSBpZ3RfZHAgYWJzdHJhY3Rpb24gbGF5ZXIgcm9idXN0bHkuPGJyPg0KPGJy
Pg0KdjI6PGJyPg0KwqAtIERvd25ncmFkZSBgaWd0X2Fzc2VydF9mYCBjaGVja3MgYWNyb3NzIHRo
ZSBgaWd0X2RwYCBsYXllciB0byBgaWd0X3JlcXVpcmVfZmAgKExvdWlzKTxicj4NCsKgLSBFeHRy
YWN0IGxpbmsgcmF0ZSBxdWVyeWluZyBpbnRvIGdlbmVyaWMgYGlndF9kcF9pc19saW5rX3JhdGVf
c3VwcG9ydGVkYCBoZWxwZXIgKExvdWlzKTxicj4NCsKgLSBBZGQgYGV4cGVjdGVkX25ld19jb25u
ZWN0b3JfY291bnRgIHRvIGBrbXNfd2FpdF9mb3JfbmV3X2Nvbm5lY3RvcnNgIHRvIGZpeCBkaXNj
b3ZlcnkgcmFjZSBjb25kaXRpb25zIG5hdGl2ZWx5IChMb3Vpcyk8YnI+DQo8YnI+DQpUQUc9YWd5
PGJyPg0KQ09OVj0zNWU4ZTFlNC0yZGZkLTRiZjItOGMwYi1jOWJiYzYyNjhkOTI8YnI+DQotLS08
YnI+DQrCoGxpYi9pZ3RfZHAuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrKy0tPGJyPg0KwqBsaWIvaWd0X2RwLmjCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCAxICs8YnI+DQrCoGxpYi9pZ3Rf
a21zLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDE1ICsrKysrKy0tLTxi
cj4NCsKgbGliL2lndF9rbXMuaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzC
oCA0ICsrLTxicj4NCsKgbGliL3ZlbmRvci91bmlncmFmL3VuaWdyYWYuY8KgIMKgIMKgIMKgIMKg
fMKgIDEgKzxicj4NCsKgdGVzdHMvdW5pZ3JhZi91bmlncmFmX2Nvbm5lY3Rpdml0eS5jIHwgMTkg
KysrKysrKysrLS08YnI+DQrCoHRlc3RzL3VuaWdyYWYvdW5pZ3JhZl9sdC5jwqAgwqAgwqAgwqAg
wqAgwqB8IDMxICsrKysrKysrKysrKystLS0tPGJyPg0KwqA3IGZpbGVzIGNoYW5nZWQsIDEwNCBp
bnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvbGli
L2lndF9kcC5jIGIvbGliL2lndF9kcC5jPGJyPg0KaW5kZXggOWY3MWM5ZTcyLi4yMGFmNmE5Njcg
MTAwNjQ0PGJyPg0KLS0tIGEvbGliL2lndF9kcC5jPGJyPg0KKysrIGIvbGliL2lndF9kcC5jPGJy
Pg0KQEAgLTEwNyw3ICsxMDcsNyBAQCBpbnQgaWd0X2RwX2dldF9tYXhfbGFuZV9jb3VudChpbnQg
ZHJtX2ZkLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCk8YnI+DQrCoCDCoCDCoCDCoCBpZiAoaXNfaW50
ZWxfZGV2aWNlKGRybV9mZCkpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIGk5
MTVfZHBfZ2V0X21heF9sYW5lX2NvdW50KGRybV9mZCwgb3V0cHV0KTs8YnI+DQo8YnI+DQotwqAg
wqAgwqAgwqBpZ3RfYXNzZXJ0X2YoZmFsc2UsICZxdW90O0N1cnJlbnQgZHJtIGRldmljZSBpcyBu
b3QgYWJsZSB0byByZXBvcnQgbWF4IGxhbmUgY291bnRcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKg
IMKgaWd0X3JlcXVpcmVfZihmYWxzZSwgJnF1b3Q7Q3VycmVudCBkcm0gZGV2aWNlIGlzIG5vdCBh
YmxlIHRvIHJlcG9ydCBtYXggbGFuZSBjb3VudFxuJnF1b3Q7KTs8YnI+DQrCoCDCoCDCoCDCoCBy
ZXR1cm4gLUVJTlZBTDs8YnI+DQrCoH08YnI+DQo8YnI+DQpAQCAtMTI0LDcgKzEyNCw1MSBAQCB2
b2lkIGlndF9kcF9mb3JjZV9saW5rX3JldHJhaW4oaW50IGRybV9mZCwgaWd0X291dHB1dF90ICpv
dXRwdXQsIGludCByZXRyYWluX2NvdTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVy
bjs8YnI+DQrCoCDCoCDCoCDCoCB9PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgaWd0X2Fzc2VydF9m
KGZhbHNlLCAmcXVvdDtDdXJyZW50IGRybSBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBsaW5rIHJl
dHJhaW5pbmdcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgaWd0X3JlcXVpcmVfZihmYWxzZSwg
JnF1b3Q7Q3VycmVudCBkcm0gZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQgbGluayByZXRyYWluaW5n
XG4mcXVvdDspOzxicj4NCit9PGJyPg0KKzxicj4NCisvKio8YnI+DQorICogaWd0X2RwX2lzX2xp
bmtfcmF0ZV9zdXBwb3J0ZWQ6IFRlc3RzIGlmIHRoZSBzcGVjaWZpYyBsaW5rIHJhdGUgY2FuIGJl
IGZvcmNlZDxicj4NCisgKiBAZHJtX2ZkOsKgIMKgIMKgIMKgIMKgIMKgIERSTSBmaWxlIGRlc2Ny
aXB0b3I8YnI+DQorICogQG91dHB1dDrCoCDCoCDCoCDCoCDCoCDCoCBpZ3Rfb3V0cHV0X3Qgb2Jq
ZWN0IHJlcHJlc2VudGluZyB0aGUgZGlzcGxheSBwb3J0PGJyPg0KKyAqIEByYXRlX2tiOsKgIMKg
IMKgIMKgIMKgIMKgTGluayByYXRlIGluIGticHMgdG8gdGVzdDxicj4NCisgKjxicj4NCisgKiBS
ZXR1cm5zOiB0cnVlIGlmIGRldmljZSBzdXBwb3J0cyBlbmZvcmNpbmcgdGhpcyByYXRlLCBmYWxz
ZSBvdGhlcndpc2U8YnI+DQorICovPGJyPg0KK2Jvb2wgaWd0X2RwX2lzX2xpbmtfcmF0ZV9zdXBw
b3J0ZWQoaW50IGRybV9mZCwgaWd0X291dHB1dF90ICpvdXRwdXQsIGludCByYXRlX2tiKTxicj4N
Cit7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKGlzX2ludGVsX2RldmljZShkcm1fZmQpKSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2hhciBidWZbNTEyXTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpbnQgcmVzOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNoYXIgKnRv
a2VuOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludCByYXRlX3RlbnMgPSByYXRlX2ti
IC8gMTA7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlcyA9IGlndF9kZWJ1
Z2ZzX3JlYWRfY29ubmVjdG9yX2ZpbGUoZHJtX2ZkLCBpZ3Rfb3V0cHV0X25hbWUob3V0cHV0KSw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtpOTE1X2RwX2ZvcmNlX2xpbmtfcmF0
ZSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidWYsIHNpemVvZihidWYpKTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmVzICZsdDsgMCk8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gZmFsc2U7PGJyPg0KKzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRva2VuID0gc3RydG9rKGJ1ZiwgJnF1b3Q7IFxuXHQsOiZx
dW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd2hpbGUgKHRva2VuKSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50IHJhdGU7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2hhciAqZW5kcHRyOzxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlcnJubyA9IDA7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmF0ZSA9IHN0cnRvbCh0b2tlbiwgJmFtcDtl
bmRwdHIsIDApOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIFJvYnVzdGx5IHZlcmlm
eSB0aGF0IGEgbnVtYmVyIHdhcyBhY3R1YWxseSBwYXJzZWQgKGVuZHB0ciAhPSB0b2tlbik8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBhbGxvd2luZyB1cyB0byBz
YWZlbHkgaWdub3JlIGZvcm1hdHRpbmcgaGVhZGVycyAoZS5nLiAmcXVvdDtSYXRlczomcXVvdDsp
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFlcnJubyAmYW1wOyZhbXA7IGVuZHB0
ciAhPSB0b2tlbiAmYW1wOyZhbXA7IHJhdGUgPT0gcmF0ZV90ZW5zKTxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiB0cnVlOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRva2VuID0gc3RydG9rKE5VTEwsICZx
dW90OyBcblx0LDomcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIGZhbHNlOzxicj4NCivCoCDCoCDC
oCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIGlndF9kcF9nZXRfbWF4X3N1cHBv
cnRlZF9yYXRlKGRybV9mZCwgb3V0cHV0KSAmZ3Q7PSByYXRlX2tiOzxicj4NCsKgfTxicj4NCjxi
cj4NCsKgLyoqPGJyPg0KQEAgLTE0MCw3ICsxODQsNyBAQCBpbnQgaWd0X2RwX2dldF9wZW5kaW5n
X3JldHJhaW4oaW50IGRybV9mZCwgaWd0X291dHB1dF90ICpvdXRwdXQpPGJyPg0KwqAgwqAgwqAg
wqAgaWYgKGlzX2ludGVsX2RldmljZShkcm1fZmQpKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHJldHVybiBpOTE1X2RwX2dldF9wZW5kaW5nX3JldHJhaW4oZHJtX2ZkLCBvdXRwdXQpOzxi
cj4NCjxicj4NCi3CoCDCoCDCoCDCoGlndF9hc3NlcnRfZihmYWxzZSwgJnF1b3Q7Q3VycmVudCBk
cm0gZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQgcGVuZGluZyByZXRyYWluIGNvdW50IGNoZWNraW5n
XG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoGlndF9yZXF1aXJlX2YoZmFsc2UsICZxdW90O0N1
cnJlbnQgZHJtIGRldmljZSBkb2VzIG5vdCBzdXBwb3J0IHBlbmRpbmcgcmV0cmFpbiBjb3VudCBj
aGVja2luZ1xuJnF1b3Q7KTs8YnI+DQrCoCDCoCDCoCDCoCByZXR1cm4gLUVJTlZBTDs8YnI+DQrC
oH08YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvbGliL2lndF9kcC5oIGIvbGliL2lndF9kcC5oPGJy
Pg0KaW5kZXggMGM1NmFkMmVjLi5lNWNhY2FkNjYgMTAwNjQ0PGJyPg0KLS0tIGEvbGliL2lndF9k
cC5oPGJyPg0KKysrIGIvbGliL2lndF9kcC5oPGJyPg0KQEAgLTIyLDYgKzIyLDcgQEAgaW50IGln
dF9kcF9nZXRfbWF4X3N1cHBvcnRlZF9yYXRlKGludCBkcm1fZmQsIGlndF9vdXRwdXRfdCAqb3V0
cHV0KTs8YnI+DQrCoGludCBpZ3RfZHBfZ2V0X21heF9sYW5lX2NvdW50KGludCBkcm1fZmQsIGln
dF9vdXRwdXRfdCAqb3V0cHV0KTs8YnI+DQo8YnI+DQrCoHZvaWQgaWd0X2RwX2ZvcmNlX2xpbmtf
cmV0cmFpbihpbnQgZHJtX2ZkLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgaW50IHJldHJhaW5fY291
bnQpOzxicj4NCitib29sIGlndF9kcF9pc19saW5rX3JhdGVfc3VwcG9ydGVkKGludCBkcm1fZmQs
IGlndF9vdXRwdXRfdCAqb3V0cHV0LCBpbnQgcmF0ZV9rYik7PGJyPg0KPGJyPg0KwqBpbnQgaWd0
X2RwX2dldF9wZW5kaW5nX3JldHJhaW4oaW50IGRybV9mZCwgaWd0X291dHB1dF90ICpvdXRwdXQp
Ozxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYzxi
cj4NCmluZGV4IDJlZWZiNzczYi4uMDQxYTMzNTZiIDEwMDY0NDxicj4NCi0tLSBhL2xpYi9pZ3Rf
a21zLmM8YnI+DQorKysgYi9saWIvaWd0X2ttcy5jPGJyPg0KQEAgLTgyNTUsMTAgKzgyNTUsMTcg
QEAgZ2V0X2FycmF5X2RpZmYoY29uc3QgdWludDMyX3QgKmFycmF5X2EsIGludCBhcnJheV9hX2xl
biwgY29uc3QgdWludDMyX3QgKmFycmF5X2I8YnI+DQrCoCAqLzxicj4NCsKgaW50IGttc193YWl0
X2Zvcl9uZXdfY29ubmVjdG9ycyh1aW50MzJfdCAqKm5ld2x5X2Nvbm5lY3RlZCw8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjb25zdCB1aW50MzJf
dCAqYWxyZWFkeV9jb25uZWN0ZWQsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaW50IGFscmVhZHlfY29ubmVjdGVkX2NvdW50LCBpbnQgZHJtX2Zk
KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlu
dCBhbHJlYWR5X2Nvbm5lY3RlZF9jb3VudCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnQgZXhwZWN0ZWRfbmV3X2Nvbm5lY3Rvcl9jb3VudCw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnQg
ZHJtX2ZkKTxicj4NCsKgezxicj4NCsKgIMKgIMKgIMKgIGludCBuZXdseV9jb25uZWN0ZWRfY291
bnQ7PGJyPg0KwqAgwqAgwqAgwqAgc3RydWN0IHRpbWVzcGVjIHN0YXJ0LCBlbmQ7PGJyPg0KK8Kg
IMKgIMKgIMKgaW50IHRpbWVvdXQgPSBpZ3RfZGVmYXVsdF9kaXNwbGF5X2RldGVjdF90aW1lb3V0
KCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC8qIE1TVCBkaXNjb3ZlcnkgbWF5IGJlIHNlcmlh
bGl6ZWQgaW4gdGhlIGtlcm5lbDsgYWxsb2NhdGUgZXh0cmEgdGltZSBmb3IgdG9wb2xvZ3kgc2V0
dGxpbmcgKi88YnI+DQorwqAgwqAgwqAgwqBpZiAoZXhwZWN0ZWRfbmV3X2Nvbm5lY3Rvcl9jb3Vu
dCAmZ3Q7IDEpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGltZW91dCAqPSAyOzxicj4N
Cjxicj4NCsKgIMKgIMKgIMKgIGlndF9hc3NlcnQobmV3bHlfY29ubmVjdGVkKTs8YnI+DQrCoCDC
oCDCoCDCoCBpZ3RfYXNzZXJ0X2ZkKGRybV9mZCk7PGJyPg0KQEAgLTgyNjksMTAgKzgyNzYsMTAg
QEAgaW50IGttc193YWl0X2Zvcl9uZXdfY29ubmVjdG9ycyh1aW50MzJfdCAqKm5ld2x5X2Nvbm5l
Y3RlZCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBmcmVlKCpuZXds
eV9jb25uZWN0ZWQpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5ld2x5X2Nvbm5lY3Rl
ZF9jb3VudCA9IGlndF9nZXRfY29ubmVjdGVkX2Nvbm5lY3RvcnMoZHJtX2ZkLCBuZXdseV9jb25u
ZWN0ZWQpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlndF9hc3NlcnRfZXEoaWd0X2dl
dHRpbWUoJmFtcDtlbmQpLCAwKTs8YnI+DQotwqAgwqAgwqAgwqB9IHdoaWxlICghZ2V0X2FycmF5
X2RpZmYoKm5ld2x5X2Nvbm5lY3RlZCwgbmV3bHlfY29ubmVjdGVkX2NvdW50LDxicj4NCivCoCDC
oCDCoCDCoH0gd2hpbGUgKGdldF9hcnJheV9kaWZmKCpuZXdseV9jb25uZWN0ZWQsIG5ld2x5X2Nv
bm5lY3RlZF9jb3VudCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGFscmVhZHlfY29ubmVjdGVkLCBhbHJlYWR5X2Nvbm5lY3RlZF9jb3VudCw8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgTlVMTCkgJmFt
cDsmYW1wOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZ3RfdGltZV9lbGFwc2VkKCZh
bXA7c3RhcnQsICZhbXA7ZW5kKSAmbHQ7PSBpZ3RfZGVmYXVsdF9kaXNwbGF5X2RldGVjdF90aW1l
b3V0KCkpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBOVUxMKSAmbHQ7IGV4cGVjdGVkX25ld19jb25uZWN0b3JfY291bnQgJmFtcDsmYW1wOzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZ3RfdGltZV9lbGFwc2VkKCZhbXA7c3RhcnQsICZh
bXA7ZW5kKSAmbHQ7PSB0aW1lb3V0KTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCByZXR1cm4gbmV3
bHlfY29ubmVjdGVkX2NvdW50Ozxicj4NCsKgfTxicj4NCmRpZmYgLS1naXQgYS9saWIvaWd0X2tt
cy5oIGIvbGliL2lndF9rbXMuaDxicj4NCmluZGV4IDUyMWEwM2MwMS4uMDljZWM1NTZmIDEwMDY0
NDxicj4NCi0tLSBhL2xpYi9pZ3Rfa21zLmg8YnI+DQorKysgYi9saWIvaWd0X2ttcy5oPGJyPg0K
QEAgLTEzODIsNyArMTM4Miw5IEBAIHVpbnQzMl90IGlndF9nZXRfY29ubmVjdG9yX2lkX2Zyb21f
bXN0X3BhdGgoaW50IGRybV9mZCwgY29uc3Qgdm9pZCAqbXN0X3BhdGgpOzxicj4NCjxicj4NCsKg
aW50IGttc193YWl0X2Zvcl9uZXdfY29ubmVjdG9ycyh1aW50MzJfdCAqKm5ld2x5X2Nvbm5lY3Rl
ZCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBj
b25zdCB1aW50MzJfdCAqYWxyZWFkeV9jb25uZWN0ZWQsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50IGFscmVhZHlfY29ubmVjdGVkX2NvdW50
LCBpbnQgZHJtX2ZkKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpbnQgYWxyZWFkeV9jb25uZWN0ZWRfY291bnQsPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50IGV4cGVjdGVkX25ld19jb25u
ZWN0b3JfY291bnQsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaW50IGRybV9mZCk7PGJyPg0KwqBpbnQ8YnI+DQrCoGdldF9hcnJheV9kaWZmKGNv
bnN0IHVpbnQzMl90ICphcnJheV9hLCBpbnQgYXJyYXlfYV9sZW4sIGNvbnN0IHVpbnQzMl90ICph
cnJheV9iLCBpbnQgYXJyYXlfYl9sZW4sPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1aW50
MzJfdCAqKmRpZmYpOzxicj4NCmRpZmYgLS1naXQgYS9saWIvdmVuZG9yL3VuaWdyYWYvdW5pZ3Jh
Zi5jIGIvbGliL3ZlbmRvci91bmlncmFmL3VuaWdyYWYuYzxicj4NCmluZGV4IDMwZWUzYzcyYi4u
YmZiMDZiZDBjIDEwMDY0NDxicj4NCi0tLSBhL2xpYi92ZW5kb3IvdW5pZ3JhZi91bmlncmFmLmM8
YnI+DQorKysgYi9saWIvdmVuZG9yL3VuaWdyYWYvdW5pZ3JhZi5jPGJyPg0KQEAgLTI3MCw2ICsy
NzAsNyBAQCBzdGF0aWMgdm9pZCB1bmlncmFmX2F1dG9kZXRlY3RfY29ubmVjdG9yKGludCBkcm1f
ZmQpPGJyPg0KwqAgwqAgwqAgwqAgbmV3bHlfY29ubmVjdGVkX2NvdW50ID0ga21zX3dhaXRfZm9y
X25ld19jb25uZWN0b3JzKCZhbXA7bmV3bHlfY29ubmVjdGVkLDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGFscmVhZHlfY29ubmVjdGVkLDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGFscmVhZHlfY29ubmVjdGVkX2NvdW50LDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDEsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgZHJtX2ZkKTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBkaWZmX2xlbiA9IGdldF9h
cnJheV9kaWZmKG5ld2x5X2Nvbm5lY3RlZCwgbmV3bHlfY29ubmVjdGVkX2NvdW50LDxicj4NCmRp
ZmYgLS1naXQgYS90ZXN0cy91bmlncmFmL3VuaWdyYWZfY29ubmVjdGl2aXR5LmMgYi90ZXN0cy91
bmlncmFmL3VuaWdyYWZfY29ubmVjdGl2aXR5LmM8YnI+DQppbmRleCA4YWU5YTI1OTMuLmU4MTNj
OTk3MyAxMDA2NDQ8YnI+DQotLS0gYS90ZXN0cy91bmlncmFmL3VuaWdyYWZfY29ubmVjdGl2aXR5
LmM8YnI+DQorKysgYi90ZXN0cy91bmlncmFmL3VuaWdyYWZfY29ubmVjdGl2aXR5LmM8YnI+DQpA
QCAtMTA4LDEwICsxMDgsMjAgQEAgaW50IGlndF9tYWluKCk8YnI+DQo8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAvKiBpID0gMCBpcyBTU1Qgc28gd2UgbmVlZCB0byBwcm9jZXNzIG1heF9j
b3VudCArIDEgc3RyZWFtcyAqLzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGZvciAoaW50
IGkgPSAwOyBpICZsdDs9IG1heF9jb3VudDsgaSsrKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKGkgPT0gMSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIEZ1bGwgcGh5c2ljYWwgSFBEIGRpc2Nvbm5l
Y3QvcmVzZXQgYmV0d2VlbiBTU1QgYW5kIE1TVCBpdGVyYXRpb25zICovPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5pZ3JhZl91bnBsdWcoKTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bmln
cmFmX2hwZF9kZWFzc2VydCgpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHNsZWVwKGlndF9kZWZhdWx0X2Rpc3BsYXlfZGV0ZWN0X3RpbWVvdXQo
KSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
dW5pZ3JhZl9yZXNldCgpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHNsZWVwKGlndF9kZWZhdWx0X2Rpc3BsYXlfZGV0ZWN0X3RpbWVvdXQoKSk7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuaWdyYWZfdW5wbHVnKCk7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdW5pZ3JhZl9ocGRfZGVhc3NlcnQoKTs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMZXQgdGhlIGhhcmR3YXJl
IGRldGVjdCB0aGUgbmV3IHN0YXRlwqAgKi88YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBzbGVlcChpZ3RfZGVmYXVsdF9kaXNwbGF5X2RldGVjdF90aW1lb3V0KCkpOzxi
cj4NCjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuaWdyYWZfcGx1
ZygpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVuaWdyYWZfc2V0
X21zdF9zdHJlYW1fY291bnQobWF4KGksIDEpKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBpZiAoIWkpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgdW5pZ3JhZl9zZXRfc3N0KCk7PGJyPg0KQEAgLTEyNSwxMyArMTM1
LDE4IEBAIGludCBpZ3RfbWFpbigpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgbmV3bHlfY29ubmVjdGVkX2NvdW50ID0ga21zX3dhaXRfZm9yX25ld19jb25uZWN0b3Jz
KCZhbXA7bmV3bHlfY29ubmVjdGVkLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFscmVhZHlfY29ubmVjdGVkLDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFscmVh
ZHlfY29ubmVjdGVkX2NvdW50LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1heChpLCAxKSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBkcm1fZmQpOzxicj4NCjxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRpZmZfbGVuID0gZ2V0X2Fy
cmF5X2RpZmYobmV3bHlfY29ubmVjdGVkLCBuZXdseV9jb25uZWN0ZWRfY291bnQsPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgYWxyZWFkeV9jb25uZWN0ZWQsIGFscmVhZHlfY29ubmVjdGVkX2NvdW50
LCAmYW1wO2RpZmYpOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGlndF9hc3NlcnRfZihkaWZmX2xlbiA9PSBtYXgoaSwgMSksPGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90O0ludmFsaWQg
Y29ubmVjdGVkIGNvbm5lY3RvciBjb3VudCwgZXhwZWN0ZWQgJWQgZm91bmQgJWRcbiZxdW90Oyw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiA8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBXZSBhbGxvdyBkaWZmX2xlbiB0byBiZSBi
ZXR3ZWVuIDEgYW5kIG1heChpLCAxKSBiZWNhdXNlIHRoZSBEUk0gZHJpdmVyIG1heSBpbmNyZW1l
bnRhbGx5PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogZXhwb3Nl
IE1TVCBzdHJlYW0gbm9kZXMgcmF0aGVyIHRoYW4gc3VyZmFjaW5nIHRoZSBlbnRpcmUgdG9wb2xv
Z3kgYXQgb25jZS48YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZ3RfYXNzZXJ0X2YoZGlm
Zl9sZW4gJmd0Oz0gMSAmYW1wOyZhbXA7IGRpZmZfbGVuICZsdDs9IG1heChpLCAxKSw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1
b3Q7SW52YWxpZCBjb25uZWN0ZWQgY29ubmVjdG9yIGNvdW50LCBleHBlY3RlZCBiZXR3ZWVuIDEg
YW5kICVkIGZvdW5kICVkXG4mcXVvdDssPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtYXgoaSwgMSksIGRpZmZfbGVuKTs8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL3Rlc3RzL3Vu
aWdyYWYvdW5pZ3JhZl9sdC5jIGIvdGVzdHMvdW5pZ3JhZi91bmlncmFmX2x0LmM8YnI+DQppbmRl
eCA4MWU2ZWNkM2YuLmI1OTg5NTAzZCAxMDA2NDQ8YnI+DQotLS0gYS90ZXN0cy91bmlncmFmL3Vu
aWdyYWZfbHQuYzxicj4NCisrKyBiL3Rlc3RzL3VuaWdyYWYvdW5pZ3JhZl9sdC5jPGJyPg0KQEAg
LTEwNywxMSArMTA3LDE1IEBAIGludCBpZ3RfbWFpbigpPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgZm9yIChpID0gMDsgaSAmbHQ7IEFSUkFZX1NJWkUobGFuZV9jb3VudHMpOyBp
KyspIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZ3RfZHluYW1p
Y19mKCZxdW90O3VuaWdyYWYtZHAtbGFuZS1jb3VudC0lZCZxdW90OywgbGFuZV9jb3VudHNbaV0p
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAv
KiBIYXJkd2FyZSBQSFkgcmVxdWlyZXMgcGh5c2ljYWwgc2V0dGxlIHRpbWUgYmVmb3JlIGFuZCBh
ZnRlciBsaW5rIGNvbnN0cmFpbnRzICovPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc2xlZXAoaWd0X2RlZmF1bHRfZGlzcGxheV9kZXRlY3RfdGlt
ZW91dCgpKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB1bmlncmFmX3Jlc2V0KCk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgdW5pZ3JhZl9zZXRfbWF4X2xhbmVfY291bnQobGFuZV9jb3VudHNb
aV0pOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHVuaWdyYWZfaHBkX3B1bHNlKDUwMDAwMCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2xlZXAoaWd0X2RlZmF1bHRfZGlzcGxheV9kZXRlY3Rf
dGltZW91dCgpKTs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZ3RfZGlzcGxheV9yZXF1aXJlX291dHB1dCgmYW1wO2Rpc3BsYXkpOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlndF9k
aXNwbGF5X3Jlc2V0X291dHB1dHMoJmFtcDtkaXNwbGF5KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb25uZWN0b3IgPSB1bmlncmFmX2dldF9j
b25uZWN0b3IoZHJtX2ZkKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBvdXRwdXQgPSBpZ3Rfb3V0cHV0X2Zyb21fY29ubmVjdG9yKCZhbXA7ZGlz
cGxheSwgY29ubmVjdG9yKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBpZ3RfYXNzZXJ0KG91dHB1dCk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWd0X2RwX2ZvcmNlX2xpbmtfcmV0cmFpbihk
cm1fZmQsIG91dHB1dCwgMik7PGJyPg0KQEAgLTExOSw2ICsxMjMsOSBAQCBpbnQgaWd0X21haW4o
KTxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGN1cnJlbnRfbGFuZXMgPSBpZ3RfZHBfZ2V0X2N1cnJlbnRfbGFuZV9jb3VudChkcm1fZmQs
IG91dHB1dCk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgaWd0X2Fzc2VydF9lcShjdXJyZW50X2xhbmVzLCBsYW5lX2NvdW50c1tpXSk7PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGln
dF9tb2Rlc2V0X2Rpc2FibGVfYWxsX291dHB1dHMoJmFtcDtkaXNwbGF5KTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZ3RfZGlzcGxheV9jb21t
aXQyKCZhbXA7ZGlzcGxheSwgQ09NTUlUX0FUT01JQyk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQrC
oCDCoCDCoCDCoCB9PGJyPg0KQEAgLTEzNCwxNCArMTQxLDIxIEBAIGludCBpZ3RfbWFpbigpPGJy
Pg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZm9yIChpID0gMDsgaSAmbHQ7IEFSUkFZ
X1NJWkUocmF0ZXMpOyBpKyspIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBpZ3RfZHluYW1pY19mKCZxdW90O3VuaWdyYWYtZHAtbGluay1yYXRlLSVkJnF1b3Q7LCBy
YXRlc1tpXSkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHVuaWdyYWZfcmVzZXQoKTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB1bmlncmFmX3NldF9tYXhfbGlua19yYXRlKHJhdGVzW2ldKTs8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bmln
cmFmX2hwZF9wdWxzZSgxMDAwMDAwKTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpZ3RfZGlzcGxheV9yZXF1aXJlX291dHB1dCgmYW1wO2Rpc3Bs
YXkpOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlndF9kaXNwbGF5X3Jlc2V0KCZhbXA7ZGlzcGxheSk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWd0X2Rpc3BsYXlfcmVxdWlyZV9vdXRwdXQo
JmFtcDtkaXNwbGF5KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjb25uZWN0b3IgPSB1bmlncmFmX2dldF9jb25uZWN0b3IoZHJtX2ZkKTs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvdXRwdXQg
PSBpZ3Rfb3V0cHV0X2Zyb21fY29ubmVjdG9yKCZhbXA7ZGlzcGxheSwgY29ubmVjdG9yKTs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZ3RfYXNz
ZXJ0KG91dHB1dCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgLyogRmFzdC1mYWlsIGlmIGdyYXBoaWMgY2FyZCBkb2VzIG5vdCBzdXBwb3J0IGVuZm9y
Y2luZyB0aGlzIGxpbmsgcmF0ZSBuYXRpdmVseSAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlndF9yZXF1aXJlKGlndF9kcF9pc19saW5rX3Jh
dGVfc3VwcG9ydGVkKGRybV9mZCwgb3V0cHV0LCB1bmlncmFmX3JhdGVfdG9fa2JzKHJhdGVzW2ld
KSkpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAvKiBIYXJkd2FyZSBQSFkgcmVxdWlyZXMgcGh5c2ljYWwgc2V0dGxlIHRpbWUgYmVm
b3JlIGFuZCBhZnRlciBsaW5rIGNvbnN0cmFpbnRzICovPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2xlZXAoaWd0X2RlZmF1bHRfZGlzcGxheV9k
ZXRlY3RfdGltZW91dCgpKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB1bmlncmFmX3Jlc2V0KCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5pZ3JhZl9zZXRfbWF4X2xpbmtfcmF0ZShyYXRl
c1tpXSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdW5pZ3JhZl9ocGRfcHVsc2UoNTAwMDAwKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzbGVlcChpZ3RfZGVmYXVsdF9kaXNwbGF5X2RldGVj
dF90aW1lb3V0KCkpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZ3RfZGlzcGxheV9yZXNldF9vdXRwdXRzKCZhbXA7ZGlzcGxheSk7
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWd0
X2RwX2ZvcmNlX2xpbmtfcmV0cmFpbihkcm1fZmQsIG91dHB1dCwgMik7PGJyPg0KPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5pdF9vdXRwdXRf
YW5kX2Rpc3BsYXlfcGF0dGVybigmYW1wO2Rpc3BsYXksIG91dHB1dCk7PGJyPg0KQEAgLTE1MCw2
ICsxNjQsOSBAQCBpbnQgaWd0X21haW4oKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1heF9zdXBwb3J0ZWRfcmF0ZSA9IGlndF9kcF9nZXRfbWF4
X3N1cHBvcnRlZF9yYXRlKGRybV9mZCwgb3V0cHV0KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZ3RfcmVxdWlyZShtYXhfc3VwcG9ydGVkX3Jh
dGUgJmd0Oz0gdW5pZ3JhZl9yYXRlX3RvX2ticyhyYXRlc1tpXSkpOzxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlndF9hc3NlcnRfZXEoY3VycmVu
dF9yYXRlLCB1bmlncmFmX3JhdGVfdG9fa2JzKHJhdGVzW2ldKSk7PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlndF9tb2Rlc2V0X2Rp
c2FibGVfYWxsX291dHB1dHMoJmFtcDtkaXNwbGF5KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZ3RfZGlzcGxheV9jb21taXQyKCZhbXA7ZGlz
cGxheSwgQ09NTUlUX0FUT01JQyk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQrCoCDCoCDCoCDCoCB9
PGJyPg0KLS0gPGJyPg0KMi41NS4wLjIyOS5nNjQzNGIzMWY1Ni1nb29nPGJyPg0KPGJyPg0KPC9i
bG9ja3F1b3RlPjwvZGl2Pg0K
--00000000000074920306575be065--
