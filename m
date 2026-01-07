Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A70D0D142
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 16:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048D210E2A9;
	Wed,  7 Jan 2026 16:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ks8r7sGD";
	dkim-atps=neutral
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB7010E2A9
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 16:50:05 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-34c30f0f12eso1491004a91.1
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jan 2026 08:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767804605; x=1768409405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WAK5Dd5OOF5uTYhf8CM8dseXuf4shNxwikU33JAxTaY=;
 b=ks8r7sGDd0xa9cl7l8SlUn7lrFko5ZaRYvVutHGWm19qifmS/cseQ8jINIJuKs7pCB
 3TkcKQdMJRykmKfxB+G7OWo/+f/xLNOvryWYSy+W0XdsZQWTjzGyBTf+vijFtlBn7OQW
 apfQmTLMwVB/2NEG0yFVlb+gDgv5DrxSzVkGBZWZxAScBmA+cxRyH4q/WIj/RLqpuTaB
 Ze6WLTEbVh/UEHGDt9RZIGEtqqH07dgFv4iekVF0IVnEYJJt4+klE7jWuk1KCANWXtkn
 KbzbZNTMBZ8sxYcK91AzGgcC6DitIl2G2DlIP5VK1ORCohxLDRph92EAxcVw/znny4DB
 dOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767804605; x=1768409405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WAK5Dd5OOF5uTYhf8CM8dseXuf4shNxwikU33JAxTaY=;
 b=B0boaPtLz95AaL+KutmLNU3x9OzLL4p7HPZIKWZU9eRflVFO+dKq4EhUJA0dpm5hrz
 YA98ZR3kW5wxB8ahNP+B/HTtV179nMmbHEPNa+yadBWMyNEHTUWiY13Q1l/BvGVISaQv
 Fes+Ut7rAOQNmL/WZsbEOL30my6Mx3qEUsQDOltXBAHmVNlEuxtb6TapFqLbFPEk7uMG
 DTIJXXX2+GPG5ctDyOTuCgjcDem+maf91yeCFoZyHRkJwkBqD6TRsILziScZA0Un/hdN
 +9JV61cOaM3rxPDKzjdhyCsfdubGbW+rWkcRdQCCqrXplzoTGDiRv2Axr+GLMwum8NGf
 9ODA==
X-Gm-Message-State: AOJu0YxfQNPkAndzfcHt62VTdpoXmDbEZb+o4p9/VwuEo6FU2/ovaclA
 AOTSOW86twUzPg+3ahk0H5yx6/2Kf6kJGa89AxyDB809qj01xXBKIm65Dwj5vxFPJ//nEkWz6vm
 YTKQIk74gPzMA8A+VR9zZSjiFCappwrf5g+NKbaPviA==
X-Gm-Gg: AY/fxX669oXClo6Fa55luhmdZBqXTK45iokmKGT5GZvX7gnmOHGUnaTMbtFQMIpkbPv
 A2tsBlKZT0uddXo8PXDobHMuX0ZL3PcVJij65iNRSLmmiSRqMNZSyIuTqd1kvTNHHmypIXwI6Gj
 QCjvLS1Y8wEhHuPJL/083XUWq99cYolEQ8gCKx1Dfo0zF+tdPtYe+iGZ8wgGYEJlqR+3rRRN5Mw
 MctajTj/yVAOzpKnpy3muhgdMUUwTHFKscrQED6YuN00sGLczuj8XClohzlZ7AHRA3YMz/6CULa
 /ZKyVrZ07oUSFXyHx0nxnejkG6aIqB4PEgGW/W82
X-Google-Smtp-Source: AGHT+IGFQ1YXrJvwIMA61Q2bnw5sivok0ydBZgWHjzar/Ll4C83cffocwEVyTK/eL8lwVNU2OORlXwJEdxcsLQy53t4=
X-Received: by 2002:a17:90b:5546:b0:321:9366:5865 with SMTP id
 98e67ed59e1d1-34f68c479a3mr2559275a91.33.1767804604588; Wed, 07 Jan 2026
 08:50:04 -0800 (PST)
MIME-Version: 1.0
References: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
 <20260107151004.327093-2-juhapekka.heikkila@gmail.com>
 <176780133253.14086.11727954615085076706@intel.com>
In-Reply-To: <176780133253.14086.11727954615085076706@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 7 Jan 2026 18:49:52 +0200
X-Gm-Features: AQt7F2p-W7V0qkm-8bAjExFboNEVKmP9ggyPOhmZBcnjZ6P-NNQ3PEvHQUZaUu4
Message-ID: <CAJ=qYWQ+Kq1egCr3U1rVCyo-jo57rzGUDyqF3Z30WRJ4-LmKYw@mail.gmail.com>
Subject: Re: [RFC PATCH i-g-t 1/1] runner: add possibility to compress dmesgs
 inside json
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jan 7, 2026 at 5:55=E2=80=AFPM Gustavo Sousa <gustavo.sousa@intel.c=
om> wrote:
>
> Quoting Juha-Pekka Heikkila (2026-01-07 12:10:04-03:00)
> >Here added compress-js parameter for runner. What it does is at per test=
 level
>
> Maybe rename it to --compress-json-dmesg to be more precise?

Yea, that can be changed. I'm waiting to hear also from CI people, I
could've gone and compressed those other fields too but I understood
from CI people they want to keep things searchable, hence for now I
did stick just with dmesg as those are always the biggest blobs.

>
> >for results.json in dmesg key is written text "compressed" to maintain
> >compatibility and on the side of it is written new key dmesg-compressed =
which
> >contain dmesg ran through zlib and base64 encoded.
>
> Should this be only about compressing dmesg for results.json? Or should
> we take a step back and make it compress the dmesg files in the results
> directory and then that would also be reflected in results.json?

That's a possibility; TBH I just didn't think about doing that at
earlier stage. Idea on this anyway is to save space on CI storage.

>
> By the way, do you know if we have good compression rate on existing
> data?

On my super limited test with this change, with kms tests the overall
size of json came down to around 1/6 of original size. I'll still need
to experiment more with that.

>
> >
> >Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> >---
> > runner/resultgen.c    | 117 ++++++++++++++++++++++++++++++++++++------
> > runner/runner_tests.c |   2 +
> > runner/settings.c     |   7 +++
> > runner/settings.h     |   1 +
> > 4 files changed, 112 insertions(+), 15 deletions(-)
> >
> >diff --git a/runner/resultgen.c b/runner/resultgen.c
> >index 1f7e79f24..ef6385598 100644
> >--- a/runner/resultgen.c
> >+++ b/runner/resultgen.c
> >@@ -8,6 +8,7 @@
> > #include <sys/stat.h>
> > #include <sys/types.h>
> > #include <unistd.h>
> >+#include <zlib.h>
> >
> > #include <json.h>
> >
> >@@ -961,12 +962,61 @@ static void generate_formatted_dmesg_line(char *me=
ssage,
> >         *f =3D '\0';
> > }
> >
> >+static struct json_object *encode_compressed_base64(const char *data, s=
ize_t len)
> >+{
> >+        uLongf destLen;
> >+        unsigned char *dest;
> >+        gchar *b64_text;
> >+        struct json_object *obj;
> >+
> >+        if (len =3D=3D 0)
> >+                return NULL;
> >+
> >+        destLen =3D compressBound(len);
> >+        dest =3D malloc(destLen);
> >+
> >+        if (!dest)
> >+                return NULL;
> >+
> >+        if (compress(dest, &destLen, (const unsigned char*)data, len) !=
=3D Z_OK) {
> >+                free(dest);
> >+                return NULL;
> >+        }
> >+
> >+        b64_text =3D g_base64_encode((const guchar *)dest, (gsize)destL=
en);
> >+        obj =3D json_object_new_string(b64_text);
> >+
> >+        g_free(b64_text);
> >+        free(dest);
> >+        return obj;
> >+}
> >+
> > static void add_dmesg(struct json_object *obj,
> >-                      const char *dmesg, size_t dmesglen,
> >-                      const char *warnings, size_t warningslen)
> >+                      struct settings *settings, const char *dmesg,
> >+                      size_t dmesglen, const char *warnings, size_t war=
ningslen)
> > {
> >-        json_object_object_add(obj, "dmesg",
> >-                               new_escaped_json_string(dmesg, dmesglen)=
);
> >+        bool used_compression =3D false;
> >+        struct json_object *compressed_obj;
> >+
> >+        if (settings && settings->compress_dmesg && dmesglen > 0) {
> >+        compressed_obj =3D encode_compressed_base64(dmesg, dmesglen);
> >+
> >+                if (compressed_obj) {
> >+                        json_object_object_add(obj, "dmesg",
> >+                                               json_object_new_string("=
compressed"));
>
> Yep, this is not very useful, but can help avoid potential crashes of
> existing tools that consume results.json today.  Nitpick: I would go
> with "<compressed>" or "(compressed)".
>
> >+                        json_object_object_add(obj, "dmesg-compressed",
> >+                                               compressed_obj);
>
> Maybe "dmesg-gz" or "dmesg.gz" to express the compression format?
>
> Another option is to have some key dedicated for that, e.g.:
>
>     "dmesg-compression": "gz",
>     "dmesg-compressed": "...",
>
> This would allow other formats in the future.

Those format magics are normally in the beginning of the data and also
here once decode base64, compression format becomes visible.

>
> --
> Gustavo Sousa
>
> >+                        used_compression =3D true;
> >+                } else {
> >+                        fprintf(stderr, "igt_resultgen: Compression fai=
led, falling back to raw dmesg.\n");
> >+                }
> >+        }
> >+
> >+        /* If compression wasn't requested, or if it failed, write raw =
dmesg */
> >+        if (!used_compression) {
> >+                json_object_object_add(obj, "dmesg",
> >+                                       new_escaped_json_string(dmesg, d=
mesglen));
> >+        }
> >
> >         if (warnings) {
> >                 json_object_object_add(obj, "dmesg-warnings",
> >@@ -974,7 +1024,8 @@ static void add_dmesg(struct json_object *obj,
> >         }
> > }
> >
> >-static void add_empty_dmesgs_where_missing(struct json_object *tests,
> >+static void add_empty_dmesgs_where_missing(struct settings *settings,
> >+                                           struct json_object *tests,
> >                                            char *binary,
> >                                            struct subtest_list *subtest=
s)
> > {
> >@@ -987,7 +1038,7 @@ static void add_empty_dmesgs_where_missing(struct j=
son_object *tests,
> >                 generate_piglit_name(binary, subtests->subs[i].name, pi=
glit_name, sizeof(piglit_name));
> >                 current_test =3D get_or_create_json_object(tests, pigli=
t_name);
> >                 if (!json_object_object_get_ex(current_test, "dmesg", N=
ULL)) {
> >-                        add_dmesg(current_test, "", 0, NULL, 0);
> >+                        add_dmesg(current_test, settings, "", 0, NULL, =
0);
> >                 }
> >
> >                 for (k =3D 0; k < subtests->subs[i].dynamic_size; k++) =
{
> >@@ -995,7 +1046,7 @@ static void add_empty_dmesgs_where_missing(struct j=
son_object *tests,
> >                                                          dynamic_piglit=
_name, sizeof(dynamic_piglit_name));
> >                         current_test =3D get_or_create_json_object(test=
s, dynamic_piglit_name);
> >                         if (!json_object_object_get_ex(current_test, "d=
mesg", NULL)) {
> >-                                add_dmesg(current_test, "", 0, NULL, 0)=
;
> >+                                add_dmesg(current_test, settings, "", 0=
, NULL, 0);
> >                         }
> >                 }
> >         }
> >@@ -1048,7 +1099,12 @@ static bool fill_from_dmesg(int fd,
> >                 if ((subtest =3D strstr(message, STARTING_SUBTEST_DMESG=
)) !=3D NULL) {
> >                         if (current_test !=3D NULL) {
> >                                 /* Done with the previous subtest, file=
 up */
> >-                                add_dmesg(current_test, dmesg, dmesglen=
, warnings, warningslen);
> >+                                add_dmesg(current_test,
> >+                                          settings,
> >+                                          dmesg,
> >+                                          dmesglen,
> >+                                          warnings,
> >+                                          warningslen);
> >
> >                                 free(dmesg);
> >                                 free(warnings);
> >@@ -1056,7 +1112,12 @@ static bool fill_from_dmesg(int fd,
> >                                 dmesglen =3D warningslen =3D 0;
> >
> >                                 if (current_dynamic_test !=3D NULL)
> >-                                        add_dmesg(current_dynamic_test,=
 dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
> >+                                        add_dmesg(current_dynamic_test,
> >+                                                  settings,
> >+                                                  dynamic_dmesg,
> >+                                                  dynamic_dmesg_len,
> >+                                                  dynamic_warnings,
> >+                                                  dynamic_warnings_len)=
;
> >
> >                                 free(dynamic_dmesg);
> >                                 free(dynamic_warnings);
> >@@ -1075,7 +1136,12 @@ static bool fill_from_dmesg(int fd,
> >                     (dynamic_subtest =3D strstr(message, STARTING_DYNAM=
IC_SUBTEST_DMESG)) !=3D NULL) {
> >                         if (current_dynamic_test !=3D NULL) {
> >                                 /* Done with the previous dynamic subte=
st, file up */
> >-                                add_dmesg(current_dynamic_test, dynamic=
_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
> >+                                add_dmesg(current_dynamic_test,
> >+                                          settings,
> >+                                          dynamic_dmesg,
> >+                                          dynamic_dmesg_len,
> >+                                          dynamic_warnings,
> >+                                          dynamic_warnings_len);
> >
> >                                 free(dynamic_dmesg);
> >                                 free(dynamic_warnings);
> >@@ -1116,9 +1182,20 @@ static bool fill_from_dmesg(int fd,
> >         free(line);
> >
> >         if (current_test !=3D NULL) {
> >-                add_dmesg(current_test, dmesg, dmesglen, warnings, warn=
ingslen);
> >+                add_dmesg(current_test,
> >+                          settings,
> >+                          dmesg,
> >+                          dmesglen,
> >+                          warnings,
> >+                          warningslen);
> >+
> >                 if (current_dynamic_test !=3D NULL) {
> >-                        add_dmesg(current_dynamic_test, dynamic_dmesg, =
dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
> >+                        add_dmesg(current_dynamic_test,
> >+                                  settings,
> >+                                  dynamic_dmesg,
> >+                                  dynamic_dmesg_len,
> >+                                  dynamic_warnings,
> >+                                  dynamic_warnings_len);
> >                 }
> >         } else {
> >                 /*
> >@@ -1134,17 +1211,27 @@ static bool fill_from_dmesg(int fd,
> >                          * there are would have skip as their result
> >                          * anyway.
> >                          */
> >-                        add_dmesg(current_test, dmesg, dmesglen, NULL, =
0);
> >+                        add_dmesg(current_test,
> >+                                  settings,
> >+                                  dmesg,
> >+                                  dmesglen,
> >+                                  NULL,
> >+                                  0);
> >                 }
> >
> >                 if (subtests->size =3D=3D 0) {
> >                         generate_piglit_name(binary, NULL, piglit_name,=
 sizeof(piglit_name));
> >                         current_test =3D get_or_create_json_object(test=
s, piglit_name);
> >-                        add_dmesg(current_test, dmesg, dmesglen, warnin=
gs, warningslen);
> >+                        add_dmesg(current_test,
> >+                                  settings,
> >+                                  dmesg,
> >+                                  dmesglen,
> >+                                  warnings,
> >+                                  warningslen);
> >                 }
> >         }
> >
> >-        add_empty_dmesgs_where_missing(tests, binary, subtests);
> >+        add_empty_dmesgs_where_missing(settings, tests, binary, subtest=
s);
> >
> >         free(dmesg);
> >         free(dynamic_dmesg);
> >diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> >index 908979982..3ea221ffa 100644
> >--- a/runner/runner_tests.c
> >+++ b/runner/runner_tests.c
> >@@ -484,6 +484,7 @@ int igt_main()
> >                                        "--collect-script", "/usr/bin/tr=
ue",
> >                                        "--hook", "echo hello",
> >                                        "--hook", "echo world",
> >+                                       "--compress-js",
> >                                        "--prune-mode=3Dkeep-subtests",
> >                                        "test-root-dir",
> >                                        "path-to-results",
> >@@ -1000,6 +1001,7 @@ int igt_main()
> >                                                "--hook", "echo hello",
> >                                                "--hook", "echo hello\ne=
cho newline",
> >                                                "--hook", "echo hello\ne=
cho newline\\still the second line",
> >+                                               "--compress-js",
> >                                                testdatadir,
> >                                                dirname,
> >                         };
> >diff --git a/runner/settings.c b/runner/settings.c
> >index 3ccf71870..7d7320d62 100644
> >--- a/runner/settings.c
> >+++ b/runner/settings.c
> >@@ -33,6 +33,7 @@ enum {
> >         OPT_COV_RESULTS_PER_TEST,
> >         OPT_HOOK,
> >         OPT_HELP_HOOK,
> >+        OPT_COMPRESS_JSON_DMESG,
> >         OPT_VERSION,
> >         OPT_PRUNE_MODE,
> >         OPT_HELP =3D 'h',
> >@@ -704,6 +705,7 @@ bool parse_options(int argc, char **argv,
> >                 {"collect-script", required_argument, NULL, OPT_CODE_CO=
V_SCRIPT},
> >                 {"hook", required_argument, NULL, OPT_HOOK},
> >                 {"help-hook", no_argument, NULL, OPT_HELP_HOOK},
> >+                {"compress-js", no_argument, NULL, OPT_COMPRESS_JSON_DM=
ESG},
> >                 {"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
> >                 {"inactivity-timeout", required_argument, NULL, OPT_TIM=
EOUT},
> >                 {"per-test-timeout", required_argument, NULL, OPT_PER_T=
EST_TIMEOUT},
> >@@ -815,6 +817,9 @@ bool parse_options(int argc, char **argv,
> >                 case OPT_HELP_HOOK:
> >                         igt_hook_print_help(stdout, "--hook");
> >                         goto error;
> >+                case OPT_COMPRESS_JSON_DMESG:
> >+                        settings->compress_dmesg =3D true;
> >+                        break;
> >                 case OPT_MULTIPLE:
> >                         settings->multiple_mode =3D true;
> >                         break;
> >@@ -1253,6 +1258,7 @@ bool serialize_settings(struct settings *settings)
> >         SERIALIZE_INT(f, settings, enable_code_coverage);
> >         SERIALIZE_INT(f, settings, cov_results_per_test);
> >         SERIALIZE_STR(f, settings, code_coverage_script);
> >+        SERIALIZE_INT(f, settings, compress_dmesg);
> >         SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.argc);
> >
> >         if (settings->sync) {
> >@@ -1371,6 +1377,7 @@ bool read_settings_from_file(struct settings *sett=
ings, FILE *f)
> >                 PARSE_INT(settings, name, val, enable_code_coverage);
> >                 PARSE_INT(settings, name, val, cov_results_per_test);
> >                 PARSE_STR(settings, name, val, code_coverage_script);
> >+                PARSE_STR(settings, name, val, compress_dmesg);
> >                 PARSE_STR_ARRAY(settings, name, val, cmdline.argv, cmdl=
ine.argc);
> >
> >                 printf("Warning: Unknown field in settings file: %s =3D=
 %s\n",
> >diff --git a/runner/settings.h b/runner/settings.h
> >index 6c58c3282..09711c052 100644
> >--- a/runner/settings.h
> >+++ b/runner/settings.h
> >@@ -81,6 +81,7 @@ struct settings {
> >         char *code_coverage_script;
> >         bool enable_code_coverage;
> >         bool cov_results_per_test;
> >+        bool compress_dmesg;
> >         struct {
> >                 int argc;
> >                 char **argv;
> >--
> >2.43.0
> >
