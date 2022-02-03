Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2F110FC6A
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Feb 2022 14:35:36 +0000 (UTC)
Message-ID: <e478f056-c07a-1b90-024d-2006cac152e5@amd.com>
Date: Thu, 3 Feb 2022 09:35:27 -0500
Content-Language: en-US
References: <20220131142818.2686782-1-Rodrigo.Siqueira@amd.com>
 <20220131142818.2686782-2-Rodrigo.Siqueira@amd.com>
 <Yfu2nPEIQQT+6l/t@platvala-desk.ger.corp.intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Yfu2nPEIQQT+6l/t@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC i-g-t 1/1] MAINTAINERS: Introduce MAINTAINERS
 file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Solomon Chiu <solomon.chiu@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, igt-dev@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>, Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-02-03 06:03, Petri Latvala wrote:
> On Mon, Jan 31, 2022 at 09:28:18AM -0500, Rodrigo Siqueira wrote:
>> IGT is growing in terms of new vendors actively using it. Right now, we
>> only have Intel CI to validate new patches, which can create a situation
>> where bugs get accidentally introduced to other vendors. To alleviate
>> this problem and also making easy for other developers to be aware of
>> some specific changes, I'm proposing the introduction of the MAINTAINERS
>> file as the one used in the Linux kernel. With this approach, we can
>> have multiple enginers from different companies as reviewers for
>> specific tests, and contributors should use get_maintainers script to
>> find the right people to address their changes.
>>
>> Cc: Arkadiusz Hiler <arek@hiler.eu>
>> Cc: Petri Latvala <petri.latvala@intel.com>
>> Cc: Mark Yacoub <markyacoub@google.com>
>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Sean Paul <seanpaul@chromium.org>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Sun Peng Li(Leo) <sunpeng.li@amd.com>
>> Cc: Chao-kai Wang (Stylon) <stylon.wang@amd.com>
>> Cc: Wayne Lin <wayne.lin@amd.com>
>> Cc: Nicholas Choi <nicholas.choi@amd.com>
>> Cc: Martin Peres <martin.peres@mupuf.org>
>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
>> Cc: Qingqing Zhuo (Lilian) <qingqing.zhuo@amd.com>
>> Cc: Solomon Chiu <solomon.chiu@amd.com>
>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> 
> A tentative ack on this effort from me, for getting more contact
> points formally documented.
> 
> As for the implementation of it, I know this is copied from the kernel
> so I know the reason why they're there, but reduce the useless
> complexity in the documentation comment like the type of version
> control in a subtree, and things that just aren't true for IGT, like
> asking for testing from 4 or 5 people.
> 

I tend to agree with the statement that this has too much useless
complexity and would love if that'd be dropped/cleaned up, though
that could come at a later time (and might be less important if
IGT moves to gitlab MRs).

Harry

> (Not to mention you're using S to describe the people, whereas the
> original usage in kernel is to describe the files)
> 
> And the scripting to use this should be contained within
> IGT. get_maintainer.pl is GPL-2.0 so we could in theory just copy
> it. It isn't used to produce binaries so IGT should still remain
> distributable with MIT terms but IANAL...
> 
> 
