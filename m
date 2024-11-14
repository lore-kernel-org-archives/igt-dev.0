Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84197D68B2D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 15:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2985C10E7EF;
	Thu, 14 Nov 2024 15:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIP4yvvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551EC10E7EE
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731596533; x=1763132533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RluSwBPakuL2FBeyuVse7KhaOuyzGx3B7NI+98dQ/M4=;
 b=ZIP4yvvr53eDd1/WHgdt+3guNUFZmzcNYYGQLYbDwIq9ru9xVf1PI9Aj
 Zjd3h+AEywDZ8jdmaBTyyatttja30XnQBSX5jzj3orv2ezP7qRo65006Y
 kEN3XK0uTSluSjHZBLfo7JP4p5HPHvzeAtCJbRSavaAbZmjHHS6BtUSft
 ujKH0GvlHHXwIeDFYaO7ot6rrITZMyYdwdoB9rqJOA5Ham7zsI39vVPOl
 bQbWCXn4UfdeetxiGylzkO0K/csgTfB+sKRQz9ALQLLWGKEtsqJQDz2JX
 NeRE1dfOaYhA2NIKY8w9ZEAbkODChoT1Q5HlCQzhJ92Us4CNm7cZoDOhJ g==;
X-CSE-ConnectionGUID: HHo4tSejTOaWrgEmsOCj+g==
X-CSE-MsgGUID: rRbqm0OhSA2cuOTkLh9yzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31645201"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="31645201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:02:13 -0800
X-CSE-ConnectionGUID: WS+dMVRsRA65wQiZDH380Q==
X-CSE-MsgGUID: r1u6moObRqmUesUKpPd20Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88628388"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.16])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:02:10 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 5/6] lib/igt_ktap: Just free ktap
Date: Thu, 14 Nov 2024 16:02:08 +0100
Message-ID: <4063334.irdbgypaU6@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241107055254.3129207-6-lucas.demarchi@intel.com>
References: <20241107055254.3129207-1-lucas.demarchi@intel.com>
 <20241107055254.3129207-6-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Thursday, 7 November 2024 06:52:53 CET Lucas De Marchi wrote:
> Change function signature so it only set the pointer free rather than
> also setting it to NULL. This matches alloc/free behavior for other
> objects in igt.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  lib/igt_kmod.c              |  2 +-
>  lib/igt_ktap.c              |  5 ++---
>  lib/igt_ktap.h              |  2 +-
>  lib/tests/igt_ktap_parser.c | 24 ++++++++++++------------
>  4 files changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index fd79e8739..7be95a61c 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1026,7 +1026,7 @@ static int kunit_get_results(struct igt_list_head *results, const char *debugfs_
>  	}
>  
>  	free(buf);
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  out_fclose:
>  	fclose(results_stream);
> diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
> index 300fb2bb5..aa7ea8447 100644
> --- a/lib/igt_ktap.c
> +++ b/lib/igt_ktap.c
> @@ -310,8 +310,7 @@ struct igt_ktap_results *igt_ktap_alloc(struct igt_list_head *results)
>  	return ktap;
>  }
>  
> -void igt_ktap_free(struct igt_ktap_results **ktap)
> +void igt_ktap_free(struct igt_ktap_results *ktap)
>  {
> -	free(*ktap);
> -	*ktap = NULL;
> +	free(ktap);
>  }
> diff --git a/lib/igt_ktap.h b/lib/igt_ktap.h
> index 7684e859b..c422636bf 100644
> --- a/lib/igt_ktap.h
> +++ b/lib/igt_ktap.h
> @@ -41,6 +41,6 @@ struct igt_ktap_results;
>  
>  struct igt_ktap_results *igt_ktap_alloc(struct igt_list_head *results);
>  int igt_ktap_parse(const char *buf, struct igt_ktap_results *ktap);
> -void igt_ktap_free(struct igt_ktap_results **ktap);
> +void igt_ktap_free(struct igt_ktap_results *ktap);
>  
>  #endif /* IGT_KTAP_H */
> diff --git a/lib/tests/igt_ktap_parser.c b/lib/tests/igt_ktap_parser.c
> index 8c2d16080..6357bdf6a 100644
> --- a/lib/tests/igt_ktap_parser.c
> +++ b/lib/tests/igt_ktap_parser.c
> @@ -45,7 +45,7 @@ static void ktap_list(void)
>  	igt_assert_eq(igt_ktap_parse("    ok 4 test_case_4 # SKIP\n", ktap), -EINPROGRESS);
>  	igt_assert_eq(igt_ktap_parse("ok 3 test_suite_3\n", ktap), 0);
>  
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	igt_assert_eq(igt_list_length(&results), 8);
>  
> @@ -107,7 +107,7 @@ static void ktap_results(void)
>  	igt_assert_eq(igt_ktap_parse("    ok 1 test_case\n", ktap), -EINPROGRESS);
>  	igt_assert_eq(igt_ktap_parse("not ok 1 test_suite\n", ktap), 0);
>  
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	igt_assert_eq(igt_list_length(&results), 2);
>  
> @@ -162,7 +162,7 @@ static void ktap_success(void)
>  	igt_assert_eq(igt_ktap_parse("not ok 1 test_suite\n", ktap), 0);
>  	igt_assert_eq(igt_list_length(&results), 2);
>  
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	result = igt_list_last_entry(&results, result, link);
>  	igt_list_del(&result->link);
> @@ -186,48 +186,48 @@ static void ktap_top_version(void)
>  	ktap = igt_ktap_alloc(&results);
>  	igt_require(ktap);
>  	igt_assert_eq(igt_ktap_parse("1..1\n", ktap), -EPROTO);
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	ktap = igt_ktap_alloc(&results);
>  	igt_require(ktap);
>  	/* TODO: change to -EPROTO as soon as related workaround is dropped */
>  	igt_assert_eq(igt_ktap_parse("    KTAP version 1\n", ktap), -EINPROGRESS);
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	ktap = igt_ktap_alloc(&results);
>  	igt_require(ktap);
>  	igt_assert_eq(igt_ktap_parse("    # Subtest: test_suite\n", ktap), -EPROTO);
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	ktap = igt_ktap_alloc(&results);
>  	igt_require(ktap);
>  	igt_assert_eq(igt_ktap_parse("    1..1\n", ktap), -EPROTO);
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	ktap = igt_ktap_alloc(&results);
>  	igt_require(ktap);
>  	igt_assert_eq(igt_ktap_parse("        KTAP version 1\n", ktap), -EPROTO);
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	ktap = igt_ktap_alloc(&results);
>  	igt_require(ktap);
>  	igt_assert_eq(igt_ktap_parse("        # Subtest: test_case\n", ktap), -EPROTO);
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	ktap = igt_ktap_alloc(&results);
>  	igt_require(ktap);
>  	igt_assert_eq(igt_ktap_parse("        ok 1 parameter 1\n", ktap), -EPROTO);
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	ktap = igt_ktap_alloc(&results);
>  	igt_require(ktap);
>  	igt_assert_eq(igt_ktap_parse("    ok 1 test_case\n", ktap), -EPROTO);
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  
>  	ktap = igt_ktap_alloc(&results);
>  	igt_require(ktap);
>  	igt_assert_eq(igt_ktap_parse("ok 1 test_suite\n", ktap), -EPROTO);
> -	igt_ktap_free(&ktap);
> +	igt_ktap_free(ktap);
>  }
>  
>  igt_main
> 




