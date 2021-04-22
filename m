Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850F06E0DF
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Apr 2021 14:08:08 +0000 (UTC)
References: <20210416172724.3203107-1-markyacoub@chromium.org>
 <YIET+VN+JnRrbuja@platvala-desk.ger.corp.intel.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <caafcb6d-a664-5df3-8e3c-59ffb2e0bd84@amd.com>
Date: Thu, 22 Apr 2021 10:08:00 -0400
In-Reply-To: <YIET+VN+JnRrbuja@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2] tests/kms_atomic_transition: Enable
 Primary Plane on Enabling CRTC.
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
To: Petri Latvala <petri.latvala@intel.com>, Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-04-22 2:13 a.m., Petri Latvala wrote:
> On Fri, Apr 16, 2021 at 01:27:24PM -0400, Mark Yacoub wrote:
>> From: Mark Yacoub <markyacoub@google.com>
>>
>> Setup all plane params before committing anything.
>> Do not disable Primary Plane whenever a CRTC is getting enabled.
>>
>> AMD Driver requires the primary plane to be enabled whenever the CRTC is, otherwise
>> drm_mode_cursor_universal may end up trying to enable the cursor plane while all other
>> planes are disabled, which is not supported by the hardware.
>>
>> === Changes from v1 ===
>> Remove product names from commit message
>>
>> Cc: Nicholas.Kazlauskas@amd.com
>> ---
>>   tests/kms_atomic_transition.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> 
> I've asked Intel display folks to chime in whether i915 needs any of
> this flow needs to be unchanged with is_i915_device(), no response
> yet. We also need a word from someone to confirm that this patch does
> what it says on the tin for amdgpu. Nicholas, are you able to get
> someone to look at this?
> 
> 

Shifting the initial commit after setup_parms seems correct, but I'm not 
sure if avoiding the disable has any impact to the test itself. I would 
think that it does from initial inspection.

The test comment talks about the RMFB CRTC disable case but I don't 
actually see anything testing this specifically in the test? I didn't 
think out fencing was related.

Regards,
Nicholas Kazlauskas
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
