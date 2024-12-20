Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2BCE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 18:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D865610E07A;
	Fri, 20 Dec 2024 18:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+w9LoQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C6210E07A
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 18:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734720736; x=1766256736;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ID8k8tVGHkwMO/YYn9yy5VSOszmXlb89Fn8OtCLJHhs=;
 b=O+w9LoQictikGbU95eEqf0mNeRVd8IjOW+YvIn9II5n9DEK0ymiDmphZ
 gNBuo+xrgyDpyby/uLDf0iANY67Na31Jn/m869Tu1dKGe5VWlvd6rtb3T
 l4gt9hcUkXazMPxKB4I/S72t9q29NbOqHK0ic5NzSij8AiHW037fN3NFh
 7j6Af201wq54c2HOSA3xJG4H8QD9ctoCRt7UwGAMYGot58QxeF4I/FEj2
 rPb8aO/wi4pE1EGK0wl79UpQSL4/ydz48gM/mfmjW/GhWa0uMBmsRSS4+
 e61M4FDuWy0P7VNSaYo5CGJKAh+ls5Ff/+Bh1RiChYbDvg/L1yoFMWTTC A==;
X-CSE-ConnectionGUID: qHa8KNmZTsOHGzUo7TnCww==
X-CSE-MsgGUID: 5AiOOVi5T9y8Q6YbvpwM7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45968862"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="45968862"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:52:16 -0800
X-CSE-ConnectionGUID: qKbwNesOQA+cadjqt4gsUg==
X-CSE-MsgGUID: /nDk7Ug9QnGBukhckBW43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102702386"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.128])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:52:15 -0800
Date: Fri, 20 Dec 2024 12:52:10 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t 4/4] lib/igt_device_scan: Fix scan vs
 bind/unbind/reload
Message-ID: <3xkwlifj3hdp7edmyd76xav4ww427vi2nzdt7n6om65zdjjtj7@ngrqrmj2p5ro>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
 <20241218051324.2696557-5-lucas.demarchi@intel.com>
 <20241218063419.zqikqynzuvi5vake@zkempczy-mobl2>
 <rnw3q6mhthnwyvowvszr2gllyjtbb2mozk4em272xlmkvm7pyl@szbhtg3sd7d7>
 <20241220065933.k3outjjmfgvpuxjn@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220065933.k3outjjmfgvpuxjn@zkempczy-mobl2>
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

On Fri, Dec 20, 2024 at 07:59:33AM +0100, Zbigniew Kempczyński wrote:
>On Thu, Dec 19, 2024 at 10:35:00AM -0600, Lucas De Marchi wrote:
>> On Wed, Dec 18, 2024 at 07:34:19AM +0100, Zbigniew Kempczyński wrote:
>> > On Tue, Dec 17, 2024 at 09:13:24PM -0800, Lucas De Marchi wrote:
>> > > There's no guarantee a card will end up with the same device node when
>> > > modules are loaded/unloaded and drivers bound/unbound. There's some
>> > > fundamental issue with the igt's the way it is and it's also puzzling
>> > > from the logs it looks like the device vanished from the bus, when in
>> > > reality is just the SW state out of sync with what the kernel is
>> > > exporting.
>> > >
>> > > Re-scanning when trying to match a device is not expensive compared to
>> > > what most tests are doing, so simply force it to occur whenever trying
>> > > to match a card.
>> >
>> > I also should comment the above. It is generally true, but I've noticed
>> > getting attributes might be expensive. Even it may take up to few
>> > seconds, that's why I've added some attributes we don't fetch from udev
>> > (see is_on_blacklist()). If I'm not wrong getting 'config' was a cause
>> > to limit attributes we fetch.
>>
>> why would we get all attributes and exclude some?  Shouldn't we get only
>> the attributes we actually use? AFAIK this logic is basically used by
>> --device/IGT_DEVICE, right? What filters we normally use?
>
>At moment of developing I didn't know how this code might be used by others
>to write filters. I had only in my mind sriov scenario and I assumed
>more attributes might be useful in the meaning - lets see how it goes.
>
>Currently we use three attributes: driver, sriov_numvfs and physfn.
>I would rewrite this for support both - fetching all attributes without
>excluding anything (for lsgpu -p) and second for normal use so we would

ok... for tools like lsgpu we will never scan more than once.

>get only attributes we use in filters. We would achieve two goals - keep
>lsgpu list of props/attrs almost intact (with exception we'll fetch them
>all now) and have current state of drm device nodes in the test.
>
>Question - will you write this or you want from me to do this? I can
>do this on the beginning of the year. If you're wondering what for
>-p in lsgpu - it is convinient for me to use it instead of udevadm.

if you can do it, it's better

>
>>
>> I usually pass the pci slot (because I know that won't change
>> dynamically and cause surprises). Apparently CI passes vendor/devid:
>>
>> 	export IGT_DEVICE=pci:vendor=$1,device=$2
>>
>> (but it seems to vary depending on pipeline)
>>
>> Some devs pass the device node directly too as in a lot of places
>> there's only ever card0 possible.
>>
>> Are there other uses?
>
>In Intel likely not, outside - I don't know.
>
>BTW I've checked the problematic attribute 'config' and it seems it
>is immediately fetched on nvidia card now. Still it is binary, so it
>will require to be ignored (...) or ascii encoded.


thanks
Lucas De Marchi
