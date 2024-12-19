Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A457E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 17:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD68610E03A;
	Thu, 19 Dec 2024 17:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ff05sBrh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AF310ED6B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 17:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734629056; x=1766165056;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=tObToEsm45QY2gL8+YRyn5Zqx/JHR5cxTCC1GPHxu5w=;
 b=Ff05sBrh0ziOGyQAclzSnwAKB4cCYk7amUrIXomvGuVtZL78qtbAsj+f
 826yjo/CPhApj/ssaQlRSh97ksqugAU7sxw47BMB3ajkfVoqLN6/icAcD
 6octe5EWuiPS5V9Nwlkp2aAL1ymZUUPTMMeOXOF5Hq4FksfuNXZTBD4fl
 I8ap7jg6LMSOYzflChBLiV2Jz7e6ucuu4Y6qJVQo/CZVwsb6LaKjlbj0r
 P2uGsYqGdA2TL/HXlwDwpU/tNAvxNKR/ouKcNLHguwzY0tLLKDH34dROL
 gEc5BbzaBOe+4zfODmlWI+41n86/z6z8nvTcDZLrGkCn9gKlo7U2YZFBB g==;
X-CSE-ConnectionGUID: SSrDQ2YsSfSKJnvhpkX3Yg==
X-CSE-MsgGUID: tOcfDQv4RjmJ6RNRN2Y7WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35284180"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35284180"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 09:24:15 -0800
X-CSE-ConnectionGUID: 1n6IAXVmTBe7TZD9eH0wIg==
X-CSE-MsgGUID: 1nAO5U2xT8SFyW4jjg/0Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121525299"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.41])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 09:24:14 -0800
Date: Thu, 19 Dec 2024 11:24:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, ryszard.knop@intel.com
Subject: Add env info to igt_runner (was: Re: [PATCH i-g-t 4/4]
 lib/igt_device_scan: Fix scan vs bind/unbind/reload)
Message-ID: <ujidcfwjkj5mvdc7nsfhbl76gk4vswl7ibqkwy24xieiwlpfer@ly57qp226qsh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
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

hijacking the thread and adding some people to Cc for the igt_runner question.
Previously In-Reply-To: <rnw3q6mhthnwyvowvszr2gllyjtbb2mozk4em272xlmkvm7pyl@szbhtg3sd7d7>

On Thu, Dec 19, 2024 at 10:35:00AM -0600, Lucas De Marchi wrote:
>On Wed, Dec 18, 2024 at 07:34:19AM +0100, Zbigniew Kempczyński wrote:
>>On Tue, Dec 17, 2024 at 09:13:24PM -0800, Lucas De Marchi wrote:
>>>There's no guarantee a card will end up with the same device node when
>>>modules are loaded/unloaded and drivers bound/unbound. There's some
>>>fundamental issue with the igt's the way it is and it's also puzzling
>>>from the logs it looks like the device vanished from the bus, when in
>>>reality is just the SW state out of sync with what the kernel is
>>>exporting.
>>>
>>>Re-scanning when trying to match a device is not expensive compared to
>>>what most tests are doing, so simply force it to occur whenever trying
>>>to match a card.
>>
>>I also should comment the above. It is generally true, but I've noticed
>>getting attributes might be expensive. Even it may take up to few
>>seconds, that's why I've added some attributes we don't fetch from udev
>>(see is_on_blacklist()). If I'm not wrong getting 'config' was a cause
>>to limit attributes we fetch.
>
>why would we get all attributes and exclude some?  Shouldn't we get only
>the attributes we actually use? AFAIK this logic is basically used by
>--device/IGT_DEVICE, right? What filters we normally use?
>
>I usually pass the pci slot (because I know that won't change
>dynamically and cause surprises). Apparently CI passes vendor/devid:
>
>	export IGT_DEVICE=pci:vendor=$1,device=$2
>
>(but it seems to vary depending on pipeline)
>
>Some devs pass the device node directly too as in a lot of places
>there's only ever card0 possible.


Could we dump the env and args somewhere so we know how igt_runner or
individual tests are being called without looking at the CI piepeline
sources? I was thinking about either having that info in the stdout
output of igt_runner or in the json. Another possibility would be in
dmesg, but I'm not sure it's a good option. Thoughts?

My preferred option would be to have e.g.:

{
   "__type__": "TestrunResult",
   "results_version": 10,
   "name": "xe-2403-995cd30a4e222b6a7b4b40c36219e4937fd7109e\/bat-bmg-1\/0",
   "uname": "Linux bat-bmg-1 6.13.0-rc3-xe+ #1 SMP PREEMPT_DYNAMIC Thu Dec 19 14:40:51 UTC 2024 x86_64",
   "time_elapsed": {
     "__type__": "TimeAttribute",
     "start": 1734621126.8734231,
     "end": 1734621288.5994539
   },
   "environment": {
     "IGT_DEVICE": ...
     <any IGT_* env var>
   },
   "argv": [ ... ]


Lucas De Marchi
