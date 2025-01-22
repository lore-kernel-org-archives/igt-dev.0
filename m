Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4EBC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 18:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6E810E73C;
	Wed, 22 Jan 2025 18:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RP1YKw6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DAD10E72D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 18:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737569824; x=1769105824;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=whSeMWehx9GTOjVNZvJvvxmoEYEg3yVvA8A5zK/2Xhs=;
 b=RP1YKw6FTT2DCbNMnan+/Xc4lxWFxPxGycFcSV32Zug9hRrg8fhJAKmg
 CcxepkIONnfUcicGWlfWLEHiFd60HdYVnGxQo8/mKB2SbI4ulNj7AkuFT
 XTkXSOK1WhO0UOy69/4ilHV5J123cjjxLFUATIs04hIi4wDuplyT9uTy+
 Q9VjdHh/cCVqP22CBWHspb1Lx4VchYb9JWKUBd/chDTJ8WHe7y+06lvzt
 wQB6MkYO9ZcVoDQVFPVsIzbUS1pZdBz4XPgei7snk+9rxoXcKzvNtTJhX
 zI5ullr2kv8PwuOYCr00KaSBjsMOmdO/KJlYJGcXkJjur9uQAnANIQy9v A==;
X-CSE-ConnectionGUID: DP73GVdJQXuWrc0AhlxiLg==
X-CSE-MsgGUID: hk1+/8CGTjKO267PB11cTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38146008"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38146008"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 10:17:04 -0800
X-CSE-ConnectionGUID: HoTylZIZSP+qL063nHai9g==
X-CSE-MsgGUID: gZvOai9rRBeNtSV5NYDQ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111859620"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 10:17:02 -0800
Message-ID: <e740cbcf-7794-4b2f-866b-49c265f701b1@linux.intel.com>
Date: Wed, 22 Jan 2025 19:16:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
 <173754961509.5500.8834900644999128777@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173754961509.5500.8834900644999128777@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 22.01.2025 13:40, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2025-01-21 19:57:32-03:00)
>> Serialize the command line to metadata.txt. The expected format in the
>> metadata.txt is like below:
>>
>>        cmdline.argc : 6
>>        cmdline.argv[0] : ./build/runner/igt_runner
>>        cmdline.argv[1] : -o
>>        cmdline.argv[2] : --test-list
>>        cmdline.argv[3] : /tmp/testlist.txt
>>        cmdline.argv[4] : build/tests/
>>        cmdline.argv[5] : /tmp/results
> 
> One limitation here is that we would run into problems if one of the
> arguments contains a newline character. We need to have a proper way of
> handling that.

I tested this by adding -t '(?m)\b\w*exec\w*\b\n', is that what you mean?
Here is the full json:

  "cmdline":[
    ".\/build\/runner\/igt_runner",
    "-o",
    "-f",
    "--per-test-timeout",
    "100",
    "--dry-run",
    "--test-list",
    "build\/docs\/testplan\/intel-ci-tests\/xe\/default\/bat.testlist",
    "-t",
    "(?m)\\b\\w*exec\\w*\\b\\n",
    "\/home\/gta\/igt\/3"
  ],

The newline Looks good to me...

I also tried adding a multi line regex, and that fails. However it fails without
this change as well so Lucas did not introduce any regression. So maybe it is ok
to accept this patch as is. Here is what I tried with and without Lucas' patches:

$ time sudo IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/' ./build/runner/igt_runner -o -f --per-test-timeout 100 --dry-run --test-list 'build/docs/testplan/intel-ci-tests/xe/default/bat.testlist' -t '(?s) \
\b \
\w*exec\w*\b' /home/gta/igt/4

If my example is wrong, please help me with a good one.


> 
> One option would be to have string serialization to escape newlines
> characters, and string parsing to undo the escaping.
> 
> Another one would be to generalize read_hook_strs_from_file() (and with
> a proper rename) to be reusable for both hook strings and argv.
> 
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> runner/settings.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>> runner/settings.h |  5 +++++
>> 2 files changed, 47 insertions(+)
>>
>> diff --git a/runner/settings.c b/runner/settings.c
>> index 2787869ee..ed1afc205 100644
>> --- a/runner/settings.c
>> +++ b/runner/settings.c
>> @@ -529,6 +529,18 @@ static void free_hook_strs(struct igt_vec *hook_strs)
>>         igt_vec_fini(hook_strs);
>> }
>>
>> +static void free_cmdline(struct settings *settings)
>> +{
>> +        if (!settings->cmdline.allocated)
>> +                return;
> 
> I would just make life simpler and have cmdline being always allocated.
> But I'm not blocking on this...
> 
>> +
>> +        for (size_t i = 0; i < settings->cmdline.argc; i++)
>> +                free(settings->cmdline.argv[i]);
>> +
>> +        free(settings->cmdline.argv);
>> +}
>> +
>> +
>> static bool file_exists_at(int dirfd, const char *filename)
>> {
>>         return faccessat(dirfd, filename, F_OK, 0) == 0;
>> @@ -646,6 +658,7 @@ void clear_settings(struct settings *settings)
>>         free_regexes(&settings->exclude_regexes);
>>         free_env_vars(&settings->env_vars);
>>         free_hook_strs(&settings->hook_strs);
>> +        free_cmdline(settings);
>>
>>         init_settings(settings);
>> }
>> @@ -875,6 +888,8 @@ bool parse_options(int argc, char **argv,
>>                 goto error;
>>         }
>>
>> +        settings->cmdline.argc = argc;
>> +        settings->cmdline.argv = argv;
>>
>>         return true;
>>
>> @@ -1055,6 +1070,7 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
>> bool serialize_settings(struct settings *settings)
>> {
>> #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
>> +#define SERIALIZE_ARRAY_ITEM(f, s, name, _i, format) fprintf(f, "%s[%d] : " format "\n", #name, _i, s->name[_i])
>>
>>         FILE *f;
>>         int dirfd, covfd;
>> @@ -1123,6 +1139,10 @@ bool serialize_settings(struct settings *settings)
>>         SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
>>         SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
>>
>> +        SERIALIZE_LINE(f, settings, cmdline.argc, "%d");
>> +        for (int i = 0; i < settings->cmdline.argc; i++)
>> +                SERIALIZE_ARRAY_ITEM(f, settings, cmdline.argv, i, "%s");
>> +
>>         if (settings->sync) {
>>                 fflush(f);
>>                 fsync(fileno(f));
>> @@ -1177,9 +1197,21 @@ static char *parse_str(char **pval)
>>                 s->field = _f(&val);                \
>>                 goto cleanup;                        \
>>         }
>> +#define PARSE_LINE_ARRAY(s, name, val, field, _f, _max)                \
>> +        do {                                                        \
>> +                int idx;                                        \
>> +                if (sscanf(name, #field "[%u]", &idx) == 1 &&        \
>> +                    idx < s->_max) {                                \
>> +                        s->field[idx] = _f(&val);                \
>> +                        goto cleanup;                                \
>> +                }                                                \
>> +        } while (0)
>> +
>> #define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, parse_int)
>> #define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, parse_ul)
>> #define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, parse_str)
>> +#define PARSE_ARRAY_STR(s, name, val, field, _max) \
>> +        PARSE_LINE_ARRAY(s, name, val, field, parse_str, _max)
>>
>> bool read_settings_from_file(struct settings *settings, FILE *f)
>> {
>> @@ -1211,6 +1243,15 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
>>                 PARSE_INT(settings, name, val, enable_code_coverage);
>>                 PARSE_INT(settings, name, val, cov_results_per_test);
>>                 PARSE_STR(settings, name, val, code_coverage_script);
>> +                PARSE_INT(settings, name, val, cmdline.argc);
>> +
>> +                if (settings->cmdline.argc && !settings->cmdline.argv) {
>> +                        settings->cmdline.allocated = true;
>> +                        settings->cmdline.argv = calloc(settings->cmdline.argc,
>> +                                                        sizeof(*settings->cmdline.argv));
>> +                }
> 
> I think we could have a PARSE_ARRAY_LENGTH() that would encapsulate
> reading the int and allocating the array. Of course, that would require
> having a "known format" for an array structure in settings to be used by
> others in the future.
> 
> The advantage of such a macro, is that we don't need to keep checking if
> we already have the length and that we haven't done the allocation yet,
> like done above.
> 
> --
> Gustavo Sousa
> 
>> +
>> +                PARSE_ARRAY_STR(settings, name, val, cmdline.argv, cmdline.argc);
>>
>>                 printf("Warning: Unknown field in settings file: %s = %s\n",
>>                        name, val);
>> @@ -1234,6 +1275,7 @@ cleanup:
>>         return true;
>> }
>> #undef PARSE_LINE
>> +#undef PARSE_LINE_ARRAY
>>
>> /**
>>  * read_env_vars_from_file() - load env vars from a file
>> diff --git a/runner/settings.h b/runner/settings.h
>> index f69f09778..d563a0d16 100644
>> --- a/runner/settings.h
>> +++ b/runner/settings.h
>> @@ -75,6 +75,11 @@ struct settings {
>>         char *code_coverage_script;
>>         bool enable_code_coverage;
>>         bool cov_results_per_test;
>> +        struct {
>> +                bool allocated;
>> +                int argc;
>> +                char **argv;
>> +        } cmdline;
>> };
>>
>> /**
>> -- 
>> 2.48.0
>>

