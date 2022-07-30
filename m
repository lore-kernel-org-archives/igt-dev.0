Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E24310E040
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Jul 2022 00:38:11 +0000 (UTC)
Message-ID: <3f0a03a0-1686-5fb2-4418-d7b974e23eaa@quicinc.com>
Date: Fri, 29 Jul 2022 17:38:09 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220728232033.589-1-quic_rohiiyer@quicinc.com>
 <20220728232033.589-2-quic_rohiiyer@quicinc.com>
 <YuOwTp1m2YCCUS9u@platvala-desk.ger.corp.intel.com>
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
In-Reply-To: <YuOwTp1m2YCCUS9u@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/3] lib/igt_kms: Add helper to parse
 mode string
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

On 7/29/2022 3:02 AM, Petri Latvala wrote:
> On Thu, Jul 28, 2022 at 04:20:31PM -0700, Rohith Iyer wrote:
>> Add helper method to parse a mode string and verify
>> correct number of arguments. This standardizes parsing mode strings.
>>
>> Changes made in V4:
>>   - Corrected documentation
>>   - Changed *mode_string to a const char from char
>>
>> Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
>> ---
>>   lib/igt_kms.c | 26 ++++++++++++++++++++++++++
>>   lib/igt_kms.h |  1 +
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 14064614..c17c10ea 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -5777,3 +5777,29 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>>   
>>   	return true;
>>   }
>> +
>> +/**
>> + * igt_parse_mode_string:
>> + * @mode_string: modeline string
>> + * @mode: a pointer to a drm mode structure
>> + *
>> + * Parse mode string and populate mode
>> + *
>> + * Format: <clock(MHz)>,<hdisp>,<hsync-start>,<hsync-end>,<htotal>,<vdisp>,<vsync-start>,
>> + * <vsync-end>,<vtotal>
> 
> Building docs breaks with this series, because of these <>s afaics. Make this just
> 
> * Format: clock(MHz),hdisp,hsync-start,hsync-end,htotal,vdisp,vsync-start,vsync-end,vtotal
> 
> 
> 

The change has been made in V5, now there are no errors in builddoc.

Thanks,
Rohith
