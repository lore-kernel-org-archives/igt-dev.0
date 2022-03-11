Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EBC10E542
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 16:39:45 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
To: Petri Latvala <petri.latvala@intel.com>
In-Reply-To: <Yis6ajirjjAn2Eel@platvala-desk.ger.corp.intel.com>
References: <20220311113712.159192-1-jani.nikula@intel.com>
 <Yis6ajirjjAn2Eel@platvala-desk.ger.corp.intel.com>
Date: Fri, 11 Mar 2022 18:39:41 +0200
Message-ID: <87r178wiia.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt: don't include i915_pciids.h
 everywhere
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 11 Mar 2022, Petri Latvala <petri.latvala@intel.com> wrote:
> On Fri, Mar 11, 2022 at 01:37:12PM +0200, Jani Nikula wrote:
>> Macros from i915_pciids.h are only needed in one place,
>> intel_device_info.c, and that already includes the header. Remove an
>> unnecessary global include.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Thanks, pushed, got this from git push:

remote: hint: The 'hooks/update' hook was ignored because it's not set as executable.
remote: hint: You can disable this warning with `git config advice.ignoredHook false`.
remote: remote: Updating patchwork state for https://patchwork.freedesktop.org/project/intel-gpu-tools/list/        
remote: remote: I: patch #478015 updated using rev c253caee9b776333a46268d85fbdf0feb79c8094.        
remote: remote: I: 1 patch(es) updated to state Accepted.        
remote: hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
remote: hint: You can disable this warning with `git config advice.ignoredHook false`.
remote: To ssh://kemper.freedesktop.org/git/xorg/app/intel-gpu-tools
remote:    b7b35f97..c253caee  c253caee9b776333a46268d85fbdf0feb79c8094 -> master
To ssh://gitlab.freedesktop.org/drm/igt-gpu-tools
   b7b35f974bc3..c253caee9b77  master -> master

Did I miss a memo on pushing to igt?


BR,
Jani.

>
>> ---
>>  lib/igt.h | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/lib/igt.h b/lib/igt.h
>> index 0bf98aa5d767..96a368e11bbf 100644
>> --- a/lib/igt.h
>> +++ b/lib/igt.h
>> @@ -26,7 +26,6 @@
>>  
>>  #include "drmtest.h"
>>  #include "i915_3d.h"
>> -#include "i915_pciids.h"
>>  #include "igt_aux.h"
>>  #include "igt_core.h"
>>  #include "igt_core.h"
>> -- 
>> 2.30.2
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
