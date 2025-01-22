Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB967C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 18:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A25110E72D;
	Wed, 22 Jan 2025 18:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYIY3Wvc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A512C10E72D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 18:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737570936; x=1769106936;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kP+NFwn2g6W/nt9194vGQRZUHnBj4qYz5tbxIOFkQSA=;
 b=JYIY3Wvc0yY9V/t6Eqs6HlMsZc29VuFVvvQe2e77fmyLK8acyM4wTaXg
 2LsfpHn/OaDMgnwYaXs2jlQyyVEEZBclrAAs47MxegqS2Do4GESj8HoRy
 OUku0V/a2WkrOb3vAxZsx1B9DtR5iv5/ojjqoNV4vCw4PIsrQzyVyTp5t
 0js8zJ+OnfBGIoEQSrWbxnmCrziKdGzUKmGzAXyEicWog9qQODIVqd2Rg
 ha9250Ig6Vn5jJfGgheqVPxkyzqw8P0DOlcKy/X988RrcR+6mkmIHkqvz
 J0VsAJuFQHs/lZYE2zF/7FvwrwxOvTMO/MgbDQEi9s4ZzZFQE+SKBVZB6 w==;
X-CSE-ConnectionGUID: 0zf9+CsQS/O5Yvv009b6Zw==
X-CSE-MsgGUID: cj8hCMz8QlC+8OHLATBWig==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48640692"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="48640692"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 10:35:35 -0800
X-CSE-ConnectionGUID: BDIcZ+X8Quaes+F83jL5nQ==
X-CSE-MsgGUID: SzRo5IE7S52PLbE44nkcYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144482211"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 10:35:34 -0800
Message-ID: <8b23c314-4a4b-4583-8cb1-1efc20ff8ca3@linux.intel.com>
Date: Wed, 22 Jan 2025 19:35:30 +0100
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

No no, I am looking for an example that I can pass to igt_runner. If there
is no way to pass a newline character to igt_runner, then there is no
problem. :-) At least not a blocker for this patch, and we can create a
Jira for improving special character handling.


[...]
