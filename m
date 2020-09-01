Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8226E41F
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2020 13:09:45 +0000 (UTC)
References: <20200811093241.19910-1-guillaume.tucker@collabora.com>
 <20200811094615.GJ7444@platvala-desk.ger.corp.intel.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <53b257af-6243-8c70-6276-031cd4523f6f@collabora.com>
Date: Tue, 1 Sep 2020 14:09:39 +0100
MIME-Version: 1.0
In-Reply-To: <20200811094615.GJ7444@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] Dockerfile.build-debian-mips: use
 buster with libunwind fix
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 11/08/2020 10:46, Petri Latvala wrote:
> On Tue, Aug 11, 2020 at 10:32:41AM +0100, Guillaume Tucker wrote:
>> We can now use libunwind 1.2.1-10~deb10u1 from Debian Buster as per
>> this bug report which has now been resolved:
>>
>>   https://bugs.debian.org/932725
>>
>> Drop stretch-backports for MIPS and use Buster like the other
>> architectures.
>>
>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> 
> Happy birthday, bug 932725!
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Thanks!

It looks like this hasn't been applied yet, is there anything
blocking it?

Guillaume

>> ---
>>  Dockerfile.build-debian-mips | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/Dockerfile.build-debian-mips b/Dockerfile.build-debian-mips
>> index 7e4bacdf8ded..9b7c0a5b4703 100644
>> --- a/Dockerfile.build-debian-mips
>> +++ b/Dockerfile.build-debian-mips
>> @@ -1,6 +1,4 @@
>> -# we are stuck on stretch for mips:
>> -# https://bugs.debian.org/932725
>> -FROM debian:stretch-backports
>> +FROM debian:buster
>>  
>>  RUN apt-get update
>>  RUN apt-get install -y \
>> @@ -32,9 +30,7 @@ RUN apt-get install -y \
>>  			libjson-c-dev:mips \
>>  			libcurl4-openssl-dev:mips \
>>  			libxrandr-dev:mips \
>> -			libxv-dev:mips
>> -
>> -RUN apt-get install -t stretch-backports -y \
>> +			libxv-dev:mips \
>>  			meson \
>>  			libdrm-dev:mips \
>>  			qemu-user \
>> -- 
>> 2.20.1
>>
>> _______________________________________________
>> igt-dev mailing list
>> igt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
