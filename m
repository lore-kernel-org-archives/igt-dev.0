Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04F1CE8D72
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 10:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14B310E6D7;
	Thu, 19 Sep 2024 10:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aX1uuBFi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD87610E6DD
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 10:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726741555; x=1758277555;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SVsgSn73tDIDq5Qvk8tUMTBn7IeR0PdyDhXPvp1QncM=;
 b=aX1uuBFidMRCUWE3ibXxl32LYdTKaTMGR/l32IUFz9waKaqfzCBPMyiV
 Nxgvy9nLOH/c/mc3AE5F7WIynKtwaAJVYL2MN7RfRDvcFDtrTK8GtWf+8
 vgsUnXvQ66s6koCp5ubdGCe9LXJzIQrVvATI7g1Jxw5C8VvS5qH9DQE/S
 jzIuNtZG5wcMD687tODmMHcoptNb76AEt5aCm3W5+7CBWRUVy6B97Cpju
 cV6MXLSRVx7QQxLHX/+YpCy96qAy41y7KrAqc0XWR0Qf/rNc2k6LNQ+L3
 Q+FhzxTG9VI/m5gV4Vi/yu690XY24C1OpU3k2jsgYAIhEHBEY/9EUS52P g==;
X-CSE-ConnectionGUID: p1r9VwXNSpSZGcGB0nJ2tw==
X-CSE-MsgGUID: FaPsrpw0QFKrqEIFfVvfQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25575068"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25575068"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 03:25:55 -0700
X-CSE-ConnectionGUID: iMjD6ryARrShTB46tTca5w==
X-CSE-MsgGUID: VQP6QE4CQxiFC//tjltpzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70728295"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.68])
 ([10.245.246.68])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 03:25:53 -0700
Message-ID: <caf78282-e322-4a04-9e3b-e03fa2d77b97@intel.com>
Date: Thu, 19 Sep 2024 12:25:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] scripts/test_list: Don't log missing testlist
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240919081603.523299-1-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240919081603.523299-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Zbigniew,

On 19.09.2024 10:16, Zbigniew Kempczyński wrote:
> When tests are compiled conditionally and compilation flag is set
> to false they have no binaries in the build directory. As testlist
> is built from .c source file list, unnecessary warnings about missing
> .testlist files are produced.
> 
> Avoid this warnings by skipping processing testlists for which binaries
> weren't produced.

Agree, since we commited to allow such a state, we should skip this 
check too.

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>   scripts/test_list.py | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index d050687fe1..40b6b7829b 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1127,8 +1127,13 @@ class TestList:
>   
>           """ Return a list of tests as reported by --list-subtests """
>           tests = []
> +        no_binaries = self.get_not_compiled()
>           for name in self.filenames:
> -            testlist = re.sub(r"\.c$", ".testlist", name.split('/')[-1])
> +            binary = re.sub(r"\.c$", "", name.split('/')[-1])
> +            if binary in no_binaries:
> +                continue
> +
> +            testlist = binary + ".testlist" >               fname = os.path.join(self.igt_build_path, "tests", 
testlist)
>   
>               if not os.path.isfile(fname):
