Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42990D185DD
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 12:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63F410E6F8;
	Thu,  8 Jan 2026 12:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvPFvQB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CF110E6F8
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767874139; x=1799410139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3dqxa2oBQ6auk/BbN4Iw7U7XuCIpJQMkg0p4sliTQF4=;
 b=SvPFvQB9XQUGGmhD2S8hLj3rU7Sf4/1V1hUsZWQu9X0d4HUnnPlNStoU
 WCf/1Xi8qOA+qaVyfLQuOCSUFN9z+Y4bHW9CdBGMI6aEPy12EQ37qQaa4
 G5ugFWuUNqxz6zEu2C6mF54lt3J2xyPzl+SyKstrGqkQTANi79oZkQzMC
 q5kHAZgne8pdWMZBqjnbSy/Q/buOq9x1b+t+zNSeeMvbl4WRRNpIfr79F
 CF10wMJ4iL6jUBqWHVG7k2aGTw6MMR65XJBqph9EwYT+wfqUfLuoq451L
 IjX9aZe7uH89fZmHzt9QukzoEqwStbL6XbWg+IHRYxz53n/CJlBuLlOOb w==;
X-CSE-ConnectionGUID: Dt+l4wPFS968hPxfN70yMA==
X-CSE-MsgGUID: /EwB5/bwRAqPMWIqnV5HIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73097298"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="73097298"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 04:08:59 -0800
X-CSE-ConnectionGUID: l5imCTXRSbylLFEXJtBzDA==
X-CSE-MsgGUID: v4IaB5EwR3qofiCmFGTmXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="233903390"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 04:08:58 -0800
Date: Thu, 8 Jan 2026 13:08:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, igt-dev@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Subject: Re: [RFC PATCH i-g-t 1/1] runner: add possibility to compress dmesgs
 inside json
Message-ID: <20260108120845.o34q2kszyy73pbky@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
 <20260107151004.327093-2-juhapekka.heikkila@gmail.com>
 <176780133253.14086.11727954615085076706@intel.com>
 <CAJ=qYWQ+Kq1egCr3U1rVCyo-jo57rzGUDyqF3Z30WRJ4-LmKYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ=qYWQ+Kq1egCr3U1rVCyo-jo57rzGUDyqF3Z30WRJ4-LmKYw@mail.gmail.com>
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

Hi Juha-Pekka,
On 2026-01-07 at 18:49:52 +0200, Juha-Pekka Heikkilä wrote:
> On Wed, Jan 7, 2026 at 5:55 PM Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> >
> > Quoting Juha-Pekka Heikkila (2026-01-07 12:10:04-03:00)
> > >Here added compress-js parameter for runner. What it does is at per test level
> >
> > Maybe rename it to --compress-json-dmesg to be more precise?

Can we have it an option for using outside compressor? Like:
--compress-with=xz

I tested both gzip and xz and the latter was even better.
zlib could be hold as a fall-through, when no on-system is
availabe or one given in option do not work.

> 
> Yea, that can be changed. I'm waiting to hear also from CI people, I
> could've gone and compressed those other fields too but I understood
> from CI people they want to keep things searchable, hence for now I
> did stick just with dmesg as those are always the biggest blobs.
> 

+cc Ryszard and Ewelina
Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>

> >
> > >for results.json in dmesg key is written text "compressed" to maintain
> > >compatibility and on the side of it is written new key dmesg-compressed which
> > >contain dmesg ran through zlib and base64 encoded.
> >
> > Should this be only about compressing dmesg for results.json? Or should
> > we take a step back and make it compress the dmesg files in the results
> > directory and then that would also be reflected in results.json?
> 
> That's a possibility; TBH I just didn't think about doing that at
> earlier stage. Idea on this anyway is to save space on CI storage.
> 

Compression is one possibility but it do not solve problem with
very big logs, like over 2GB. I was thinkning about cutting successfull
log into only begin+end lines of dmesg, so developers could find them
later in dmesg saved outside of json. Also it should be done for big ones,
not all of them.

Btw your idea is good for IGT gitlab issue:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/21
[IGT runner] allow attachments to results.json

and few others around it:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/22
[IGT runner] allow tests to attach test-specific results

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/14
[igt_runner] Collect pstore data and attach it to dmesg output when resuming or reporting

All of them rely on possibility to attach new files into results.

> >
> > By the way, do you know if we have good compression rate on existing
> > data?
> 
> On my super limited test with this change, with kms tests the overall
> size of json came down to around 1/6 of original size. I'll still need
> to experiment more with that.
> 

Hmm, let me test it on one sample where json itself was >= 2GB
and see if it could help.

Regards,
Kamil


> >
> > >
> > >Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > >---
> > > runner/resultgen.c    | 117 ++++++++++++++++++++++++++++++++++++------
> > > runner/runner_tests.c |   2 +
> > > runner/settings.c     |   7 +++
> > > runner/settings.h     |   1 +
> > > 4 files changed, 112 insertions(+), 15 deletions(-)
> > >
> > >diff --git a/runner/resultgen.c b/runner/resultgen.c
> > >index 1f7e79f24..ef6385598 100644
> > >--- a/runner/resultgen.c
> > >+++ b/runner/resultgen.c
> > >@@ -8,6 +8,7 @@
> > > #include <sys/stat.h>
> > > #include <sys/types.h>
> > > #include <unistd.h>
> > >+#include <zlib.h>
> > >
> > > #include <json.h>
> > >
> > >@@ -961,12 +962,61 @@ static void generate_formatted_dmesg_line(char *message,
> > >         *f = '\0';
> > > }
> > >
> > >+static struct json_object *encode_compressed_base64(const char *data, size_t len)
> > >+{
> > >+        uLongf destLen;
> > >+        unsigned char *dest;
> > >+        gchar *b64_text;
> > >+        struct json_object *obj;
> > >+
> > >+        if (len == 0)
> > >+                return NULL;
> > >+
> > >+        destLen = compressBound(len);
> > >+        dest = malloc(destLen);
> > >+
> > >+        if (!dest)
> > >+                return NULL;
> > >+
> > >+        if (compress(dest, &destLen, (const unsigned char*)data, len) != Z_OK) {
> > >+                free(dest);
> > >+                return NULL;
> > >+        }
> > >+
> > >+        b64_text = g_base64_encode((const guchar *)dest, (gsize)destLen);
> > >+        obj = json_object_new_string(b64_text);
> > >+
> > >+        g_free(b64_text);
> > >+        free(dest);
> > >+        return obj;
> > >+}
> > >+
> > > static void add_dmesg(struct json_object *obj,
> > >-                      const char *dmesg, size_t dmesglen,
> > >-                      const char *warnings, size_t warningslen)
> > >+                      struct settings *settings, const char *dmesg,
> > >+                      size_t dmesglen, const char *warnings, size_t warningslen)
> > > {
> > >-        json_object_object_add(obj, "dmesg",
> > >-                               new_escaped_json_string(dmesg, dmesglen));
> > >+        bool used_compression = false;
> > >+        struct json_object *compressed_obj;
> > >+
> > >+        if (settings && settings->compress_dmesg && dmesglen > 0) {
> > >+        compressed_obj = encode_compressed_base64(dmesg, dmesglen);
> > >+
> > >+                if (compressed_obj) {
> > >+                        json_object_object_add(obj, "dmesg",
> > >+                                               json_object_new_string("compressed"));
> >
> > Yep, this is not very useful, but can help avoid potential crashes of
> > existing tools that consume results.json today.  Nitpick: I would go
> > with "<compressed>" or "(compressed)".
> >
> > >+                        json_object_object_add(obj, "dmesg-compressed",
> > >+                                               compressed_obj);
> >
> > Maybe "dmesg-gz" or "dmesg.gz" to express the compression format?
> >
> > Another option is to have some key dedicated for that, e.g.:
> >
> >     "dmesg-compression": "gz",
> >     "dmesg-compressed": "...",
> >
> > This would allow other formats in the future.
> 
> Those format magics are normally in the beginning of the data and also
> here once decode base64, compression format becomes visible.
> 
> >
> > --
> > Gustavo Sousa
> >
> > >+                        used_compression = true;
> > >+                } else {
> > >+                        fprintf(stderr, "igt_resultgen: Compression failed, falling back to raw dmesg.\n");
> > >+                }
> > >+        }
> > >+
> > >+        /* If compression wasn't requested, or if it failed, write raw dmesg */
> > >+        if (!used_compression) {
> > >+                json_object_object_add(obj, "dmesg",
> > >+                                       new_escaped_json_string(dmesg, dmesglen));
> > >+        }
> > >
> > >         if (warnings) {
> > >                 json_object_object_add(obj, "dmesg-warnings",
> > >@@ -974,7 +1024,8 @@ static void add_dmesg(struct json_object *obj,
> > >         }
> > > }
> > >
> > >-static void add_empty_dmesgs_where_missing(struct json_object *tests,
> > >+static void add_empty_dmesgs_where_missing(struct settings *settings,
> > >+                                           struct json_object *tests,
> > >                                            char *binary,
> > >                                            struct subtest_list *subtests)
> > > {
> > >@@ -987,7 +1038,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
> > >                 generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
> > >                 current_test = get_or_create_json_object(tests, piglit_name);
> > >                 if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
> > >-                        add_dmesg(current_test, "", 0, NULL, 0);
> > >+                        add_dmesg(current_test, settings, "", 0, NULL, 0);
> > >                 }
> > >
> > >                 for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
> > >@@ -995,7 +1046,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
> > >                                                          dynamic_piglit_name, sizeof(dynamic_piglit_name));
> > >                         current_test = get_or_create_json_object(tests, dynamic_piglit_name);
> > >                         if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
> > >-                                add_dmesg(current_test, "", 0, NULL, 0);
> > >+                                add_dmesg(current_test, settings, "", 0, NULL, 0);
> > >                         }
> > >                 }
> > >         }
> > >@@ -1048,7 +1099,12 @@ static bool fill_from_dmesg(int fd,
> > >                 if ((subtest = strstr(message, STARTING_SUBTEST_DMESG)) != NULL) {
> > >                         if (current_test != NULL) {
> > >                                 /* Done with the previous subtest, file up */
> > >-                                add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
> > >+                                add_dmesg(current_test,
> > >+                                          settings,
> > >+                                          dmesg,
> > >+                                          dmesglen,
> > >+                                          warnings,
> > >+                                          warningslen);
> > >
> > >                                 free(dmesg);
> > >                                 free(warnings);
> > >@@ -1056,7 +1112,12 @@ static bool fill_from_dmesg(int fd,
> > >                                 dmesglen = warningslen = 0;
> > >
> > >                                 if (current_dynamic_test != NULL)
> > >-                                        add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
> > >+                                        add_dmesg(current_dynamic_test,
> > >+                                                  settings,
> > >+                                                  dynamic_dmesg,
> > >+                                                  dynamic_dmesg_len,
> > >+                                                  dynamic_warnings,
> > >+                                                  dynamic_warnings_len);
> > >
> > >                                 free(dynamic_dmesg);
> > >                                 free(dynamic_warnings);
> > >@@ -1075,7 +1136,12 @@ static bool fill_from_dmesg(int fd,
> > >                     (dynamic_subtest = strstr(message, STARTING_DYNAMIC_SUBTEST_DMESG)) != NULL) {
> > >                         if (current_dynamic_test != NULL) {
> > >                                 /* Done with the previous dynamic subtest, file up */
> > >-                                add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
> > >+                                add_dmesg(current_dynamic_test,
> > >+                                          settings,
> > >+                                          dynamic_dmesg,
> > >+                                          dynamic_dmesg_len,
> > >+                                          dynamic_warnings,
> > >+                                          dynamic_warnings_len);
> > >
> > >                                 free(dynamic_dmesg);
> > >                                 free(dynamic_warnings);
> > >@@ -1116,9 +1182,20 @@ static bool fill_from_dmesg(int fd,
> > >         free(line);
> > >
> > >         if (current_test != NULL) {
> > >-                add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
> > >+                add_dmesg(current_test,
> > >+                          settings,
> > >+                          dmesg,
> > >+                          dmesglen,
> > >+                          warnings,
> > >+                          warningslen);
> > >+
> > >                 if (current_dynamic_test != NULL) {
> > >-                        add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
> > >+                        add_dmesg(current_dynamic_test,
> > >+                                  settings,
> > >+                                  dynamic_dmesg,
> > >+                                  dynamic_dmesg_len,
> > >+                                  dynamic_warnings,
> > >+                                  dynamic_warnings_len);
> > >                 }
> > >         } else {
> > >                 /*
> > >@@ -1134,17 +1211,27 @@ static bool fill_from_dmesg(int fd,
> > >                          * there are would have skip as their result
> > >                          * anyway.
> > >                          */
> > >-                        add_dmesg(current_test, dmesg, dmesglen, NULL, 0);
> > >+                        add_dmesg(current_test,
> > >+                                  settings,
> > >+                                  dmesg,
> > >+                                  dmesglen,
> > >+                                  NULL,
> > >+                                  0);
> > >                 }
> > >
> > >                 if (subtests->size == 0) {
> > >                         generate_piglit_name(binary, NULL, piglit_name, sizeof(piglit_name));
> > >                         current_test = get_or_create_json_object(tests, piglit_name);
> > >-                        add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
> > >+                        add_dmesg(current_test,
> > >+                                  settings,
> > >+                                  dmesg,
> > >+                                  dmesglen,
> > >+                                  warnings,
> > >+                                  warningslen);
> > >                 }
> > >         }
> > >
> > >-        add_empty_dmesgs_where_missing(tests, binary, subtests);
> > >+        add_empty_dmesgs_where_missing(settings, tests, binary, subtests);
> > >
> > >         free(dmesg);
> > >         free(dynamic_dmesg);
> > >diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> > >index 908979982..3ea221ffa 100644
> > >--- a/runner/runner_tests.c
> > >+++ b/runner/runner_tests.c
> > >@@ -484,6 +484,7 @@ int igt_main()
> > >                                        "--collect-script", "/usr/bin/true",
> > >                                        "--hook", "echo hello",
> > >                                        "--hook", "echo world",
> > >+                                       "--compress-js",
> > >                                        "--prune-mode=keep-subtests",
> > >                                        "test-root-dir",
> > >                                        "path-to-results",
> > >@@ -1000,6 +1001,7 @@ int igt_main()
> > >                                                "--hook", "echo hello",
> > >                                                "--hook", "echo hello\necho newline",
> > >                                                "--hook", "echo hello\necho newline\\still the second line",
> > >+                                               "--compress-js",
> > >                                                testdatadir,
> > >                                                dirname,
> > >                         };
> > >diff --git a/runner/settings.c b/runner/settings.c
> > >index 3ccf71870..7d7320d62 100644
> > >--- a/runner/settings.c
> > >+++ b/runner/settings.c
> > >@@ -33,6 +33,7 @@ enum {
> > >         OPT_COV_RESULTS_PER_TEST,
> > >         OPT_HOOK,
> > >         OPT_HELP_HOOK,
> > >+        OPT_COMPRESS_JSON_DMESG,
> > >         OPT_VERSION,
> > >         OPT_PRUNE_MODE,
> > >         OPT_HELP = 'h',
> > >@@ -704,6 +705,7 @@ bool parse_options(int argc, char **argv,
> > >                 {"collect-script", required_argument, NULL, OPT_CODE_COV_SCRIPT},
> > >                 {"hook", required_argument, NULL, OPT_HOOK},
> > >                 {"help-hook", no_argument, NULL, OPT_HELP_HOOK},
> > >+                {"compress-js", no_argument, NULL, OPT_COMPRESS_JSON_DMESG},
> > >                 {"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
> > >                 {"inactivity-timeout", required_argument, NULL, OPT_TIMEOUT},
> > >                 {"per-test-timeout", required_argument, NULL, OPT_PER_TEST_TIMEOUT},
> > >@@ -815,6 +817,9 @@ bool parse_options(int argc, char **argv,
> > >                 case OPT_HELP_HOOK:
> > >                         igt_hook_print_help(stdout, "--hook");
> > >                         goto error;
> > >+                case OPT_COMPRESS_JSON_DMESG:
> > >+                        settings->compress_dmesg = true;
> > >+                        break;
> > >                 case OPT_MULTIPLE:
> > >                         settings->multiple_mode = true;
> > >                         break;
> > >@@ -1253,6 +1258,7 @@ bool serialize_settings(struct settings *settings)
> > >         SERIALIZE_INT(f, settings, enable_code_coverage);
> > >         SERIALIZE_INT(f, settings, cov_results_per_test);
> > >         SERIALIZE_STR(f, settings, code_coverage_script);
> > >+        SERIALIZE_INT(f, settings, compress_dmesg);
> > >         SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.argc);
> > >
> > >         if (settings->sync) {
> > >@@ -1371,6 +1377,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
> > >                 PARSE_INT(settings, name, val, enable_code_coverage);
> > >                 PARSE_INT(settings, name, val, cov_results_per_test);
> > >                 PARSE_STR(settings, name, val, code_coverage_script);
> > >+                PARSE_STR(settings, name, val, compress_dmesg);
> > >                 PARSE_STR_ARRAY(settings, name, val, cmdline.argv, cmdline.argc);
> > >
> > >                 printf("Warning: Unknown field in settings file: %s = %s\n",
> > >diff --git a/runner/settings.h b/runner/settings.h
> > >index 6c58c3282..09711c052 100644
> > >--- a/runner/settings.h
> > >+++ b/runner/settings.h
> > >@@ -81,6 +81,7 @@ struct settings {
> > >         char *code_coverage_script;
> > >         bool enable_code_coverage;
> > >         bool cov_results_per_test;
> > >+        bool compress_dmesg;
> > >         struct {
> > >                 int argc;
> > >                 char **argv;
> > >--
> > >2.43.0
> > >
