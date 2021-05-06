Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479EF6E51B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 May 2021 08:02:58 +0000 (UTC)
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Date: Thu, 6 May 2021 08:02:54 +0000
Message-ID: <7c8c8563ef984d0daa7bb2e0f0904f49@intel.com>
References: <20210504070415.5057-1-kunal1.joshi@intel.com>
 <YJJVE5S1Y1kEMCD+@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YJJVE5S1Y1kEMCD+@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_chamelium: Retry DP FSM on
 Failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

>>From: Latvala, Petri <petri.latvala@intel.com> 
>>Sent: Wednesday, May 5, 2021 1:50 PM
>>To: Joshi, Kunal1 <kunal1.joshi@intel.com>
>>Cc: igt-dev@lists.freedesktop.org; Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
>>Subject: Re: [PATCH i-g-t] lib/igt_chamelium: Retry DP FSM on Failure

>>On Tue, May 04, 2021 at 07:04:15AM +0000, Kunal Joshi wrote:
>> We have a thread called chamelium_fsm_mon which monitors HPD events 
>>triggered by chamelium, Unfortunately not always the HPD event arrives 
>> in a fixed interval (mostly does), Quick fix to this is to retry.
>> 
>> v2: Remove redundant assert (Bhanu)
>> 
>> Fixes :- https://gitlab.freedesktop.org/drm/intel/-/issues/262
>> Cc: Petri Latvala <petri.latvala@intel.com>
>> Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

>Another extra empty line.
>With the extra empty lines removed this is
>Reviewed-by: Petri Latvala <petri.latvala@intel.com>


>Is CaptureVideo really the only method that needs this retrying?
CaptureVideo is the only command currently which can trigger DP FSM,
There are other commands such as StartVideoCapture but we don't use them,
But will add those incase somebody uses it.

Thanks for the review and feedback petri.

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
