Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF43C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 19:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CF610E032;
	Thu, 30 Jan 2025 19:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNdaLBmS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805A810E032
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 19:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738263673; x=1769799673;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZaNHZnNpVG5KMWbRElt4+sBtxW0zNTmO0iHWyY8uKGs=;
 b=YNdaLBmS8533xUmNpwYwZAbEQFr6KKRpWorJr3pTl8UvkVO1O2Ky3fDa
 MGf/YsFYKxQNMTfjMnjJUMz6bREF8NGaIL4KG/x/mNoCuKw1O8dU1ZwZx
 jQS3gnlmgrIRlUW0dbc840m5se/+sJ9PRlqktj1tlsyNct5eog2uE+qJX
 pfYZFIVsoVYZHVlElC6POd98PGPvUnNGL9X1a7RLwX9JtJzzpo5aNxMZw
 nHodFJ1A1abNc7eoalNb/4ov3d9bXy+Zyg85k6DjCn7oRHZPejP7SFydy
 ag3aEIc1mZZmcYYrFoEwvm3x8IARKwhDn6KVU3di/8pOEnBJP6v99RTuE w==;
X-CSE-ConnectionGUID: Q7GEULR1QVSObA2DC2YxzQ==
X-CSE-MsgGUID: Zx2FvB/ySVO1J5hDcx7CoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42480271"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42480271"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 11:01:13 -0800
X-CSE-ConnectionGUID: O+mGe9+fTieXjl9uOYprQg==
X-CSE-MsgGUID: 8Iy2SqUtSCyzDbrWENpr1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140307974"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 11:01:11 -0800
Date: Thu, 30 Jan 2025 20:00:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v3 10/10] runner/resultgen: Add cmdline to
 results.json
Message-ID: <20250130190055.qn4xxd4y4za6ehuz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-11-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250130172149.3657144-11-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2025-01-30 at 09:21:49 -0800, Lucas De Marchi wrote:
> For easier repro scenarios, add the cmdline to the json: one can see the
> exact command executed to try to reproduce a CI failure without needing
> extra files.
> 
> Adding cmdline to the results.json doesn't need a version upgrade:
> piglit can still parse the file.

Why not just printing this into stdout before executing test loop?
The same way which is already used by igt_facts, so it will go
into runnerNN.txt log and will not be duplicated in each and every
results.json

Adding also Ewelina to Cc
Cc: Ewelina Musial <ewelina.musial@intel.com>

Digression: for repro it could be helpfull to have also git logs
and kernel config but this also is one-time info for whole
bat/shard run, so again no need to duplicate in every results.

Regards,
Kamil

> 
> Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
...cut...

> index a2b79da9e..2c483fdf5 100644
> --- a/runner/json_tests_data/warnings/reference.json
> +++ b/runner/json_tests_data/warnings/reference.json
> @@ -3,6 +3,7 @@
>    "results_version":10,
>    "name":"normal-run",
>    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> +  "cmdline":[],
>    "time_elapsed":{
>      "__type__":"TimeAttribute",
>      "start":1539953735.1110389,
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 87847bf5b..0d3a569cf 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -2281,7 +2281,7 @@ struct json_object *generate_results_json(int dirfd)
>  {
>  	struct settings settings;
>  	struct job_list job_list;
> -	struct json_object *obj, *elapsed;
> +	struct json_object *obj, *elapsed, *arr;
>  	struct results results;
>  	int testdirfd, fd;
>  	size_t i;
> @@ -2319,6 +2319,11 @@ struct json_object *generate_results_json(int dirfd)
>  		close(fd);
>  	}
>  
> +	arr = json_object_new_array();
> +	for (i = 0; i < settings.cmdline.argc; i++)
> +		json_object_array_add(arr, json_object_new_string(settings.cmdline.argv[i]));
> +	json_object_object_add(obj, "cmdline", arr);
> +
>  	elapsed = json_object_new_object();
>  	json_object_object_add(elapsed, "__type__", json_object_new_string("TimeAttribute"));
>  	if ((fd = openat(dirfd, "starttime.txt", O_RDONLY)) >= 0) {
> -- 
> 2.48.0
> 
