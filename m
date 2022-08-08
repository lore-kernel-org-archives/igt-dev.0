Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7469112D4D
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 19:59:13 +0000 (UTC)
Message-ID: <74ab4d10-183f-0450-87ae-57fb6324eaa4@quicinc.com>
Date: Mon, 8 Aug 2022 12:59:08 -0700
MIME-Version: 1.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220804220235.26076-1-quic_rohiiyer@quicinc.com>
 <20220804220235.26076-4-quic_rohiiyer@quicinc.com>
 <85r11q8wkn.wl-ashutosh.dixit@intel.com>
 <b8fd14ff-681b-df11-ae6b-c9b859142571@quicinc.com>
 <85pmha8qj0.wl-ashutosh.dixit@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <85pmha8qj0.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v6 3/3] tests/kms_writeback: Enhance
 kms_writeback for custom modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh

On 8/8/2022 12:49 PM, Dixit, Ashutosh wrote:
> On Mon, 08 Aug 2022 10:41:50 -0700, Abhinav Kumar wrote:
>>
>> Hi Ashutosh
>>
>> On 8/8/2022 10:38 AM, Dixit, Ashutosh wrote:
>>> On Thu, 04 Aug 2022 15:02:35 -0700, Rohith Iyer wrote:
>>>>
>>>> 	igt_subtest("writeback-pixel-formats") {
>>>> +		igt_skip_on(data.dump_check || data.list_modes);
>>>> 		drmModePropertyBlobRes *formats_blob = get_writeback_formats_blob(output);
>>>> 		const char *valid_chars = "01234568 ABCGNRUVXY";
>>>> 		unsigned int i;
>>>
>>> $ ninja -C build
>>> ninja: Entering directory `build'
>>> [120/1183] Compiling C object tests/kms_writeback.p/kms_writeback.c.o
>>> ../tests/kms_writeback.c: In function ‘__igt_unique____real_main480’:
>>> ../tests/kms_writeback.c:532:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>>>     532 |                 drmModePropertyBlobRes *formats_blob = get_writeback_formats_blob(output);
>>>         |                 ^~~~~~~~~~~~~~~~~~~~~~
>>> ../tests/kms_writeback.c:555:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>>>     555 |                 igt_fb_t invalid_output_fb;
>>>         |                 ^~~~~~~~
>>> ../tests/kms_writeback.c:571:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>>>     571 |                 igt_fb_t output_fb;
>>>         |                 ^~~~~~~~
>>> ../tests/kms_writeback.c:586:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>>>     586 |                 igt_fb_t output_fb;
>>>         |                 ^~~~~~~~
>>
>> All these warnings were pre-existing warnings in kms_writeback even before
>> this series and not introduced by this series.
> 
> Hi Abhinav, doesn't seem to be the case, git blame:
> 
>      531 22fa5ae83a885 (Rohith Iyer                   2022-08-04 15:02:35 -0700 531)             igt_skip_on(data.dump_check || data.list

Ah, you are right. Will fix this asap.
> 
>> However, we will be happy to fix these for the benefit of all.
> 
> Thanks, yes please fix.
