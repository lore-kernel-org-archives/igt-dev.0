Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C339C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 06:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269B710E277;
	Thu, 23 Jan 2025 06:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iz5PHlun";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7979E10E277
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 06:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737612438; x=1769148438;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yZdLRfy19rnMECMB1fLFkuZXP31AMEXU5H2b5LUerDs=;
 b=Iz5PHlunxVd6oBmBbycvTIPF0t8mPMFYhsiS2u6xzChvntPCcsb8Qo8i
 ofunBUt16nB2ll8Oij9gEN2PkDk88SPCGaNvbgowY6EDOQ8oZ2RAf5+Fl
 nSjexe0dI5PweHeOPxEuRs0dr44wg8rEax6/Dq2DR39NkHNd6fFc5xGAL
 jnnoUmRZ1OBDFAMl7JSu1VoRE/V0r97vX0L5Ocu3+PXJuv+rCv9LgLowS
 FN8Xi3PPZw/IqDoEahF4PWlIWd/mSpPJoX3i/k3f2j7kXeqJMGK9FIZKS
 FdaJj5jQjZC1Mobsc/sJLZKCdDMyB8oKpQqGjmReqiUBQGNAEKT0pz1Y7 A==;
X-CSE-ConnectionGUID: C42UE8pcQKqruhg4AiEcBw==
X-CSE-MsgGUID: 0GmNB6taQDSfCT2yddnJkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38127105"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="38127105"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:07:18 -0800
X-CSE-ConnectionGUID: h8uS59adQAanNzIAiEx/6Q==
X-CSE-MsgGUID: h7B3tDuASYSq6xRPWNfaSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107794418"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:07:17 -0800
Date: Thu, 23 Jan 2025 00:07:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 2/7] runner/settings: Use wrapper functions for
 each type
Message-ID: <bzvok6b64e22nudscgjfoomev6pq3rb35felx4yhmqmqdqid4w@dfaoanffylov>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-3-lucas.demarchi@intel.com>
 <173754482486.5500.2959553679406990943@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <173754482486.5500.2959553679406990943@intel.com>
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

On Wed, Jan 22, 2025 at 08:20:24AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2025-01-21 19:57:28-03:00)
>>Simplify assigning the variables by using wrapper functions. This avoids
>>calling atoi() on every iteration and will allow to simplify the
>>strdup() calls in future.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> runner/settings.c | 74 ++++++++++++++++++++++++++++-------------------
>> 1 file changed, 45 insertions(+), 29 deletions(-)
>>
>>diff --git a/runner/settings.c b/runner/settings.c
>>index 80d95be5b..13694a51c 100644
>>--- a/runner/settings.c
>>+++ b/runner/settings.c
>>@@ -1152,43 +1152,60 @@ bool serialize_settings(struct settings *settings)
>> #undef SERIALIZE_LINE
>> }
>>
>>-bool read_settings_from_file(struct settings *settings, FILE *f)
>>+static int parse_int(char **pval)
>>+{
>>+        return atoi(*pval);
>>+}
>>+
>>+static unsigned long parse_ul(char **pval)
>>+{
>>+        return strtoul(*pval, NULL, 10);
>>+}
>>+
>>+static char *parse_str(char **pval)
>> {
>>-#define PARSE_LINE(s, name, val, field, write)        \
>>+        return *pval ? strdup(*pval) : NULL;
>>+}
>
>Why do we need char **pval for those functions instead of simply char
>*val?

you will see on next patch, but :

>
>>+
>>+#define PARSE_LINE(s, name, val, field, _f)        \
>>         if (!strcmp(name, #field)) {                \
>>-                s->field = write;                \
>>+                s->field = _f(&val);                \

right now it does this ^ and in the cleanup it does the free and assign
the variable back to NULL. In the end we are doing

foo = alloc()
bar == strdup(foo)
free(foo)

when we actually only need the first allocation and pass the ownership
to the outside. When coding this I thought about calling the function
leak_str() instead of parse_str(), which would probably clarify (but
should be done only in the subsequent patch).



>>                 goto cleanup;                        \
>>         }
>>+#define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, parse_int)
>>+#define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, parse_ul)
>>+#define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, parse_str)
>
>I would have kept these inside read_settings_from_file(), since it is
>very specific for that function.
>
>(And in a follow-up patch even remove the s, name and val parameters to
>make it simpler.)

Matter of preference, but the defines inside the function pollutes a lot
the variable declaration. Particularly when we increase the number of
macros. No reason not to keep them just above the
function and undefine them just below the function. You will see in the
next patches I didn't bother undefining them all since just undefining
a few gives enough protection that those macros can't be used anymore.

As for the arguments, I also don't really like macros that use variables
not passed as argument. This leads to unmaintainable code - we used to
have macros in i915 that depended on having a "dev_priv" variable
somewhere - it took years to cleanup that to rename to i915 and allow
the driver to run with more than 1 devices (we made a mess with some
files, declaring a file-scoped variables).

Lucas De Marchi

>
>>
>>+bool read_settings_from_file(struct settings *settings, FILE *f)
>>+{
>>         char *name = NULL, *val = NULL;
>>
>>         settings->dmesg_warn_level = -1;
>>
>>         while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
>>-                int numval = atoi(val);
>>-                PARSE_LINE(settings, name, val, abort_mask, numval);
>>-                PARSE_LINE(settings, name, val, disk_usage_limit, strtoul(val, NULL, 10));
>>-                PARSE_LINE(settings, name, val, test_list, val ? strdup(val) : NULL);
>>-                PARSE_LINE(settings, name, val, name, val ? strdup(val) : NULL);
>>-                PARSE_LINE(settings, name, val, dry_run, numval);
>>-                PARSE_LINE(settings, name, val, allow_non_root, numval);
>>-                PARSE_LINE(settings, name, val, facts, numval);
>>-                PARSE_LINE(settings, name, val, sync, numval);
>>-                PARSE_LINE(settings, name, val, log_level, numval);
>>-                PARSE_LINE(settings, name, val, overwrite, numval);
>>-                PARSE_LINE(settings, name, val, multiple_mode, numval);
>>-                PARSE_LINE(settings, name, val, inactivity_timeout, numval);
>>-                PARSE_LINE(settings, name, val, per_test_timeout, numval);
>>-                PARSE_LINE(settings, name, val, overall_timeout, numval);
>>-                PARSE_LINE(settings, name, val, use_watchdog, numval);
>>-                PARSE_LINE(settings, name, val, piglit_style_dmesg, numval);
>>-                PARSE_LINE(settings, name, val, dmesg_warn_level, numval);
>>-                PARSE_LINE(settings, name, val, prune_mode, numval);
>>-                PARSE_LINE(settings, name, val, test_root, val ? strdup(val) : NULL);
>>-                PARSE_LINE(settings, name, val, results_path, val ? strdup(val) : NULL);
>>-                PARSE_LINE(settings, name, val, enable_code_coverage, numval);
>>-                PARSE_LINE(settings, name, val, cov_results_per_test, numval);
>>-                PARSE_LINE(settings, name, val, code_coverage_script, val ? strdup(val) : NULL);
>>+                PARSE_INT(settings, name, val, abort_mask);
>>+                PARSE_UL(settings, name, val, disk_usage_limit);
>>+                PARSE_STR(settings, name, val, test_list);
>>+                PARSE_STR(settings, name, val, name);
>>+                PARSE_INT(settings, name, val, dry_run);
>>+                PARSE_INT(settings, name, val, allow_non_root);
>>+                PARSE_INT(settings, name, val, facts);
>>+                PARSE_INT(settings, name, val, sync);
>>+                PARSE_INT(settings, name, val, log_level);
>>+                PARSE_INT(settings, name, val, overwrite);
>>+                PARSE_INT(settings, name, val, multiple_mode);
>>+                PARSE_INT(settings, name, val, inactivity_timeout);
>>+                PARSE_INT(settings, name, val, per_test_timeout);
>>+                PARSE_INT(settings, name, val, overall_timeout);
>>+                PARSE_INT(settings, name, val, use_watchdog);
>>+                PARSE_INT(settings, name, val, piglit_style_dmesg);
>>+                PARSE_INT(settings, name, val, dmesg_warn_level);
>>+                PARSE_INT(settings, name, val, prune_mode);
>>+                PARSE_STR(settings, name, val, test_root);
>>+                PARSE_STR(settings, name, val, results_path);
>>+                PARSE_INT(settings, name, val, enable_code_coverage);
>>+                PARSE_INT(settings, name, val, cov_results_per_test);
>>+                PARSE_STR(settings, name, val, code_coverage_script);
>>
>>                 printf("Warning: Unknown field in settings file: %s = %s\n",
>>                        name, val);
>>@@ -1210,9 +1227,8 @@ cleanup:
>>         free(val);
>>
>>         return true;
>>-
>>-#undef PARSE_LINE
>> }
>>+#undef PARSE_LINE
>
>Missing undef for the other macros here?
>
>--
>Gustavo Sousa
>
>>
>> /**
>>  * read_env_vars_from_file() - load env vars from a file
>>--
>>2.48.0
>>
