Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB44CCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 10:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA4810E2E2;
	Thu, 26 Sep 2024 10:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAdc0owa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11EA10E184
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727346539; x=1758882539;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SyKDnQ65PqDxalXCl6ImNV8TBBRqo+TtlPY7v0bXX0o=;
 b=LAdc0owaFDozetjnIJX3uJnzBNP6xkRVAc+wXZZ7bEpYViQQRt2TFGLD
 VFC18kQdhsFmL9TT/qVN+//8shN4V/77gEytYvN038xAYTeQO+UGZA+7L
 fbpjP4S9X3yhX9CkHGQmVL17CG2cha6SPo24j4QV6G/VJRFup+DkhWJOV
 cnCv+lc1HqAvx5bq+feWYh6IxOAMynTszluQiQQbPdK1fsfrRR4VqN+W5
 S4inhPFsMJgmvLWHs/oQmrrny3qj+/62WFucQjIe6zc4zWV0mVPMiEmuJ
 1gBG7jxvqqDV91HjJwhg4gbWaEuKw5Z43rYTNL0iWh9aDJ2x4z761oNCd A==;
X-CSE-ConnectionGUID: JorJ5TCMQMut1/fe4j8AQQ==
X-CSE-MsgGUID: xp9tTb/0SfKfFza9lQke9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37812107"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="37812107"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:28:59 -0700
X-CSE-ConnectionGUID: N98lhWCJQGC0f698aHdvDg==
X-CSE-MsgGUID: 8WYewS4IQDmXFHPCx5Hmjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="71771386"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.133])
 ([10.245.246.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:28:54 -0700
Message-ID: <3b0f85a3-60c0-45fc-83a2-0fbaae1186f6@intel.com>
Date: Thu, 26 Sep 2024 12:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 09/16] drm-uapi/xe: Sync with eudebug uapi
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
 <20240918113017.144687-10-christoph.manszewski@intel.com>
 <ZvRjJlSZ2tDeyoxq@intel.com> <b9f43675-db3d-401a-92ec-f77db112fa20@intel.com>
 <ZvUtZlbFuwXU1Hnm@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZvUtZlbFuwXU1Hnm@intel.com>
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

Hi Ville,

On 26.09.2024 11:46, Ville Syrjälä wrote:
> On Thu, Sep 26, 2024 at 11:01:22AM +0200, Manszewski, Christoph wrote:
>> Hi Ville,
>>
>> On 25.09.2024 21:23, Ville Syrjälä wrote:
>>> On Wed, Sep 18, 2024 at 01:30:10PM +0200, Christoph Manszewski wrote:
>>>> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>>>
>>>> Align with kernel commit 09411c6ecbef ("drm/xe/eudebug: Add debug
>>>> metadata support for xe_eudebug") from:
>>>>
>>>> https://gitlab.freedesktop.org/miku/kernel.git
>>>>
>>>> which introduces most recent changes to the eudebug uapi.
>>>>
>>>> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>>>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>>>> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>>> ---
>>>>    include/drm-uapi/xe_drm_eudebug.h | 341 ++++++++++++++++++++++++++++++
>>>
>>> I don't think non-upstream stuff should go here. This
>>> will now screw up anyone (namely me) attempting to do
>>> a bulk update the uapi headers.
>>
>> Can you share how exactly? And also where it should go according to
>> you/how that would fix the problem?
> 
> include/drm-uapi-experimental or something?

Sure, I'll try to move it.

> 
>>
>> In general, the kernel reference for this series tries to keep up with
>> the latest Xe driver. If there is some breaking change in the Xe uapi,
>> then just let us know, we will adapt this header ourselves.
> 
> I don't care what's in the header. If I simply follow the documented
> procedure to update the headers this header is going to be deleted.

Fair point, now I see that the documented way is to remove everything.

Thanks,
Christoph

> 
> And the fact that the eudebug stuff is disabled by default in
> meson_options means that I probably wouldn't even notice that
> anything broke. This time I did catch the issue manually because
> having a header completely deleted looked a bit suspicious in
> the diffstat.
> 
> One hopes that CI would also have caught it, but I don't actually
> know whether CI enables this stuff either? >
