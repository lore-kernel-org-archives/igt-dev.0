Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5859BFCEE8D
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 11:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC0010E740;
	Wed, 25 Feb 2026 11:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOxH2eXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABD810E740
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 11:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772019565; x=1803555565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fSnDT+Onn20xmq+Hww//mxn1GW5VWJsjKzgaZK6HCHA=;
 b=fOxH2eXvhaBQL0XDGvSDbVu3VQuRF5jxfVH0C85+Dvl8zUzvdElxUWUJ
 nj7XRtUFJHZ2L1j6/WqhG4E07HECfxEh2o4FWjQy3JkuHP9P+ll6hnDqF
 vTN6FFgvy8WK0wPP88oMPeNHybC/PMnK5Q5ts3nMyJHxm/Ehma+gJt2Ra
 0Yxj0y3cHGWkHcLg3gNb5652xEd089CF+Qp5c128jj+uCQowf0qwVSKDS
 hZeewbI35DHPIIAADMcfBHDZuIJMQnZZpAknepEqFD+qWiggRGPWkNSJs
 EhjEvdeQjkSK+Zm6IrqCOEoAlUYXqmPVvizqHaNDf85TRPF2W5qiN5Hd4 w==;
X-CSE-ConnectionGUID: kS/TK3muTYae2Yr3a8BNvg==
X-CSE-MsgGUID: KnNfP3QVSNGnMiUhj8/Ibg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83767392"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83767392"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 03:39:24 -0800
X-CSE-ConnectionGUID: nriVWwJrTkucac/U0KGb2Q==
X-CSE-MsgGUID: HY7KvVRoTPiFB7T/CpcA6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215314012"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 03:39:23 -0800
Date: Wed, 25 Feb 2026 12:38:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 Marek Beyer <mbey-mw@gitlab.freedesktop.org>
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: fix JSON comma tracking with
 per-level state
Message-ID: <20260225113858.k4lbbjctzk73e4tz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 Marek Beyer <mbey-mw@gitlab.freedesktop.org>
References: <4edeeeddd4141f3de463548785d3d9a4ca696823.1771848992.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4edeeeddd4141f3de463548785d3d9a4ca696823.1771848992.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-02-23 at 13:23:42 +0100, Sebastian Brzezinka wrote:
> The previous implementation used two global counters,
> json_prev_struct_members and json_struct_members, to decide whether
> a comma separator is needed before each JSON element. This approach
> only preserved one level of context: opening a third nesting level
> overwrote the saved parent count, and closing a nested struct left
> json_struct_members at the inner value. As a result, when an empty
> (or any) nested struct was closed and the parent then emitted
> another member at depth >= 2, the leading comma was silently
> dropped, producing invalid JSON.
> 
> Replace both counters with a bool array indexed by json_indent_level,
> sized to ARRAY_SIZE(json_indent) - the same hard limit already
> enforced by the existing asserts. Each nesting level now tracks its
> own "has preceding output" state independently.
> 
> Suggested-by: Marek Beyer <mbey-mw@gitlab.freedesktop.org>

I will merge this with correct e-mail address: Suggested-by: Marek Beyer <marek.beyer@meetwise.com>

Thank you all for working on this.

Regards,
Kamil

> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/199
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/intel_gpu_top.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index b94604232..d8ebb20ac 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1117,8 +1117,7 @@ static const char *json_indent[] = {
>  	"\t\t\t\t\t",
>  };
>  
> -static unsigned int json_prev_struct_members;
> -static unsigned int json_struct_members;
> +static bool json_has_member[ARRAY_SIZE(json_indent)];
>  
>  FILE *out;
>  
> @@ -1127,20 +1126,18 @@ json_open_struct(const char *name)
>  {
>  	assert(json_indent_level < ARRAY_SIZE(json_indent));
>  
> -	json_prev_struct_members = json_struct_members;
> -	json_struct_members = 0;
> -
>  	if (name)
>  		fprintf(out, "%s%s\"%s\": {\n",
> -			json_prev_struct_members ? ",\n" : "",
> +			json_has_member[json_indent_level] ? ",\n" : "",
>  			json_indent[json_indent_level],
>  			name);
>  	else
>  		fprintf(out, "%s\n%s{\n",
> -			json_prev_struct_members ? "," : "",
> +			json_has_member[json_indent_level] ? "," : "",
>  			json_indent[json_indent_level]);
>  
>  	json_indent_level++;
> +	json_has_member[json_indent_level] = false;
>  }
>  
>  static void
> @@ -1149,6 +1146,7 @@ json_close_struct(void)
>  	assert(json_indent_level > 0);
>  
>  	fprintf(out, "\n%s}", json_indent[--json_indent_level]);
> +	json_has_member[json_indent_level] = true;
>  
>  	if (json_indent_level == 0)
>  		fflush(stdout);
> @@ -1160,10 +1158,10 @@ __json_add_member(const char *key, const char *val)
>  	assert(json_indent_level < ARRAY_SIZE(json_indent));
>  
>  	fprintf(out, "%s%s\"%s\": \"%s\"",
> -		json_struct_members ? ",\n" : "",
> +		json_has_member[json_indent_level] ? ",\n" : "",
>  		json_indent[json_indent_level], key, val);
>  
> -	json_struct_members++;
> +	json_has_member[json_indent_level] = true;
>  }
>  
>  static unsigned int
> @@ -1173,10 +1171,10 @@ json_add_member(const struct cnt_group *parent, struct cnt_item *item,
>  	assert(json_indent_level < ARRAY_SIZE(json_indent));
>  
>  	fprintf(out, "%s%s\"%s\": ",
> -		json_struct_members ? ",\n" : "",
> +		json_has_member[json_indent_level] ? ",\n" : "",
>  		json_indent[json_indent_level], item->name);
>  
> -	json_struct_members++;
> +	json_has_member[json_indent_level] = true;
>  
>  	if (!strcmp(item->name, "unit"))
>  		fprintf(out, "\"%s\"", item->unit);
> -- 
> 2.52.0
> 
