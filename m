Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB1910E6B1
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 15:44:40 +0000 (UTC)
Message-ID: <e7a77cf5-17a8-d688-3eb1-b76cb4d76d0d@foss.st.com>
Date: Wed, 23 Feb 2022 16:44:27 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220223084553.84156-1-raphael.gallais-pou@foss.st.com>
 <YhYNWsKIFhWzvbbO@platvala-desk.ger.corp.intel.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <YhYNWsKIFhWzvbbO@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/drmtest: add support for STM drivers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@st.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 2/23/22 11:32, Petri Latvala wrote:
> On Wed, Feb 23, 2022 at 09:45:53AM +0100, Raphaël Gallais-Pou wrote:
>> From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>>
>> Since CRC feature is now supported on STM display drivers, IGT would be
>> an interesting solution for testing.
>>
>> This patch adds basic support for IGT to run with STM drivers.
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> ---
>>  lib/drmtest.c | 13 +++++++++++++
>>  lib/drmtest.h |  3 +++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/lib/drmtest.c b/lib/drmtest.c
>> index 09a9a229..e6886c1c 100644
>> --- a/lib/drmtest.c
>> +++ b/lib/drmtest.c
>> @@ -134,6 +134,11 @@ bool is_nouveau_device(int fd)
>>  #endif
>>  }
>>  
>> +bool is_stm_device(int fd)
>> +{
>> +	return __is_device(fd, "stm");
>> +}
>> +
>>  bool is_vc4_device(int fd)
>>  {
>>  	return __is_device(fd, "vc4");
>> @@ -186,6 +191,7 @@ static const struct module {
>>  	{ DRIVER_INTEL, "i915", modprobe_i915 },
>>  	{ DRIVER_MSM, "msm" },
>>  	{ DRIVER_PANFROST, "panfrost" },
>> +	{ DRIVER_STM, "stm32-display" },
>>  	{ DRIVER_V3D, "v3d" },
>>  	{ DRIVER_VC4, "vc4" },
>>  	{ DRIVER_VGEM, "vgem" },
>> @@ -547,6 +553,8 @@ static const char *chipset_to_str(int chipset)
>>  		return "panfrost";
>>  	case DRIVER_MSM:
>>  		return "msm";
>> +	case DRIVER_STM:
>> +		return "stm";
>>  	case DRIVER_ANY:
>>  		return "any";
>>  	default:
>> @@ -651,6 +659,11 @@ void igt_require_nouveau(int fd)
>>  	igt_require(is_nouveau_device(fd));
>>  }
>>  
>> +void igt_require_stm(int fd)
>> +{
>> +	igt_require(is_stm_device(fd));
>> +}
>> +
>>  void igt_require_vc4(int fd)
>>  {
>>  	igt_require(is_vc4_device(fd));
>> diff --git a/lib/drmtest.h b/lib/drmtest.h
>> index b5debd44..6a7ab082 100644
>> --- a/lib/drmtest.h
>> +++ b/lib/drmtest.h
>> @@ -51,6 +51,7 @@
>>  #define DRIVER_V3D	(1 << 4)
>>  #define DRIVER_PANFROST	(1 << 5)
>>  #define DRIVER_MSM	(1 << 6)
>> +#define DRIVER_STM	(1 << 7)
> Hi,
>
> Thanks for the patch! But do consider whether it's at needed at this
> point, or at all. Generally the DRIVER_XYZ stuff need to be added for
> one of these reasons:
>
> 1) The test is driver-specific, like for interfaces around rendering.
>
> 2) The test needs to fiddle with the .ko module itself (unload/load
> tests)
>
> 3) Some driver-specific adjusting is needed
>
> The kms tests that use DRIVER_ANY should already work out of the box
> to some extent. Otherwise, if this patch is needed it's more than
> welcome but I'd rather wait until it is.

Tests that do not require any driver specific shenanigans effectively work without the need of this patch.

I was sending it in "standalone" in regards for potential future patches that could apply to STM-specific tests.

But I did not saw it that way. I will resend this, when tweaks will be needed, in a serie.


Regards,

>
>
