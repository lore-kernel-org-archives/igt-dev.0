Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87375C531F9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 14:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB61810E055;
	Fri, 24 Jul 2026 14:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FN/vRSrx";
	dkim-atps=neutral
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA8A10E060
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 14:07:00 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-8eefd4a8057so4185066d6.0
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 07:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784902019; cv=none;
 d=google.com; s=arc-20260327;
 b=GVEVHU1ExgWHXh6EuHgBdMkRizyLwo7vZ1y2ciNjrqlDeAKYJsQ1lgpbKe07aCTwAn
 PRbHOe1E/UenaIr/0YiPWJP6idYXSgFDmQA9LG8E9ZurMlYoBb1FUECfQu9cWb0oGoTQ
 +1YgxyJuxW0+gbvIHrKOLElmFQ46+lQ6gPmqMYquAPMemRDHJAWxDH8AbeqOAPYU0u/g
 DVTrAkxhrgyJHJsDcv0OiWudA3kiYfdg9T+7AFAu2+fsVJNESewFlF22qZ5vIhIYWUZS
 VwP2oUra8xXiWz1RIpOCSf4Qv+8G+MUsfzxUPYaMVeJPh1zGOCZ3PPmP/YwBUAkSaTYu
 Hqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nJeuJgxd5yPio2/ch2B/QWWIFsJthZEZBgJ/OBenm5Y=;
 fh=BFO14ilBtpKxrziWuBiGbHPqaSOFocof19xArr46GC8=;
 b=W4bySUZtoxUCUTptdSta1MhuKItY+EUYiP+pPNpMRCJ87AOv2uckEMXd610JfaMmhV
 N+ssnJ0MsORrKi4Bei7vQ4lSxjKkjDiQeGHbxPAvh0dS14esrwiCSYIJAoLJck6gLpLX
 Sl5AJV6uEmfQBLbvwExR8a9pm9K2pMP+7PRLbTJ/fs/yoi39Z9MtrBVfv0kE62y6vERP
 rX8y7DUh9hQmZ8eqZlxdu20WOhSeh+OX0IKay7n20JmwJYwjXmSsY5ZlJxXFRCFeM/wG
 BA2FcFXhnYKAxa0ealga9LcAKBH1eEW2ZFbTVFe4PmBuT+ZOdw0qP78rkyu+1tvFeW97
 FoXA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784902019; x=1785506819;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nJeuJgxd5yPio2/ch2B/QWWIFsJthZEZBgJ/OBenm5Y=;
 b=FN/vRSrxIZnL2zPHjwfyBFuemf2X0VypsZUU2nGWjDBfwP4WGdbbIetBwbcR0Xc/Om
 ER6dd2+MOEcz52nd9idudD6rCXB+5pdfXEG6BuGSw7GDLhu8/3+/bnM1UXQlt/s+6JMq
 rwVNkqJfR9bFZRkQpZroZG0WcT23xKCxdIYWq8nDZQ8z+OBsNhDUNRsLpy8445HrnDsQ
 VkrKF59jfKTwM+YVtXnu5C5HxcsVpYsNdKIGdgPrvMhXgRmho/4LLfhw1b9EVjMAWrmG
 lYTOxkvhKtzfvU3PRjcD6uOCypXQFsCgpApI/DlOKeRi41jrCN8hgpJ128wAeIk+OEyu
 Kg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784902019; x=1785506819;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nJeuJgxd5yPio2/ch2B/QWWIFsJthZEZBgJ/OBenm5Y=;
 b=j28BRqWCm/b1HuMEpBmAvfYMgHA+077BCdiDB14/P8C2nz0+KK53FPIw1U3vzOtv3R
 E8qkNLIp8AinSSHuWR8MQHGmMeBK7ZZOah4pr61Xz3n98SFH5yKHoE6U6wel+ciRexZV
 IQbKcdYKFc1yRtXOOcrjoadW+HnCvEcVe+t7EA1B/DPdk1ni3nGF0X50iNIgBjhVOgD8
 7nD6fymuOqcuo6Ko+BHJQtPqpn509Si4ISrO0qSbELG+G/duLHjYpr+GYfdJH/V+P9f5
 QkoN7njOS7WrpO/NIu3kc2FbWE0HMupfY+BTl/uFQQuM3tMK/8ojwbjdCqbNxDGgJ9Jq
 A48A==
X-Gm-Message-State: AOJu0Yzh2S7fWYLji3937rQqxcc93PxSxUz3QtWjypqOSzrq0QEzYeSz
 LeXencwZeKZq2jZiDYklrZGDmzXql0NgtFN1npOJSd5zP6V+dIWsg3NWsh+HIYdw5qz/EVN+HYK
 U0pZnqtb9pEtfFYm6ByP3U4mp5jYdpMobR6Q5HfX7tsr7LGtONes0xqkxMwA=
X-Gm-Gg: AR+sD10qeqPfsl4qW+f336ii/mdBxgWNwq51H5drbWD0eRMFZTYlw5/LLgKE8rtYgS4
 vKXnIi8jIGL0sC+QO/2N+QDkDT65uE6nwBupNFwFrXT6m3mUAaFA7U4ikVD6X6I/c3QvF+2pFvC
 1Wey/solqNFvVGYGM5gaMkxpW/qvh8RvDtiG6DT/qmcFe4GaMHP/jouEG8vqYLHnSedmFdxkfgk
 1bTzzkLTrG50sO8HOMg9bMnRMBL04ptnxyLAbMqfKVtiikltfdurLySDsmNZBuQetsXQ1YndIZa
 Cfk7U5fpyCT/tw==
X-Received: by 2002:a05:622a:2cb:b0:51c:1d0c:605f with SMTP id
 d75a77b69052e-5283de42b06mr71768331cf.20.1784902018142; Fri, 24 Jul 2026
 07:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260715192949.1984280-1-markyacoub@google.com>
 <20260720185026.93121-1-markyacoub@google.com>
In-Reply-To: <20260720185026.93121-1-markyacoub@google.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Fri, 24 Jul 2026 10:06:46 -0400
X-Gm-Features: AUfX_mysfcK4XN_kWyO0r3u8sZrqOv2F-Gnk-n-CaHbfvtWWdeJrL2040IjGw3w
Message-ID: <CAC0gqY7Cc3PuNeM6U9DY7MwQ6WnXMQ=ii5qi2+=CDiEnwoLj8A@mail.gmail.com>
Subject: Re: [PATCH v2] lib/igt_rc: Introduce generic config parser
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, kamil.konieczny@linux.intel.com
Content-Type: multipart/alternative; boundary="000000000000c25d4106575be260"
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

--000000000000c25d4106575be260
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello, friendly ping on this

On Mon, Jul 20, 2026 at 2:50=E2=80=AFPM Mark Yacoub <markyacoub@google.com>=
 wrote:

> Currently, libraries like unigraf explicitly rely on GKeyFile
> for reading configuration from .igtrc. Android builds do not
> natively supply glib, meaning these tools cannot be cleanly
> compiled.
>
> This patch abstracts config parsing into a dedicated `igt_rc` module.
> On standard Linux, `igt_rc` seamlessly wraps glib's native methods.
> On Android environments, `igt_rc` natively parses `.igtrc` using
> a stripped-down, thread-safe linked-list implementation
> (lib/android/igt_rc.c).
>
> v2:
>  - Drop the GKeyFile abstraction fakes from android/glib.h (Review
> feedback)
>  - Introduce a generic wrapper (igt_rc.h) instead of modifying glib.h.
>  - Provide a pure glib backend for Linux to avoid regressions.
>  - Isolate Android parsing implementation cleanly into
> lib/android/igt_rc.c.
> ---
>  lib/android/igt_rc.c         | 172 +++++++++++++++++++++++++++++++++++
>  lib/igt_rc.c                 |  61 +++++++++++++
>  lib/igt_rc.h                 |   5 +
>  lib/meson.build              |   1 +
>  lib/vendor/unigraf/unigraf.c |  92 ++++++++-----------
>  5 files changed, 279 insertions(+), 52 deletions(-)
>  create mode 100644 lib/android/igt_rc.c
>  create mode 100644 lib/igt_rc.c
>
> diff --git a/lib/android/igt_rc.c b/lib/android/igt_rc.c
> new file mode 100644
> index 000000000..6d9b348f7
> --- /dev/null
> +++ b/lib/android/igt_rc.c
> @@ -0,0 +1,172 @@
> +#include "igt_rc.h"
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <strings.h>
> +#include <ctype.h>
> +#include <pthread.h>
> +
> +struct igt_key_entry {
> +       char *group;
> +       char *key;
> +       char *value;
> +       struct igt_key_entry *next;
> +};
> +
> +static struct igt_key_entry *rc_entries =3D NULL;
> +static pthread_once_t rc_once_control =3D PTHREAD_ONCE_INIT;
> +
> +static char *trim_whitespace(char *str)
> +{
> +       char *end;
> +
> +       while (isspace((unsigned char)*str))
> +               str++;
> +
> +       if (*str =3D=3D 0)
> +               return str;
> +
> +       end =3D str + strlen(str) - 1;
> +       while (end > str && isspace((unsigned char)*end))
> +               end--;
> +
> +       end[1] =3D '\0';
> +       return str;
> +}
> +
> +static void load_igtrc_once(void)
> +{
> +       FILE *fp;
> +       char *line =3D NULL;
> +       size_t len =3D 0;
> +       ssize_t read;
> +       char *current_group =3D NULL;
> +       struct igt_key_entry *tail =3D NULL;
> +       char path[512];
> +
> +       snprintf(path, sizeof(path), "%s/.igtrc", "/data/local/tmp/igt");
> +
> +       fp =3D fopen(path, "r");
> +       if (!fp)
> +               return;
> +
> +       while ((read =3D getline(&line, &len, fp)) !=3D -1) {
> +               char *trimmed =3D trim_whitespace(line);
> +
> +               if (*trimmed =3D=3D '\0' || *trimmed =3D=3D '#' || *trimm=
ed =3D=3D ';')
> +                       continue;
> +
> +               if (trimmed[0] =3D=3D '[' && trimmed[strlen(trimmed) - 1]=
 =3D=3D
> ']') {
> +                       free(current_group);
> +                       trimmed[strlen(trimmed) - 1] =3D '\0';
> +                       current_group =3D strdup(trimmed + 1);
> +                       continue;
> +               }
> +
> +               if (current_group) {
> +                       char *eq =3D strchr(trimmed, '=3D');
> +
> +                       if (eq) {
> +                               char *key;
> +                               char *value;
> +                               struct igt_key_entry *entry;
> +
> +                               *eq =3D '\0';
> +                               key =3D trim_whitespace(trimmed);
> +                               value =3D trim_whitespace(eq + 1);
> +
> +                               entry =3D calloc(1, sizeof(*entry));
> +                               entry->group =3D strdup(current_group);
> +                               entry->key =3D strdup(key);
> +                               entry->value =3D strdup(value);
> +                               entry->next =3D NULL;
> +
> +                               if (!rc_entries) {
> +                                       rc_entries =3D entry;
> +                                       tail =3D entry;
> +                               } else {
> +                                       tail->next =3D entry;
> +                                       tail =3D entry;
> +                               }
> +                       }
> +               }
> +       }
> +
> +       free(current_group);
> +       free(line);
> +       fclose(fp);
> +}
> +
> +__attribute__((destructor))
> +static void free_igtrc(void)
> +{
> +       struct igt_key_entry *curr, *next;
> +
> +       curr =3D rc_entries;
> +       while (curr) {
> +               next =3D curr->next;
> +               free(curr->group);
> +               free(curr->key);
> +               free(curr->value);
> +               free(curr);
> +               curr =3D next;
> +       }
> +       rc_entries =3D NULL;
> +}
> +
> +char *igt_rc_get_string(const char *group_name, const char *key)
> +{
> +       char *last_match =3D NULL;
> +       struct igt_key_entry *curr;
> +
> +       pthread_once(&rc_once_control, load_igtrc_once);
> +
> +       curr =3D rc_entries;
> +       while (curr) {
> +               if (strcmp(curr->group, group_name) =3D=3D 0 &&
> strcmp(curr->key, key) =3D=3D 0)
> +                       last_match =3D curr->value;
> +               curr =3D curr->next;
> +       }
> +
> +       return last_match ? strdup(last_match) : NULL;
> +}
> +
> +bool igt_rc_get_boolean(const char *group_name, const char *key, bool
> *out)
> +{
> +       char *val =3D igt_rc_get_string(group_name, key);
> +
> +       if (!val)
> +               return false;
> +
> +       if (strcasecmp(val, "true") =3D=3D 0 || strcmp(val, "1") =3D=3D 0=
) {
> +               *out =3D true;
> +       } else if (strcasecmp(val, "false") =3D=3D 0 || strcmp(val, "0") =
=3D=3D 0)
> {
> +               *out =3D false;
> +       } else {
> +               free(val);
> +               return false;
> +       }
> +
> +       free(val);
> +       return true;
> +}
> +
> +int igt_rc_get_integer(const char *group_name, const char *key, int *out=
)
> +{
> +       char *val =3D igt_rc_get_string(group_name, key);
> +       char *endptr;
> +       long lval;
> +
> +       if (!val)
> +               return false;
> +
> +       lval =3D strtol(val, &endptr, 10);
> +       if (*endptr !=3D '\0') {
> +               free(val);
> +               return false;
> +       }
> +
> +       *out =3D (int)lval;
> +       free(val);
> +       return true;
> +}
> diff --git a/lib/igt_rc.c b/lib/igt_rc.c
> new file mode 100644
> index 000000000..31eb07bc0
> --- /dev/null
> +++ b/lib/igt_rc.c
> @@ -0,0 +1,61 @@
> +#include "igt_rc.h"
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <strings.h>
> +#include <ctype.h>
> +
> +#include <glib.h>
> +
> +char *igt_rc_get_string(const char *group_name, const char *key)
> +{
> +       GError *error =3D NULL;
> +       char *val;
> +
> +       if (!igt_key_file)
> +               return NULL;
> +
> +       val =3D g_key_file_get_string(igt_key_file, group_name, key, &err=
or);
> +       if (error) {
> +               g_error_free(error);
> +               return NULL;
> +       }
> +
> +       return val;
> +}
> +
> +bool igt_rc_get_boolean(const char *group_name, const char *key, bool
> *out)
> +{
> +       GError *error =3D NULL;
> +       gboolean val;
> +
> +       if (!igt_key_file)
> +               return false;
> +
> +       val =3D g_key_file_get_boolean(igt_key_file, group_name, key,
> &error);
> +       if (error) {
> +               g_error_free(error);
> +               return false;
> +       }
> +
> +       *out =3D val;
> +       return true;
> +}
> +
> +int igt_rc_get_integer(const char *group_name, const char *key, int *out=
)
> +{
> +       GError *error =3D NULL;
> +       int val;
> +
> +       if (!igt_key_file)
> +               return false;
> +
> +       val =3D g_key_file_get_integer(igt_key_file, group_name, key,
> &error);
> +       if (error) {
> +               g_error_free(error);
> +               return false;
> +       }
> +
> +       *out =3D val;
> +       return true;
> +}
> diff --git a/lib/igt_rc.h b/lib/igt_rc.h
> index d871b3b26..a0942f8d0 100644
> --- a/lib/igt_rc.h
> +++ b/lib/igt_rc.h
> @@ -1,3 +1,4 @@
> +#include <stdbool.h>
>  /*
>   * Copyright =C2=A9 2017 Intel Corporation
>   *
> @@ -33,4 +34,8 @@
>
>  extern GKeyFile *igt_key_file;
>
> +char *igt_rc_get_string(const char *group_name, const char *key);
> +bool igt_rc_get_boolean(const char *group_name, const char *key, bool
> *out);
> +int igt_rc_get_integer(const char *group_name, const char *key, int *out=
);
> +
>  #endif /* IGT_RC_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 8db9fffde..20c2f34d7 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -97,6 +97,7 @@ lib_sources =3D [
>         'igt_kms.c',
>         'igt_fb.c',
>         'igt_core.c',
> +       'igt_rc.c',
>         'igt_dir.c',
>         'igt_draw.c',
>         'igt_list.c',
> diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
> index 30ee3c72b..64268db34 100644
> --- a/lib/vendor/unigraf/unigraf.c
> +++ b/lib/vendor/unigraf/unigraf.c
> @@ -364,7 +364,6 @@ int unigraf_get_connector_id_by_stream(int drm_fd, in=
t
> stream_id)
>  bool unigraf_open_device(int drm_fd)
>  {
>         TSI_RESULT r;
> -       GError *cfg_error =3D NULL;
>         char *cfg_device =3D NULL;
>         char *cfg_role =3D NULL;
>         char *cfg_input =3D NULL;
> @@ -382,63 +381,52 @@ bool unigraf_open_device(int drm_fd)
>
>         unigraf_init();
>
> -       if (igt_key_file) {
> -               cfg_device =3D g_key_file_get_string(igt_key_file,
> UNIGRAF_CONFIG_GROUP,
> -
> UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
> -               if (cfg_error) {
> -                       unigraf_debug("No device name configured, uses
> first device available.\n");
> -                       cfg_device =3D NULL;
> -               }
> +       cfg_device =3D igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
> +                                      UNIGRAF_CONFIG_DEVICE_NAME);
> +       if (!cfg_device) {
> +               unigraf_debug("No device name configured, uses first
> device available.\n");
> +               cfg_device =3D NULL;
> +       }
>
> -               cfg_error =3D NULL;
> -               cfg_role =3D g_key_file_get_string(igt_key_file,
> UNIGRAF_CONFIG_GROUP,
> -
> UNIGRAF_CONFIG_DEVICE_ROLE, &cfg_error);
> -               if (cfg_error) {
> -                       unigraf_debug("No device role configured.\n");
> -                       cfg_role =3D NULL;
> -               }
> +       cfg_role =3D igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
> +                                    UNIGRAF_CONFIG_DEVICE_ROLE);
> +       if (!cfg_role) {
> +               unigraf_debug("No device role configured.\n");
> +               cfg_role =3D NULL;
> +       }
>
> -               cfg_error =3D NULL;
> -               cfg_input =3D g_key_file_get_string(igt_key_file,
> UNIGRAF_CONFIG_GROUP,
> -
>  UNIGRAF_CONFIG_INPUT_NAME, &cfg_error);
> -               if (cfg_error) {
> -                       unigraf_debug("No input name configured.\n");
> -                       cfg_input =3D NULL;
> -               }
> +       cfg_input =3D igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
> +                                     UNIGRAF_CONFIG_INPUT_NAME);
> +       if (!cfg_input) {
> +               unigraf_debug("No input name configured.\n");
> +               cfg_input =3D NULL;
> +       }
>
> -               cfg_error =3D NULL;
> -               unigraf_connector_name =3D
> g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
> -
> UNIGRAF_CONFIG_CONNECTOR_NAME,
> -                                                              &cfg_error=
);
> -               if (cfg_error) {
> -                       unigraf_debug("No connector name configured, will
> autodetect.\n");
> -                       unigraf_connector_name =3D NULL;
> -               }
> +       unigraf_connector_name =3D igt_rc_get_string(UNIGRAF_CONFIG_GROUP=
,
> +
> UNIGRAF_CONFIG_CONNECTOR_NAME);
> +       if (!unigraf_connector_name) {
> +               unigraf_debug("No connector name configured, will
> autodetect.\n");
> +               unigraf_connector_name =3D NULL;
> +       }
>
> -               cfg_error =3D NULL;
> -               cfg_edid_name =3D g_key_file_get_string(igt_key_file,
> UNIGRAF_CONFIG_GROUP,
> -
>  UNIGRAF_CONFIG_EDID_NAME, &cfg_error);
> -               if (cfg_error) {
> -                       unigraf_debug("No default EDID set, use IGT
> default.\n");
> -                       cfg_edid_name =3D NULL;
> -               }
> +       cfg_edid_name =3D igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
> +                                         UNIGRAF_CONFIG_EDID_NAME);
> +       if (!cfg_edid_name) {
> +               unigraf_debug("No default EDID set, use IGT default.\n");
> +               cfg_edid_name =3D NULL;
> +       }
>
> -               cfg_error =3D NULL;
> -               unigraf_crc =3D g_key_file_get_boolean(igt_key_file,
> UNIGRAF_CONFIG_GROUP,
> -
> UNIGRAF_CONFIG_USE_CRC_NAME, &cfg_error);
> -               if (cfg_error) {
> -                       unigraf_debug("CRC usage not configured, using
> unigraf CRC.\n");
> -                       unigraf_crc =3D true;
> -               }
> +       if (!igt_rc_get_boolean(UNIGRAF_CONFIG_GROUP,
> +                               UNIGRAF_CONFIG_USE_CRC_NAME,
> &unigraf_crc)) {
> +               unigraf_debug("CRC usage not configured, using unigraf
> CRC.\n");
> +               unigraf_crc =3D true;
> +       }
>
> -               cfg_error =3D NULL;
> -               unigraf_stream_count =3D
> g_key_file_get_integer(igt_key_file, UNIGRAF_CONFIG_GROUP,
> -
>  UNIGRAF_CONFIG_MST_STREAM_COUNT,
> -                                                             &cfg_error)=
;
> -               if (cfg_error) {
> -                       unigraf_debug("MST usage not configured, using
> SST.\n");
> -                       unigraf_stream_count =3D 0;
> -               }
> +       if (!igt_rc_get_integer(UNIGRAF_CONFIG_GROUP,
> +                               UNIGRAF_CONFIG_MST_STREAM_COUNT,
> +                               &unigraf_stream_count)) {
> +               unigraf_debug("MST usage not configured, using SST.\n");
> +               unigraf_stream_count =3D 0;
>         }
>
>         unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE=
,
> 0));
> --
> 2.55.0.229.g6434b31f56-goog
>
>

--000000000000c25d4106575be260
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+aGVsbG8sIGZyaWVuZGx5IHBpbmcgb24gdGhpczwvZGl2Pjxicj48ZGl2
IGNsYXNzPSJnbWFpbF9xdW90ZSBnbWFpbF9xdW90ZV9jb250YWluZXIiPjxkaXYgZGlyPSJsdHIi
IGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIEp1bCAyMCwgMjAyNiBhdCAyOjUw4oCvUE0gTWFy
ayBZYWNvdWIgJmx0OzxhIGhyZWY9Im1haWx0bzptYXJreWFjb3ViQGdvb2dsZS5jb20iPm1hcmt5
YWNvdWJAZ29vZ2xlLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFz
cz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxl
ZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+Q3VycmVudGx5
LCBsaWJyYXJpZXMgbGlrZSB1bmlncmFmIGV4cGxpY2l0bHkgcmVseSBvbiBHS2V5RmlsZTxicj4N
CmZvciByZWFkaW5nIGNvbmZpZ3VyYXRpb24gZnJvbSAuaWd0cmMuIEFuZHJvaWQgYnVpbGRzIGRv
IG5vdDxicj4NCm5hdGl2ZWx5IHN1cHBseSBnbGliLCBtZWFuaW5nIHRoZXNlIHRvb2xzIGNhbm5v
dCBiZSBjbGVhbmx5PGJyPg0KY29tcGlsZWQuPGJyPg0KPGJyPg0KVGhpcyBwYXRjaCBhYnN0cmFj
dHMgY29uZmlnIHBhcnNpbmcgaW50byBhIGRlZGljYXRlZCBgaWd0X3JjYCBtb2R1bGUuPGJyPg0K
T24gc3RhbmRhcmQgTGludXgsIGBpZ3RfcmNgIHNlYW1sZXNzbHkgd3JhcHMgZ2xpYiYjMzk7cyBu
YXRpdmUgbWV0aG9kcy48YnI+DQpPbiBBbmRyb2lkIGVudmlyb25tZW50cywgYGlndF9yY2AgbmF0
aXZlbHkgcGFyc2VzIGAuaWd0cmNgIHVzaW5nPGJyPg0KYSBzdHJpcHBlZC1kb3duLCB0aHJlYWQt
c2FmZSBsaW5rZWQtbGlzdCBpbXBsZW1lbnRhdGlvbiAobGliL2FuZHJvaWQvaWd0X3JjLmMpLjxi
cj4NCjxicj4NCnYyOjxicj4NCsKgLSBEcm9wIHRoZSBHS2V5RmlsZSBhYnN0cmFjdGlvbiBmYWtl
cyBmcm9tIGFuZHJvaWQvZ2xpYi5oIChSZXZpZXcgZmVlZGJhY2spPGJyPg0KwqAtIEludHJvZHVj
ZSBhIGdlbmVyaWMgd3JhcHBlciAoaWd0X3JjLmgpIGluc3RlYWQgb2YgbW9kaWZ5aW5nIGdsaWIu
aC48YnI+DQrCoC0gUHJvdmlkZSBhIHB1cmUgZ2xpYiBiYWNrZW5kIGZvciBMaW51eCB0byBhdm9p
ZCByZWdyZXNzaW9ucy48YnI+DQrCoC0gSXNvbGF0ZSBBbmRyb2lkIHBhcnNpbmcgaW1wbGVtZW50
YXRpb24gY2xlYW5seSBpbnRvIGxpYi9hbmRyb2lkL2lndF9yYy5jLjxicj4NCi0tLTxicj4NCsKg
bGliL2FuZHJvaWQvaWd0X3JjLmPCoCDCoCDCoCDCoCDCoHwgMTcyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrPGJyPg0KwqBsaWIvaWd0X3JjLmPCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHzCoCA2MSArKysrKysrKysrKysrPGJyPg0KwqBsaWIvaWd0X3JjLmjCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCDCoDUgKzxicj4NCsKgbGliL21lc29uLmJ1aWxkwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfMKgIMKgMSArPGJyPg0KwqBsaWIvdmVuZG9yL3VuaWdyYWYvdW5pZ3JhZi5j
IHzCoCA5MiArKysrKysrKy0tLS0tLS0tLS0tPGJyPg0KwqA1IGZpbGVzIGNoYW5nZWQsIDI3OSBp
bnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMoLSk8YnI+DQrCoGNyZWF0ZSBtb2RlIDEwMDY0NCBs
aWIvYW5kcm9pZC9pZ3RfcmMuYzxicj4NCsKgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9pZ3RfcmMu
Yzxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9saWIvYW5kcm9pZC9pZ3RfcmMuYyBiL2xpYi9hbmRy
b2lkL2lndF9yYy5jPGJyPg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQppbmRleCAwMDAwMDAw
MDAuLjZkOWIzNDhmNzxicj4NCi0tLSAvZGV2L251bGw8YnI+DQorKysgYi9saWIvYW5kcm9pZC9p
Z3RfcmMuYzxicj4NCkBAIC0wLDAgKzEsMTcyIEBAPGJyPg0KKyNpbmNsdWRlICZxdW90O2lndF9y
Yy5oJnF1b3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtzdGRpby5oJmd0Ozxicj4NCisjaW5jbHVkZSAm
bHQ7c3RkbGliLmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtzdHJpbmcuaCZndDs8YnI+DQorI2lu
Y2x1ZGUgJmx0O3N0cmluZ3MuaCZndDs8YnI+DQorI2luY2x1ZGUgJmx0O2N0eXBlLmgmZ3Q7PGJy
Pg0KKyNpbmNsdWRlICZsdDtwdGhyZWFkLmgmZ3Q7PGJyPg0KKzxicj4NCitzdHJ1Y3QgaWd0X2tl
eV9lbnRyeSB7PGJyPg0KK8KgIMKgIMKgIMKgY2hhciAqZ3JvdXA7PGJyPg0KK8KgIMKgIMKgIMKg
Y2hhciAqa2V5Ozxicj4NCivCoCDCoCDCoCDCoGNoYXIgKnZhbHVlOzxicj4NCivCoCDCoCDCoCDC
oHN0cnVjdCBpZ3Rfa2V5X2VudHJ5ICpuZXh0Ozxicj4NCit9Ozxicj4NCis8YnI+DQorc3RhdGlj
IHN0cnVjdCBpZ3Rfa2V5X2VudHJ5ICpyY19lbnRyaWVzID0gTlVMTDs8YnI+DQorc3RhdGljIHB0
aHJlYWRfb25jZV90IHJjX29uY2VfY29udHJvbCA9IFBUSFJFQURfT05DRV9JTklUOzxicj4NCis8
YnI+DQorc3RhdGljIGNoYXIgKnRyaW1fd2hpdGVzcGFjZShjaGFyICpzdHIpPGJyPg0KK3s8YnI+
DQorwqAgwqAgwqAgwqBjaGFyICplbmQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHdoaWxlIChp
c3NwYWNlKCh1bnNpZ25lZCBjaGFyKSpzdHIpKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHN0cisrOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoKnN0ciA9PSAwKTxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBzdHI7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGVu
ZCA9IHN0ciArIHN0cmxlbihzdHIpIC0gMTs8YnI+DQorwqAgwqAgwqAgwqB3aGlsZSAoZW5kICZn
dDsgc3RyICZhbXA7JmFtcDsgaXNzcGFjZSgodW5zaWduZWQgY2hhcikqZW5kKSk8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBlbmQtLTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZW5kWzFd
ID0gJiMzOTtcMCYjMzk7Ozxicj4NCivCoCDCoCDCoCDCoHJldHVybiBzdHI7PGJyPg0KK308YnI+
DQorPGJyPg0KK3N0YXRpYyB2b2lkIGxvYWRfaWd0cmNfb25jZSh2b2lkKTxicj4NCit7PGJyPg0K
K8KgIMKgIMKgIMKgRklMRSAqZnA7PGJyPg0KK8KgIMKgIMKgIMKgY2hhciAqbGluZSA9IE5VTEw7
PGJyPg0KK8KgIMKgIMKgIMKgc2l6ZV90IGxlbiA9IDA7PGJyPg0KK8KgIMKgIMKgIMKgc3NpemVf
dCByZWFkOzxicj4NCivCoCDCoCDCoCDCoGNoYXIgKmN1cnJlbnRfZ3JvdXAgPSBOVUxMOzxicj4N
CivCoCDCoCDCoCDCoHN0cnVjdCBpZ3Rfa2V5X2VudHJ5ICp0YWlsID0gTlVMTDs8YnI+DQorwqAg
wqAgwqAgwqBjaGFyIHBhdGhbNTEyXTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgc25wcmludGYo
cGF0aCwgc2l6ZW9mKHBhdGgpLCAmcXVvdDslcy8uaWd0cmMmcXVvdDssICZxdW90Oy9kYXRhL2xv
Y2FsL3RtcC9pZ3QmcXVvdDspOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBmcCA9IGZvcGVuKHBh
dGgsICZxdW90O3ImcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoGlmICghZnApPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB3aGlsZSAo
KHJlYWQgPSBnZXRsaW5lKCZhbXA7bGluZSwgJmFtcDtsZW4sIGZwKSkgIT0gLTEpIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjaGFyICp0cmltbWVkID0gdHJpbV93aGl0ZXNwYWNlKGxp
bmUpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoKnRyaW1tZWQgPT0g
JiMzOTtcMCYjMzk7IHx8ICp0cmltbWVkID09ICYjMzk7IyYjMzk7IHx8ICp0cmltbWVkID09ICYj
Mzk7OyYjMzk7KTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRp
bnVlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAodHJpbW1lZFswXSA9
PSAmIzM5O1smIzM5OyAmYW1wOyZhbXA7IHRyaW1tZWRbc3RybGVuKHRyaW1tZWQpIC0gMV0gPT0g
JiMzOTtdJiMzOTspIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBm
cmVlKGN1cnJlbnRfZ3JvdXApOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHRyaW1tZWRbc3RybGVuKHRyaW1tZWQpIC0gMV0gPSAmIzM5O1wwJiMzOTs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY3VycmVudF9ncm91cCA9IHN0cmR1cCh0
cmltbWVkICsgMSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29u
dGludWU7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZiAoY3VycmVudF9ncm91cCkgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNoYXIgKmVxID0gc3RyY2hyKHRyaW1tZWQsICYjMzk7PSYj
Mzk7KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYg
KGVxKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY2hhciAqa2V5Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNoYXIgKnZhbHVlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBpZ3Rfa2V5X2VudHJ5ICplbnRyeTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmVxID0g
JiMzOTtcMCYjMzk7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGtleSA9IHRyaW1fd2hpdGVzcGFjZSh0cmltbWVkKTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2YWx1ZSA9IHRyaW1fd2hpdGVz
cGFjZShlcSArIDEpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBlbnRyeSA9IGNhbGxvYygxLCBzaXplb2YoKmVudHJ5KSk7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZW50cnktJmd0
O2dyb3VwID0gc3RyZHVwKGN1cnJlbnRfZ3JvdXApOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVudHJ5LSZndDtrZXkgPSBzdHJkdXAoa2V5KTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbnRy
eS0mZ3Q7dmFsdWUgPSBzdHJkdXAodmFsdWUpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVudHJ5LSZndDtuZXh0ID0gTlVMTDs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFy
Y19lbnRyaWVzKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmNfZW50cmllcyA9IGVudHJ5Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRhaWwgPSBl
bnRyeTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9IGVsc2Ugezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHRhaWwtJmd0O25leHQgPSBlbnRyeTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0YWlsID0g
ZW50cnk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBmcmVlKGN1cnJlbnRfZ3JvdXApOzxicj4NCivCoCDCoCDCoCDCoGZyZWUobGluZSk7
PGJyPg0KK8KgIMKgIMKgIMKgZmNsb3NlKGZwKTs8YnI+DQorfTxicj4NCis8YnI+DQorX19hdHRy
aWJ1dGVfXygoZGVzdHJ1Y3RvcikpPGJyPg0KK3N0YXRpYyB2b2lkIGZyZWVfaWd0cmModm9pZCk8
YnI+DQorezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBpZ3Rfa2V5X2VudHJ5ICpjdXJyLCAqbmV4
dDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgY3VyciA9IHJjX2VudHJpZXM7PGJyPg0KK8KgIMKg
IMKgIMKgd2hpbGUgKGN1cnIpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuZXh0ID0g
Y3Vyci0mZ3Q7bmV4dDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmcmVlKGN1cnItJmd0
O2dyb3VwKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmcmVlKGN1cnItJmd0O2tleSk7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnJlZShjdXJyLSZndDt2YWx1ZSk7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnJlZShjdXJyKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjdXJyID0gbmV4dDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKg
cmNfZW50cmllcyA9IE5VTEw7PGJyPg0KK308YnI+DQorPGJyPg0KK2NoYXIgKmlndF9yY19nZXRf
c3RyaW5nKGNvbnN0IGNoYXIgKmdyb3VwX25hbWUsIGNvbnN0IGNoYXIgKmtleSk8YnI+DQorezxi
cj4NCivCoCDCoCDCoCDCoGNoYXIgKmxhc3RfbWF0Y2ggPSBOVUxMOzxicj4NCivCoCDCoCDCoCDC
oHN0cnVjdCBpZ3Rfa2V5X2VudHJ5ICpjdXJyOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBwdGhy
ZWFkX29uY2UoJmFtcDtyY19vbmNlX2NvbnRyb2wsIGxvYWRfaWd0cmNfb25jZSk7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoGN1cnIgPSByY19lbnRyaWVzOzxicj4NCivCoCDCoCDCoCDCoHdoaWxl
IChjdXJyKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHN0cmNtcChjdXJyLSZn
dDtncm91cCwgZ3JvdXBfbmFtZSkgPT0gMCAmYW1wOyZhbXA7IHN0cmNtcChjdXJyLSZndDtrZXks
IGtleSkgPT0gMCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYXN0
X21hdGNoID0gY3Vyci0mZ3Q7dmFsdWU7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY3Vy
ciA9IGN1cnItJmd0O25leHQ7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqByZXR1cm4gbGFzdF9tYXRjaCA/IHN0cmR1cChsYXN0X21hdGNoKSA6IE5VTEw7PGJyPg0K
K308YnI+DQorPGJyPg0KK2Jvb2wgaWd0X3JjX2dldF9ib29sZWFuKGNvbnN0IGNoYXIgKmdyb3Vw
X25hbWUsIGNvbnN0IGNoYXIgKmtleSwgYm9vbCAqb3V0KTxicj4NCit7PGJyPg0KK8KgIMKgIMKg
IMKgY2hhciAqdmFsID0gaWd0X3JjX2dldF9zdHJpbmcoZ3JvdXBfbmFtZSwga2V5KTs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCF2YWwpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmV0dXJuIGZhbHNlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoc3RyY2FzZWNtcCh2YWws
ICZxdW90O3RydWUmcXVvdDspID09IDAgfHwgc3RyY21wKHZhbCwgJnF1b3Q7MSZxdW90OykgPT0g
MCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCpvdXQgPSB0cnVlOzxicj4NCivCoCDC
oCDCoCDCoH0gZWxzZSBpZiAoc3RyY2FzZWNtcCh2YWwsICZxdW90O2ZhbHNlJnF1b3Q7KSA9PSAw
IHx8IHN0cmNtcCh2YWwsICZxdW90OzAmcXVvdDspID09IDApIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAqb3V0ID0gZmFsc2U7PGJyPg0KK8KgIMKgIMKgIMKgfSBlbHNlIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmcmVlKHZhbCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmV0dXJuIGZhbHNlOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgZnJlZSh2YWwpOzxicj4NCivCoCDCoCDCoCDCoHJldHVybiB0cnVlOzxicj4NCit9PGJy
Pg0KKzxicj4NCitpbnQgaWd0X3JjX2dldF9pbnRlZ2VyKGNvbnN0IGNoYXIgKmdyb3VwX25hbWUs
IGNvbnN0IGNoYXIgKmtleSwgaW50ICpvdXQpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBjaGFy
ICp2YWwgPSBpZ3RfcmNfZ2V0X3N0cmluZyhncm91cF9uYW1lLCBrZXkpOzxicj4NCivCoCDCoCDC
oCDCoGNoYXIgKmVuZHB0cjs8YnI+DQorwqAgwqAgwqAgwqBsb25nIGx2YWw7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoGlmICghdmFsKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVy
biBmYWxzZTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgbHZhbCA9IHN0cnRvbCh2YWwsICZhbXA7
ZW5kcHRyLCAxMCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCplbmRwdHIgIT0gJiMzOTtcMCYjMzk7
KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnJlZSh2YWwpOzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJldHVybiBmYWxzZTs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoCpvdXQgPSAoaW50KWx2YWw7PGJyPg0KK8KgIMKgIMKgIMKgZnJlZSh2
YWwpOzxicj4NCivCoCDCoCDCoCDCoHJldHVybiB0cnVlOzxicj4NCit9PGJyPg0KZGlmZiAtLWdp
dCBhL2xpYi9pZ3RfcmMuYyBiL2xpYi9pZ3RfcmMuYzxicj4NCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
PGJyPg0KaW5kZXggMDAwMDAwMDAwLi4zMWViMDdiYzA8YnI+DQotLS0gL2Rldi9udWxsPGJyPg0K
KysrIGIvbGliL2lndF9yYy5jPGJyPg0KQEAgLTAsMCArMSw2MSBAQDxicj4NCisjaW5jbHVkZSAm
cXVvdDtpZ3RfcmMuaCZxdW90Ozxicj4NCisjaW5jbHVkZSAmbHQ7c3RkaW8uaCZndDs8YnI+DQor
I2luY2x1ZGUgJmx0O3N0ZGxpYi5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7c3RyaW5nLmgmZ3Q7
PGJyPg0KKyNpbmNsdWRlICZsdDtzdHJpbmdzLmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtjdHlw
ZS5oJmd0Ozxicj4NCis8YnI+DQorI2luY2x1ZGUgJmx0O2dsaWIuaCZndDs8YnI+DQorPGJyPg0K
K2NoYXIgKmlndF9yY19nZXRfc3RyaW5nKGNvbnN0IGNoYXIgKmdyb3VwX25hbWUsIGNvbnN0IGNo
YXIgKmtleSk8YnI+DQorezxicj4NCivCoCDCoCDCoCDCoEdFcnJvciAqZXJyb3IgPSBOVUxMOzxi
cj4NCivCoCDCoCDCoCDCoGNoYXIgKnZhbDs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKCFp
Z3Rfa2V5X2ZpbGUpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIE5VTEw7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoHZhbCA9IGdfa2V5X2ZpbGVfZ2V0X3N0cmluZyhpZ3Rfa2V5
X2ZpbGUsIGdyb3VwX25hbWUsIGtleSwgJmFtcDtlcnJvcik7PGJyPg0KK8KgIMKgIMKgIMKgaWYg
KGVycm9yKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ19lcnJvcl9mcmVlKGVycm9y
KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gTlVMTDs8YnI+DQorwqAgwqAg
wqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJldHVybiB2YWw7PGJyPg0KK308YnI+DQor
PGJyPg0KK2Jvb2wgaWd0X3JjX2dldF9ib29sZWFuKGNvbnN0IGNoYXIgKmdyb3VwX25hbWUsIGNv
bnN0IGNoYXIgKmtleSwgYm9vbCAqb3V0KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgR0Vycm9y
ICplcnJvciA9IE5VTEw7PGJyPg0KK8KgIMKgIMKgIMKgZ2Jvb2xlYW4gdmFsOzxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqBpZiAoIWlndF9rZXlfZmlsZSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZXR1cm4gZmFsc2U7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHZhbCA9IGdfa2V5X2Zp
bGVfZ2V0X2Jvb2xlYW4oaWd0X2tleV9maWxlLCBncm91cF9uYW1lLCBrZXksICZhbXA7ZXJyb3Ip
Ozxicj4NCivCoCDCoCDCoCDCoGlmIChlcnJvcikgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdfZXJyb3JfZnJlZShlcnJvcik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
dXJuIGZhbHNlOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgKm91
dCA9IHZhbDs8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gdHJ1ZTs8YnI+DQorfTxicj4NCis8YnI+
DQoraW50IGlndF9yY19nZXRfaW50ZWdlcihjb25zdCBjaGFyICpncm91cF9uYW1lLCBjb25zdCBj
aGFyICprZXksIGludCAqb3V0KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgR0Vycm9yICplcnJv
ciA9IE5VTEw7PGJyPg0KK8KgIMKgIMKgIMKgaW50IHZhbDs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgaWYgKCFpZ3Rfa2V5X2ZpbGUpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJu
IGZhbHNlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqB2YWwgPSBnX2tleV9maWxlX2dldF9pbnRl
Z2VyKGlndF9rZXlfZmlsZSwgZ3JvdXBfbmFtZSwga2V5LCAmYW1wO2Vycm9yKTs8YnI+DQorwqAg
wqAgwqAgwqBpZiAoZXJyb3IpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnX2Vycm9y
X2ZyZWUoZXJyb3IpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBmYWxzZTs8
YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCpvdXQgPSB2YWw7PGJy
Pg0KK8KgIMKgIMKgIMKgcmV0dXJuIHRydWU7PGJyPg0KK308YnI+DQpkaWZmIC0tZ2l0IGEvbGli
L2lndF9yYy5oIGIvbGliL2lndF9yYy5oPGJyPg0KaW5kZXggZDg3MWIzYjI2Li5hMDk0MmY4ZDAg
MTAwNjQ0PGJyPg0KLS0tIGEvbGliL2lndF9yYy5oPGJyPg0KKysrIGIvbGliL2lndF9yYy5oPGJy
Pg0KQEAgLTEsMyArMSw0IEBAPGJyPg0KKyNpbmNsdWRlICZsdDtzdGRib29sLmgmZ3Q7PGJyPg0K
wqAvKjxicj4NCsKgICogQ29weXJpZ2h0IMKpIDIwMTcgSW50ZWwgQ29ycG9yYXRpb248YnI+DQrC
oCAqPGJyPg0KQEAgLTMzLDQgKzM0LDggQEA8YnI+DQo8YnI+DQrCoGV4dGVybiBHS2V5RmlsZSAq
aWd0X2tleV9maWxlOzxicj4NCjxicj4NCitjaGFyICppZ3RfcmNfZ2V0X3N0cmluZyhjb25zdCBj
aGFyICpncm91cF9uYW1lLCBjb25zdCBjaGFyICprZXkpOzxicj4NCitib29sIGlndF9yY19nZXRf
Ym9vbGVhbihjb25zdCBjaGFyICpncm91cF9uYW1lLCBjb25zdCBjaGFyICprZXksIGJvb2wgKm91
dCk7PGJyPg0KK2ludCBpZ3RfcmNfZ2V0X2ludGVnZXIoY29uc3QgY2hhciAqZ3JvdXBfbmFtZSwg
Y29uc3QgY2hhciAqa2V5LCBpbnQgKm91dCk7PGJyPg0KKzxicj4NCsKgI2VuZGlmIC8qIElHVF9S
Q19IICovPGJyPg0KZGlmZiAtLWdpdCBhL2xpYi9tZXNvbi5idWlsZCBiL2xpYi9tZXNvbi5idWls
ZDxicj4NCmluZGV4IDhkYjlmZmZkZS4uMjBjMmYzNGQ3IDEwMDY0NDxicj4NCi0tLSBhL2xpYi9t
ZXNvbi5idWlsZDxicj4NCisrKyBiL2xpYi9tZXNvbi5idWlsZDxicj4NCkBAIC05Nyw2ICs5Nyw3
IEBAIGxpYl9zb3VyY2VzID0gWzxicj4NCsKgIMKgIMKgIMKgICYjMzk7aWd0X2ttcy5jJiMzOTss
PGJyPg0KwqAgwqAgwqAgwqAgJiMzOTtpZ3RfZmIuYyYjMzk7LDxicj4NCsKgIMKgIMKgIMKgICYj
Mzk7aWd0X2NvcmUuYyYjMzk7LDxicj4NCivCoCDCoCDCoCDCoCYjMzk7aWd0X3JjLmMmIzM5Oyw8
YnI+DQrCoCDCoCDCoCDCoCAmIzM5O2lndF9kaXIuYyYjMzk7LDxicj4NCsKgIMKgIMKgIMKgICYj
Mzk7aWd0X2RyYXcuYyYjMzk7LDxicj4NCsKgIMKgIMKgIMKgICYjMzk7aWd0X2xpc3QuYyYjMzk7
LDxicj4NCmRpZmYgLS1naXQgYS9saWIvdmVuZG9yL3VuaWdyYWYvdW5pZ3JhZi5jIGIvbGliL3Zl
bmRvci91bmlncmFmL3VuaWdyYWYuYzxicj4NCmluZGV4IDMwZWUzYzcyYi4uNjQyNjhkYjM0IDEw
MDY0NDxicj4NCi0tLSBhL2xpYi92ZW5kb3IvdW5pZ3JhZi91bmlncmFmLmM8YnI+DQorKysgYi9s
aWIvdmVuZG9yL3VuaWdyYWYvdW5pZ3JhZi5jPGJyPg0KQEAgLTM2NCw3ICszNjQsNiBAQCBpbnQg
dW5pZ3JhZl9nZXRfY29ubmVjdG9yX2lkX2J5X3N0cmVhbShpbnQgZHJtX2ZkLCBpbnQgc3RyZWFt
X2lkKTxicj4NCsKgYm9vbCB1bmlncmFmX29wZW5fZGV2aWNlKGludCBkcm1fZmQpPGJyPg0KwqB7
PGJyPg0KwqAgwqAgwqAgwqAgVFNJX1JFU1VMVCByOzxicj4NCi3CoCDCoCDCoCDCoEdFcnJvciAq
Y2ZnX2Vycm9yID0gTlVMTDs8YnI+DQrCoCDCoCDCoCDCoCBjaGFyICpjZmdfZGV2aWNlID0gTlVM
TDs8YnI+DQrCoCDCoCDCoCDCoCBjaGFyICpjZmdfcm9sZSA9IE5VTEw7PGJyPg0KwqAgwqAgwqAg
wqAgY2hhciAqY2ZnX2lucHV0ID0gTlVMTDs8YnI+DQpAQCAtMzgyLDYzICszODEsNTIgQEAgYm9v
bCB1bmlncmFmX29wZW5fZGV2aWNlKGludCBkcm1fZmQpPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAg
dW5pZ3JhZl9pbml0KCk7PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgaWYgKGlndF9rZXlfZmlsZSkg
ezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNmZ19kZXZpY2UgPSBnX2tleV9maWxlX2dl
dF9zdHJpbmcoaWd0X2tleV9maWxlLCBVTklHUkFGX0NPTkZJR19HUk9VUCw8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgVU5JR1JBRl9DT05GSUdfREVWSUNFX05BTUUsICZhbXA7Y2ZnX2Vycm9yKTs8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoY2ZnX2Vycm9yKSB7PGJyPg0KLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5pZ3JhZl9kZWJ1ZygmcXVvdDtObyBkZXZp
Y2UgbmFtZSBjb25maWd1cmVkLCB1c2VzIGZpcnN0IGRldmljZSBhdmFpbGFibGUuXG4mcXVvdDsp
Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNmZ19kZXZpY2UgPSBO
VUxMOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqBjZmdf
ZGV2aWNlID0gaWd0X3JjX2dldF9zdHJpbmcoVU5JR1JBRl9DT05GSUdfR1JPVVAsPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFVO
SUdSQUZfQ09ORklHX0RFVklDRV9OQU1FKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAoIWNmZ19kZXZp
Y2UpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bmlncmFmX2RlYnVnKCZxdW90O05v
IGRldmljZSBuYW1lIGNvbmZpZ3VyZWQsIHVzZXMgZmlyc3QgZGV2aWNlIGF2YWlsYWJsZS5cbiZx
dW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2ZnX2RldmljZSA9IE5VTEw7PGJy
Pg0KK8KgIMKgIMKgIMKgfTxicj4NCjxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNmZ19l
cnJvciA9IE5VTEw7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2ZnX3JvbGUgPSBnX2tl
eV9maWxlX2dldF9zdHJpbmcoaWd0X2tleV9maWxlLCBVTklHUkFGX0NPTkZJR19HUk9VUCw8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgVU5JR1JBRl9DT05GSUdfREVWSUNFX1JPTEUsICZhbXA7Y2ZnX2Vy
cm9yKTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoY2ZnX2Vycm9yKSB7PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5pZ3JhZl9kZWJ1ZygmcXVvdDtO
byBkZXZpY2Ugcm9sZSBjb25maWd1cmVkLlxuJnF1b3Q7KTs8YnI+DQotwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjZmdfcm9sZSA9IE5VTEw7PGJyPg0KLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoGNmZ19yb2xlID0gaWd0X3JjX2dldF9zdHJpbmco
VU5JR1JBRl9DT05GSUdfR1JPVVAsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFVOSUdSQUZfQ09ORklHX0RFVklDRV9ST0xFKTs8YnI+
DQorwqAgwqAgwqAgwqBpZiAoIWNmZ19yb2xlKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdW5pZ3JhZl9kZWJ1ZygmcXVvdDtObyBkZXZpY2Ugcm9sZSBjb25maWd1cmVkLlxuJnF1b3Q7
KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjZmdfcm9sZSA9IE5VTEw7PGJyPg0KK8Kg
IMKgIMKgIMKgfTxicj4NCjxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNmZ19lcnJvciA9
IE5VTEw7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2ZnX2lucHV0ID0gZ19rZXlfZmls
ZV9nZXRfc3RyaW5nKGlndF9rZXlfZmlsZSwgVU5JR1JBRl9DT05GSUdfR1JPVVAsPGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgVU5JR1JBRl9DT05GSUdfSU5QVVRfTkFNRSwgJmFtcDtjZmdfZXJyb3Ip
Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChjZmdfZXJyb3IpIHs8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bmlncmFmX2RlYnVnKCZxdW90O05vIGlu
cHV0IG5hbWUgY29uZmlndXJlZC5cbiZxdW90Oyk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY2ZnX2lucHV0ID0gTlVMTDs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgY2ZnX2lucHV0ID0gaWd0X3JjX2dldF9zdHJpbmcoVU5J
R1JBRl9DT05GSUdfR1JPVVAsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVU5JR1JBRl9DT05GSUdfSU5QVVRfTkFNRSk7PGJyPg0K
K8KgIMKgIMKgIMKgaWYgKCFjZmdfaW5wdXQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB1bmlncmFmX2RlYnVnKCZxdW90O05vIGlucHV0IG5hbWUgY29uZmlndXJlZC5cbiZxdW90Oyk7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2ZnX2lucHV0ID0gTlVMTDs8YnI+DQorwqAg
wqAgwqAgwqB9PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2ZnX2Vycm9yID0g
TlVMTDs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bmlncmFmX2Nvbm5lY3Rvcl9uYW1l
ID0gZ19rZXlfZmlsZV9nZXRfc3RyaW5nKGlndF9rZXlfZmlsZSwgVU5JR1JBRl9DT05GSUdfR1JP
VVAsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFVOSUdSQUZfQ09O
RklHX0NPTk5FQ1RPUl9OQU1FLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAmYW1wO2NmZ19lcnJvcik7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGNm
Z19lcnJvcikgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuaWdy
YWZfZGVidWcoJnF1b3Q7Tm8gY29ubmVjdG9yIG5hbWUgY29uZmlndXJlZCwgd2lsbCBhdXRvZGV0
ZWN0LlxuJnF1b3Q7KTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1
bmlncmFmX2Nvbm5lY3Rvcl9uYW1lID0gTlVMTDs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9PGJyPg0KK8KgIMKgIMKgIMKgdW5pZ3JhZl9jb25uZWN0b3JfbmFtZSA9IGlndF9yY19nZXRf
c3RyaW5nKFVOSUdSQUZfQ09ORklHX0dST1VQLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBVTklH
UkFGX0NPTkZJR19DT05ORUNUT1JfTkFNRSk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCF1bmlncmFm
X2Nvbm5lY3Rvcl9uYW1lKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5pZ3JhZl9k
ZWJ1ZygmcXVvdDtObyBjb25uZWN0b3IgbmFtZSBjb25maWd1cmVkLCB3aWxsIGF1dG9kZXRlY3Qu
XG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuaWdyYWZfY29ubmVjdG9y
X25hbWUgPSBOVUxMOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQo8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjZmdfZXJyb3IgPSBOVUxMOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNmZ19lZGlkX25hbWUgPSBnX2tleV9maWxlX2dldF9zdHJpbmcoaWd0X2tleV9maWxlLCBVTklH
UkFGX0NPTkZJR19HUk9VUCw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBVTklHUkFGX0NP
TkZJR19FRElEX05BTUUsICZhbXA7Y2ZnX2Vycm9yKTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpZiAoY2ZnX2Vycm9yKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdW5pZ3JhZl9kZWJ1ZygmcXVvdDtObyBkZWZhdWx0IEVESUQgc2V0LCB1c2UgSUdUIGRl
ZmF1bHQuXG4mcXVvdDspOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNmZ19lZGlkX25hbWUgPSBOVUxMOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+
DQorwqAgwqAgwqAgwqBjZmdfZWRpZF9uYW1lID0gaWd0X3JjX2dldF9zdHJpbmcoVU5JR1JBRl9D
T05GSUdfR1JPVVAsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVU5JR1JBRl9DT05GSUdfRURJRF9OQU1FKTs8YnI+DQor
wqAgwqAgwqAgwqBpZiAoIWNmZ19lZGlkX25hbWUpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB1bmlncmFmX2RlYnVnKCZxdW90O05vIGRlZmF1bHQgRURJRCBzZXQsIHVzZSBJR1QgZGVm
YXVsdC5cbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2ZnX2VkaWRfbmFt
ZSA9IE5VTEw7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCjxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNmZ19lcnJvciA9IE5VTEw7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdW5p
Z3JhZl9jcmMgPSBnX2tleV9maWxlX2dldF9ib29sZWFuKGlndF9rZXlfZmlsZSwgVU5JR1JBRl9D
T05GSUdfR1JPVVAsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFVOSUdSQUZfQ09ORklHX1VT
RV9DUkNfTkFNRSwgJmFtcDtjZmdfZXJyb3IpOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGlmIChjZmdfZXJyb3IpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB1bmlncmFmX2RlYnVnKCZxdW90O0NSQyB1c2FnZSBub3QgY29uZmlndXJlZCwgdXNpbmcgdW5p
Z3JhZiBDUkMuXG4mcXVvdDspOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHVuaWdyYWZfY3JjID0gdHJ1ZTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJy
Pg0KK8KgIMKgIMKgIMKgaWYgKCFpZ3RfcmNfZ2V0X2Jvb2xlYW4oVU5JR1JBRl9DT05GSUdfR1JP
VVAsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
VU5JR1JBRl9DT05GSUdfVVNFX0NSQ19OQU1FLCAmYW1wO3VuaWdyYWZfY3JjKSkgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVuaWdyYWZfZGVidWcoJnF1b3Q7Q1JDIHVzYWdlIG5vdCBj
b25maWd1cmVkLCB1c2luZyB1bmlncmFmIENSQy5cbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgdW5pZ3JhZl9jcmMgPSB0cnVlOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQo8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjZmdfZXJyb3IgPSBOVUxMOzxicj4NCi3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHVuaWdyYWZfc3RyZWFtX2NvdW50ID0gZ19rZXlfZmlsZV9nZXRf
aW50ZWdlcihpZ3Rfa2V5X2ZpbGUsIFVOSUdSQUZfQ09ORklHX0dST1VQLDxicj4NCi3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFVOSUdSQUZfQ09ORklHX01TVF9TVFJFQU1fQ09V
TlQsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmFtcDtjZmdfZXJy
b3IpOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChjZmdfZXJyb3IpIHs8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bmlncmFmX2RlYnVnKCZxdW90O01T
VCB1c2FnZSBub3QgY29uZmlndXJlZCwgdXNpbmcgU1NULlxuJnF1b3Q7KTs8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bmlncmFmX3N0cmVhbV9jb3VudCA9IDA7PGJy
Pg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoGlmICghaWd0X3Jj
X2dldF9pbnRlZ2VyKFVOSUdSQUZfQ09ORklHX0dST1VQLDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFVOSUdSQUZfQ09ORklHX01TVF9TVFJFQU1f
Q09VTlQsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmFtcDt1bmlncmFmX3N0cmVhbV9jb3VudCkpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB1bmlncmFmX2RlYnVnKCZxdW90O01TVCB1c2FnZSBub3QgY29uZmlndXJlZCwgdXNpbmcg
U1NULlxuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1bmlncmFmX3N0cmVh
bV9jb3VudCA9IDA7PGJyPg0KwqAgwqAgwqAgwqAgfTxicj4NCjxicj4NCsKgIMKgIMKgIMKgIHVu
aWdyYWZfYXNzZXJ0KFRTSVhfREVWX1Jlc2NhbkRldmljZXMoMCwgVFNJX0RFVkNBUF9WSURFT19D
QVBUVVJFLCAwKSk7PGJyPg0KLS0gPGJyPg0KMi41NS4wLjIyOS5nNjQzNGIzMWY1Ni1nb29nPGJy
Pg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--000000000000c25d4106575be260--
