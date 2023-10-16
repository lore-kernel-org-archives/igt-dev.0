Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AF910E1F5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Oct 2023 14:50:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40684f53d11so52889325e9.1
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Oct 2023 07:50:33 -0700 (PDT)
Message-ID: <c88da3ca-f473-b274-8f7b-6491115eaa60@gmail.com>
Date: Mon, 16 Oct 2023 17:50:23 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Chalil Jitesh <chaliljitesh@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 "Deak, Imre" <imre.deak@intel.com>
References: <CAP8JTaYSZ1-3nuc1qHzHDjk_9xqf_1SvQrykTr_s=dNkghnekw@mail.gmail.com>
 <20231016094755.vv2x3on5legt4lll@kamilkon-desk.igk.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231016094755.vv2x3on5legt4lll@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] Request for information on the igt-gpu-tools
 intel_infoframes test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

I think Imre will know what tools/tests there are which are useful for 
testing Displayport with igt.

/Juha-Pekka

On 16.10.2023 12.47, Kamil Konieczny wrote:
> Hi Chalil,
> 
> On 2023-10-13 at 12:14:20 +0530, chalil jitesh wrote:
>> Hi,
>>
>> I was trying to test and validate the Displayport Sink device behaviour to
>> invalid stream packets received, while checking for some tools which we can
>> use for testing, came to know about the igt-gpu-tools tests which can be
>> used for testing compliance of displayport driver.
>>
>> For testing I wanted to send some error DP frames packets (send some
>> invalid stream data packets) to the DP sink device to check if the sink
>> device is behaving correctly to error stream data frames received.
>> Could you please give us information if we can use any tools/tests
>> available in igt-gpu-tools package, which we can use for testing invalid DP
>> frames.
>> Can we use the test like intel_infoframes available in igt-gpu-tools
>> package to modify/generate the DP error data frames packets which can be
>> sent to the sink device (or is the test intel_infoframes only supported for
>> HDMI tests).
>>
>> Kindly please suggest if any of the tools/tests in igt-gpu-tools package
>> can be used for testing sending error DP stream packets.
>>
>> With Thanks and Regards
>> Jitesh
> 
> +cc Bhanu and Juha-Pekka
> 
> Regards,
> Kamil
> 
