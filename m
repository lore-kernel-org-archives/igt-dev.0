Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D696AF4BB71
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 18:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF6510E5F0;
	Tue, 24 Feb 2026 18:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+igpPJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE2210E5F0
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 18:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771957592; x=1803493592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aStXqJOVfahZTE6y5m7mv2b7+zROxPpY97Y8vp2Udkg=;
 b=S+igpPJT6JjLctbLDwXR1nWrJ8iStJhXDC1fww6XsBrJjq8PAgqjoabe
 k79kieGWfB9zNBsTSNEZSOPZZU9o0303UzCyWSwdOQWzjHbUMt4kuNrC6
 33QivHgSyVOMpTH8OPmGculaxUkxNyAjKqVBiVOh18U2a/8sPTrtJue/G
 pYvizfVAtZk/hkYV9z3B+wjJgPhOWWXPL1pfR0fSxWnWNoUdviCc4y3h9
 N7WlW3gxAowhUjcLWxFvSgSwJKaclVq0eYggYF0ZmzdPpEO/1UjHGHsEt
 F4s5qLVSvBBoow1/+5YLAWnxK0RBim9Z+gDQeLKoSu3GZCWNqCkETuOkx w==;
X-CSE-ConnectionGUID: 7hDqwUn3Tcu3V0Oe9xpD6g==
X-CSE-MsgGUID: VFWslz0ESR66RtEXgOGyRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72192514"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72192514"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 10:26:31 -0800
X-CSE-ConnectionGUID: nIz/1RoWRkioH5kT4Z+D3w==
X-CSE-MsgGUID: cAiPgAzsQd2Ww0dXCs2/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="220099837"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 10:26:30 -0800
Date: Tue, 24 Feb 2026 19:26:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: fix JSON comma tracking with
 per-level state
Message-ID: <20260224182612.uxwwp6vhsbrrk3a4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
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

This is invalid e-mail:
5.1.0 - Unknown address error 550-'5.1.1 <mbey-mw@gitlab.freedesktop.org>: Recipient address rejected: User unknown

so either write down correct one or I would drop e-mail address
at merge.

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
