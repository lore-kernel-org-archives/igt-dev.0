Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7418310E1B5
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Feb 2022 03:16:08 +0000 (UTC)
Message-ID: <f8bddb56-e7ce-2fc8-264c-2438fdbc428e@quicinc.com>
Date: Fri, 25 Feb 2022 19:16:04 -0800
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <1645052622-23764-1-git-send-email-quic_abhinavk@quicinc.com>
 <YhNlt9Dpzx4EQSDe@platvala-desk.ger.corp.intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YhNlt9Dpzx4EQSDe@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] Add an api to support the CTA range
 color square video test pattern as explained in section 3.2.5.3 of the DP
 CTS specification. This pattern is required for supporting the CTA range
 for RGB formats.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Maitreyee Rao <maitreye@codeaurora.org>, quic_khsieh@quicinc.com,
 swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org,
 seanpaul@chromium.org, aravindh@codeaurora.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri

On 2/21/2022 2:13 AM, Petri Latvala wrote:
> On Wed, Feb 16, 2022 at 03:03:42PM -0800, Abhinav Kumar wrote:
>> From: Maitreyee Rao <maitreye@codeaurora.org>
>>
>> Also rename the existing api igt_fill_cts_framebuffer to
>> igt_fill_cts_color_ramp_framebuffer to higlight the
>> pattern type.
>>
>> changes in v2:
>> 	- removed redundant pointers
>> 	- fixed overall formatting issues
>> 	- Fixed author name
>>
>> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> 
> ../lib/igt_fb.c: In function ‘igt_fill_cts_color_square_framebuffer’:
> ../lib/igt_fb.c:1515:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>   1515 |  uint32_t colors[8][3] = {
>        |  ^~~~~~~~
> ../lib/igt_fb.c:1555:19: warning: initialization of ‘uint8_t *’ {aka ‘unsigned char *’} from incompatible pointer type ‘uint32_t *’ {aka ‘unsigned int *’} [-Wincompatible-pointer-types]
>   1555 |   uint8_t *temp = pixmap;
>        |                   ^~~~~~
> 
> 
> 

I have addressed these and pushed 
https://patchwork.freedesktop.org/patch/476306/.

Somehow the chrome compiler didnt catch these.

Thanks

Abhinav
