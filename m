Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C55C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 18:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E514110E73F;
	Wed, 22 Jan 2025 18:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRBpBfNN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C958D10E73F
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 18:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737572028; x=1769108028;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2larGmHLWyeePp1sMIsss+d+OOqiqgNHwDmOs4e5Bjs=;
 b=GRBpBfNNFLu995Ku4LGLBLAgOcRd5+YFpbkbu3/ykSsTHO10kECKWcls
 7IhFMl0oVkRef0fwzYydgeDVExVgT4mz81NxziXla56jGDBIUvkMFJSKC
 rWUiS2t/ZmT8QQxDUDEdN7zKoYj4sWwiDu1pejL6b/U0fkUMkkNVh4c0u
 t3XBk1HDurJpMg2MRLYyIh/hKZqVFgz7nLS5EjyHx82mYX1ewZTG0V2/s
 I55LMmIoYXBfsNmC2tUwo9N5hpQtGKYLi6vUg1g+j4l42ymlN3YXuffLa
 jUobwp/9ISuldzbpTsg/dH51zJVxdttkmds8DupiND/gLDnDu38bYlpuL g==;
X-CSE-ConnectionGUID: Id4CksO4TaqP+0oDYearuQ==
X-CSE-MsgGUID: tmsZaa2WTSylodtYmBBzNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38297378"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="38297378"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 10:53:47 -0800
X-CSE-ConnectionGUID: ROozzZkbTSO64pECVKLOHQ==
X-CSE-MsgGUID: Zx4RyWBbRYe3YK3ODnBN9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="107326364"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 10:53:46 -0800
Message-ID: <82111261-e32c-47f1-965d-cfb4d0504da7@linux.intel.com>
Date: Wed, 22 Jan 2025 19:53:43 +0100
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
 <e740cbcf-7794-4b2f-866b-49c265f701b1@linux.intel.com>
 <173757039426.5500.1181401747974476563@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173757039426.5500.1181401747974476563@intel.com>
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



On 22.01.2025 19:26, Gustavo Sousa wrote:
> Quoting Peter Senna Tschudin (2025-01-22 15:16:59-03:00)
>>
>>
>> On 22.01.2025 13:40, Gustavo Sousa wrote:
>>> Quoting Lucas De Marchi (2025-01-21 19:57:32-03:00)
>>>> Serialize the command line to metadata.txt. The expected format in the
>>>> metadata.txt is like below:
>>>>
>>>>        cmdline.argc : 6
>>>>        cmdline.argv[0] : ./build/runner/igt_runner
>>>>        cmdline.argv[1] : -o
>>>>        cmdline.argv[2] : --test-list
>>>>        cmdline.argv[3] : /tmp/testlist.txt
>>>>        cmdline.argv[4] : build/tests/
>>>>        cmdline.argv[5] : /tmp/results
>>>
>>> One limitation here is that we would run into problems if one of the
>>> arguments contains a newline character. We need to have a proper way of
>>> handling that.
>>
>> I tested this by adding -t '(?m)\b\w*exec\w*\b\n', is that what you mean?
> 
> If you are using bash, I'm afraid '\n' in '(?m)\b\w*exec\w*\b\n' is not
> turned into a real newline character. Something like $'foo\nbar'
> would.
> 
> Example:
> 
>   $ echo 'foo\nbar'
>   foo\nbar
> 
>   $ echo $'foo\nbar'
>   foo
>   bar

Passing -t $'(?m)\b\w*exec\w*\b\n' makes igt_runner crash with and without
the patch series. So no regression was introduced by this series...



