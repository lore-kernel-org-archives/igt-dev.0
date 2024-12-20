Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678A0E7718B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 17:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADF510F009;
	Fri, 20 Dec 2024 17:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CG42BY5+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6632C10F009
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734716266; x=1766252266;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=Oy6Oiyxhs6J8bKsPKJOYvRWHGv7qeT97XC2VGeg7vWA=;
 b=CG42BY5+/viFMxhCFIZWFN22GPlxl6dmQVb3V0ICAQwe2art2nzORveF
 tn6lPGtchoYbfCNxdp82fWa8RhgTtOYyeEO4wTmBe89FgI4N+Q4pD1Pq7
 QqMzXW7X8ekfFZP5ZFVTIWn/2MbR9ZSRZ7qiGOSFk4Csp3ps/wzQER4df
 XN6NcO1cEJCkMy/EYpQIVyR2fLFxVZkR9u3oIYPthoF5ucKx9nGwiWZhN
 05qLSpswNtCOkvJH+vrqCT1bHnl2WyMh4WMJfYwS2dqBHWA2vJDGIULCM
 YhSsyofoigIut5aN3VGJqCgryefgRILdMi+oomPXv1kV1fS/6ZM8Df/sZ A==;
X-CSE-ConnectionGUID: XSfBbgfVREOC6LC7Y8W96A==
X-CSE-MsgGUID: Jvkh/C4ZQm6EzN8HKvpC1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="22862436"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="22862436"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:37:45 -0800
X-CSE-ConnectionGUID: Q561DLDjQEi5HXZUdcNm3A==
X-CSE-MsgGUID: NNnWOmSBSmeOp0FRSr4Phg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98619114"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.128])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:37:44 -0800
Date: Fri, 20 Dec 2024 11:37:39 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 ryszard.knop@intel.com, jari.tahvanainen@intel.com
Subject: Re: Add env info to igt_runner (was: Re: [PATCH i-g-t 4/4]
 lib/igt_device_scan: Fix scan vs bind/unbind/reload)
Message-ID: <lhhpaph27pearysh6cjbujywofndoo634vcy4duiszqcarzrsx@t5ft2rrtbbfo>
References: <ujidcfwjkj5mvdc7nsfhbl76gk4vswl7ibqkwy24xieiwlpfer@ly57qp226qsh>
 <20241220170522.3nevqraywqmhlix2@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220170522.3nevqraywqmhlix2@kamilkon-desk.igk.intel.com>
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

On Fri, Dec 20, 2024 at 06:05:22PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-12-19 at 11:24:09 -0600, Lucas De Marchi wrote:
>> hijacking the thread and adding some people to Cc for the igt_runner question.
>> Previously In-Reply-To: <rnw3q6mhthnwyvowvszr2gllyjtbb2mozk4em272xlmkvm7pyl@szbhtg3sd7d7>
>>
>> On Thu, Dec 19, 2024 at 10:35:00AM -0600, Lucas De Marchi wrote:
>> > On Wed, Dec 18, 2024 at 07:34:19AM +0100, Zbigniew Kempczyński wrote:
>> > > On Tue, Dec 17, 2024 at 09:13:24PM -0800, Lucas De Marchi wrote:
>> > > > There's no guarantee a card will end up with the same device node when
>> > > > modules are loaded/unloaded and drivers bound/unbound. There's some
>> > > > fundamental issue with the igt's the way it is and it's also puzzling
>> > > > from the logs it looks like the device vanished from the bus, when in
>> > > > reality is just the SW state out of sync with what the kernel is
>> > > > exporting.
>> > > >
>> > > > Re-scanning when trying to match a device is not expensive compared to
>> > > > what most tests are doing, so simply force it to occur whenever trying
>> > > > to match a card.
>> > >
>> > > I also should comment the above. It is generally true, but I've noticed
>> > > getting attributes might be expensive. Even it may take up to few
>> > > seconds, that's why I've added some attributes we don't fetch from udev
>> > > (see is_on_blacklist()). If I'm not wrong getting 'config' was a cause
>> > > to limit attributes we fetch.
>> >
>> > why would we get all attributes and exclude some?  Shouldn't we get only
>> > the attributes we actually use? AFAIK this logic is basically used by
>> > --device/IGT_DEVICE, right? What filters we normally use?
>> >
>> > I usually pass the pci slot (because I know that won't change
>> > dynamically and cause surprises). Apparently CI passes vendor/devid:
>> >
>> > 	export IGT_DEVICE=pci:vendor=$1,device=$2
>> >
>> > (but it seems to vary depending on pipeline)
>> >
>> > Some devs pass the device node directly too as in a lot of places
>> > there's only ever card0 possible.
>>
>>
>> Could we dump the env and args somewhere so we know how igt_runner or
>> individual tests are being called without looking at the CI piepeline
>> sources? I was thinking about either having that info in the stdout
>> output of igt_runner or in the json. Another possibility would be in
>> dmesg, but I'm not sure it's a good option. Thoughts?
>
>Not only that, also parameters used to start igt_runner,
>what was in .igtrc file (if any), current wall time,

does CI actually have an .igtrc? We can add, but I'd prioritize
things that are used and that we don't have annotated anywhere (with
easy/public access).

>testlist prepared to run, free memory and free disk.
>metadata file for igt_resume, it will enable with prepared
>teslist to re-execute run.

talking about igt_resume, there may be some issues doing this at
the igt_runner level: it may not match from one test to another if the
env didn't match when it started running from when it finished.

1) it may have gone through igt_resume after a reboot (hopefully in the
    same machine)

2) for shards we slice the testlist and give it to different machines.
    Ideally they have the same env, config, etc, but that also is not
    guaranteed.

    Checking random tests in https://intel-gfx-ci.01.org/tree/intel-xe/shards-all.html?

    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2404-26e6464dff2b3fe53049bd3b6e426cec43beb165/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-2-4-rc-ccs.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-2404-26e6464dff2b3fe53049bd3b6e426cec43beb165/shard-bmg-1/igt@core_auth@basic-auth.html

    Do I understand it right that we simply have multiple resultsXX.json
    for different runs so it's fine to create it at the global level?
    What about a resume (1)?

>
>Also kernel config from /boot ? Or should it be in shard
>run info (avoided duplication).

may be too much as we could extract it from the kernel used by CI
since we have CONFIG_IKCONFIG=y. If we want igt_runner to collect this
info and save in the results, then it should probably grab it from
/proc/config.gz to make sure it's guaranteed to be in sync with the
actual kernel being used.  Quick check on what we'd need:

$ # simulate grabbing the /proc/config.gz and piping it through base64
$ # to be able to add in the json
$ ./scripts/extract-ikconfig build64/arch/x86/boot/compressed/vmlinux | gzip | base64 > config.gz.b64
$ ls -lh config.gz.b64
-rw-rw-r-- 1 lucas lucas 70K Dec 20 09:30 config.gz.b64


Humn... I would concentrate on things that aren't currently available
anywhere.

>
>Maybe some other info, either igt_facts or lspci output?

for lscpci output it seems there's already a TODO comment that nobody
ever tackled :). And "Options" may is a reference to what we are talking
here wrt env and args:

$ git grep -A2 -B2 lspci  runner/
runner/resultgen.c-      * Result fields that are TODO:
runner/resultgen.c-      *
runner/resultgen.c:      * - lspci
runner/resultgen.c-      * - options
runner/resultgen.c-      */

Lucas De Marchi

>Should we ask also display team and our CI?
>
>+cc Jari from display
>
>Regards,
>Kamil
>
>>
>> My preferred option would be to have e.g.:
>>
>> {
>>   "__type__": "TestrunResult",
>>   "results_version": 10,
>>   "name": "xe-2403-995cd30a4e222b6a7b4b40c36219e4937fd7109e\/bat-bmg-1\/0",
>>   "uname": "Linux bat-bmg-1 6.13.0-rc3-xe+ #1 SMP PREEMPT_DYNAMIC Thu Dec 19 14:40:51 UTC 2024 x86_64",
>>   "time_elapsed": {
>>     "__type__": "TimeAttribute",
>>     "start": 1734621126.8734231,
>>     "end": 1734621288.5994539
>>   },
>>   "environment": {
>>     "IGT_DEVICE": ...
>>     <any IGT_* env var>
>>   },
>>   "argv": [ ... ]
>>
>>
>> Lucas De Marchi
