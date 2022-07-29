Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E125010E1DC
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 17:59:26 +0000 (UTC)
Message-ID: <f90cb47e-09ab-57b9-decc-64e3470baa42@quicinc.com>
Date: Fri, 29 Jul 2022 10:59:24 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220713222235.11655-1-quic_rohiiyer@quicinc.com>
 <20220713222235.11655-2-quic_rohiiyer@quicinc.com>
 <Yt9/Aw7MCZKx7PkP@platvala-desk.ger.corp.intel.com>
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
In-Reply-To: <Yt9/Aw7MCZKx7PkP@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1 1/3] lib/igt_kms: Add helper to parse
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

Hi,
I have addressed these changes in the new patch set.

Thanks,
Rohith

On 7/25/2022 10:43 PM, Petri Latvala wrote:
> On Wed, Jul 13, 2022 at 03:22:33PM -0700, Rohith Iyer wrote:
>> Add helper method to parse a mode string from command line
> 
> 
> In this form the string doesn't have to be from command line at all
> call sites.
> 
> 
>> , and verify
>> correct number of arguments. This standardizes parsing mode strings.
>>
>> Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
>> ---
>>   lib/igt_kms.c | 26 ++++++++++++++++++++++++++
>>   lib/igt_kms.h |  1 +
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index d8867f09..6df6658a 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -5739,3 +5739,29 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>>   
>>   	return true;
>>   }
>> +
>> +/**
>> + * igt_parse_mode_string:
>> + * @mode_string: a pointer to the optarg
> 
> With the above said, the parameter is just the modeline string.
> 
>> + * @mode: a pointer to a drm mode structure
>> + *
>> + * Parse mode string from command line and populate mode
>> + *
>> + * Format: <clock(MHz)>,<hdisp>,<hsync-start>,<hsync-end>,<htotal>,<vdisp>,<vsync-start>,
>> + * <vsync-end>,<vtotal>
>> + *
>> + * Returns: true if the correct number of arguments are entered, else false.
>> + */
>> +bool igt_parse_mode_string(char *mode_string, drmModeModeInfo *mode)
> 
> const char *mode_string
> 
> 
