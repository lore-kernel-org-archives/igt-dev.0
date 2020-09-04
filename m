Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C7B6E02E
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2020 09:40:30 +0000 (UTC)
References: <20200806132935.23293-1-karthik.b.s@intel.com>
 <594bbda7-65ca-91d9-5a63-96f95bf9ac83@daenzer.net>
 <20200807085414.GC7444@platvala-desk.ger.corp.intel.com>
 <a12cbfd5-1e13-2907-816d-f9f93976adc7@intel.com>
 <20200904075305.GU7444@platvala-desk.ger.corp.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <84713883-d84f-531d-4798-56b6d595efb7@intel.com>
Date: Fri, 4 Sep 2020 15:10:26 +0530
MIME-Version: 1.0
In-Reply-To: <20200904075305.GU7444@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_async_flips: Add test to
 validate asynchronous flips
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
List-ID: <igt-dev@lists.freedesktop.org>



On 9/4/2020 1:23 PM, Petri Latvala wrote:
>> On 8/7/2020 2:24 PM, Petri Latvala wrote:
>>> DRIVER_INTEL and the use of i915's X_TILED are the intel-specifics
>>> that I spot, anything else in there?
> 
> What I didn't spot is that kms_plane_multiple for example already uses
> I915 X-tiled mod unconditionally and it seems to be fine for at least
> AMDGPU... So it's DRIVER_INTEL only that needs changing for a generic
> test.
> 

Thanks Petri.
I'll change DRIVER_INTEL to DRIVER_ANY in the next version to make the 
test generic.

Thanks,
Karthik.B.S
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
