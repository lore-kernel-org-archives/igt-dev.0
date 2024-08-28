Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B0BC5AE5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713A310E554;
	Wed, 28 Aug 2024 14:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mcbj3UOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C6B10E554
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724856420; x=1756392420;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KfrcKGLWZAB1rikNkzRiIykwYOwPTEl/HzAqZm/agws=;
 b=Mcbj3UOynBXRrRhUpb01lzWcmOCdd0BqwUwKR8MPILNhTNF3Ta2YU2o2
 zXRSCYppzVPauE3esQpkdc6Jd8dPqBAAxG3r6QZTKBwPS2vjfH9Oyl2WT
 9yQtIhwTJCNm6oiBLNYuTcKU1WD4s6fV/4K1NMqMNEAszdSHj5ofmYEjI
 BkNoHmKMeCkdT54+OIWp2AaRpDuFYJKeljTyf22O1oFPzjq9mHKcxZshG
 OdIbqKbhkWuWZQanFjf/MsAZYszMA4C3IZ40apbmY7y9XcJzjMR5+OnU8
 xEbuVuwu7iirQM7CO36mDiv3GY8seCUDxGIEyGF2c9aF9uroHQtPtXdDX w==;
X-CSE-ConnectionGUID: d+t3Ad/8QoqOWlxeBnFhdA==
X-CSE-MsgGUID: c8tTWLT0T1iirUTOwjtB7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33959971"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="33959971"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:46:59 -0700
X-CSE-ConnectionGUID: vNd6tO4PQ5+Q7KmwloWY7Q==
X-CSE-MsgGUID: jVD/SALkRbe9O361b5gBbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63214219"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:46:58 -0700
Message-ID: <dc729158-83b6-494c-8b6a-8571e9137090@linux.intel.com>
Date: Wed, 28 Aug 2024 16:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 03/10] lib/igt_core: Add igt_assert_lt_double()
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
 <20240827165449.1706784-4-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240827165449.1706784-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 8/27/2024 6:54 PM, Lucas De Marchi wrote:
> Like the for other types. Avoid the lte variant as it's not good
> practice to compare a double for equality.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   lib/igt_core.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 06c5314bf..84925767c 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -998,6 +998,18 @@ void igt_describe_f(const char *fmt, ...);
>    */
>   #define igt_assert_lt_s64(n1, n2) igt_assert_cmps64(n1, <, >=, n2)
>   
> +/**
> + * igt_assert_lt_double:
> + * @n1: first double
> + * @n2: second double
> + *
> + * Fails (sub-)test if the second double is smaller than or equal to the first.
> + *
> + * Like igt_assert(), but displays the values being compared on failure instead
> + * of simply printing the stringified expression.
> + */
> +#define igt_assert_lt_double(n1, n2) igt_assert_cmpdouble(n1, <, >=, n2)
> +
>   /**
>    * igt_assert_fd:
>    * @fd: file descriptor
