Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B3089C21
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Mar 2021 12:41:31 +0000 (UTC)
References: <20210219172738.263820-1-jcline@redhat.com>
 <20210305164253.11788-1-jcline@redhat.com>
 <20210305164253.11788-2-jcline@redhat.com>
 <YEXkhTnlwCaFo9Fk@platvala-desk.ger.corp.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <d95e9fef-ee70-4875-beb6-7ebfee4c56f7@intel.com>
Date: Mon, 8 Mar 2021 18:11:09 +0530
MIME-Version: 1.0
In-Reply-To: <YEXkhTnlwCaFo9Fk@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] kms_hdr: Skip HDR tests on
 pre-Kaby Lake Intel devices
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
To: Petri Latvala <petri.latvala@intel.com>, Jeremy Cline <jcline@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 08-Mar-21 2:17 PM, Petri Latvala wrote:
> On Fri, Mar 05, 2021 at 11:42:52AM -0500, Jeremy Cline wrote:
>> According to the Intel documentation[0] I could find, HDR support is
>> only in Kaby Lake+. Skip tests in kms_hdr if the hardware doesn't
>> support HDR.
>>
>> [0] https://www.intel.com/content/dam/support/us/en/documents/graphics/HDR_Intel_Graphics_TechWhitePaper.pdf
>>
>> Signed-off-by: Jeremy Cline <jcline@redhat.com>
> 
> 
> While that might be true, strictly speaking IGT tests are not testing
> the HW capabilities but the kernel interfaces. The difference is often
> only interesting for nitpicking.
> 
> However, in this case a good argument can be made either way, with
> what the correct behaviour with setting the "max bpc" property when
> the HW doesn't support HDR _output_ should be. IGT tests should be
> written the way one would expect "real" userspace to behave; does the
> documented kernel interface require userspace to detect the device id
> somehow? The connector property is there so one would assume setting
> it should work and do something.
> 
> A good argument can also be made that even though we're testing "just
> the interface", we (Intel) should have a separate test that requires
> actual HW support...
> 
> Swati, Maarten, thoughts on this? Are we even testing the right things
> for i915 at all? Are we able to express the HW requirement for HDR
> with something other than comparing devid? Should we? (If we should
> not, please suggest a better way to get around the issue being fixed
> here)

There are 2 types of tests which are being validated in kms_hdr
(i) bpc switch
(ii) hdr metadata
And both these tests will skip on platforms which doesn't support 
respective connector
properties (MAX_BPC, HDR_OUTPUT_METADATA resp). These tests are 
independent of platforms on which they are being tested.
This can be validated from the link below:
https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=kms_hdr
where you can see platforms which doesn't support either max_bpc or 
hdr_metadata
connector properties; tests are being skipped.

And I don't think anything is being fixed here, with gen specific check 
even bpc switch
tests cases won't get executed. MAX_BPC is supported by platforms prior 
to gen9 aswell. But like said HDR is supported is gen9+; so we can lose 
coverage of bpc switch test cases on non-HDR platforms.
IMO there is no need to express HW requirement for HDR; this is already 
being
handled smoothly through connector properties.
> 
> 

-- 
~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
