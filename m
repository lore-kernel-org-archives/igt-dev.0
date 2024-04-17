Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F83C001CC
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 08:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D9710E186;
	Wed, 17 Apr 2024 08:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTZmuQBC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3925D10EF9C
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713342179; x=1744878179;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zaqCKArQOBph67+2wNP2MrBfCTfwuOsqru4Yps2/hvA=;
 b=NTZmuQBCGZL3bz89S8yalhPZMohX4qOky6CiPvFWF5nHvakKLm+OLkfs
 Vu2nxukutI7eKjeEK3QnV0DbhP//LpMhio3hZcYHKCmXy5nlTkl1g1fpy
 3HX8eLg/Oys8uzk5UKLB6kXBZcvVR6Qwz5OQelcE0CpB6iJpzbQ4EagGM
 EUDGigjwMI+5HIUXTBh1CZMztle+nGe07HbTkYOl80D2azHvJ/9f5isjU
 B5cFIDC3q6UEurDgTQ0/mxDXAGBfrckIFYmzf+Haoi1XkijRy7y39Mvjn
 Xuh7SwbGj1OqKwHOnp/Tl3YxvAUVPWvHk9SJCsilHiN3WB4dyRJzgOy9M w==;
X-CSE-ConnectionGUID: zbN2tczJQJCAMCD6aanxMw==
X-CSE-MsgGUID: lwDB6733TOKlm/WNodcFAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8680815"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8680815"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:22:58 -0700
X-CSE-ConnectionGUID: iQ+05Tn1RsujAt9mod2QVg==
X-CSE-MsgGUID: 71HURmcGTCeQUmbQVJCxcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="22619026"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.84.149])
 ([10.245.84.149])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:22:57 -0700
Message-ID: <ab347eae-40b7-4e6e-ace4-f51f4217601d@linux.intel.com>
Date: Wed, 17 Apr 2024 10:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] benchmarks/gem_wsim: Option to list physical
 engines
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com
References: <20240115154448.29263-1-marcin.bernatowicz@linux.intel.com>
 <20240115154448.29263-3-marcin.bernatowicz@linux.intel.com>
 <5925d203-328e-44f0-9371-4de6c837ddf9@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <5925d203-328e-44f0-9371-4de6c837ddf9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 1/24/2024 1:25 PM, Tvrtko Ursulin wrote:
> 
> On 15/01/2024 15:44, Marcin Bernatowicz wrote:
>> Added command line option (-l) to list physical engines.
> 
> What is the use case and could you paste the example output please (both 
> drivers if possible)?

Not a must have patch, just lists physical engines.
Sample output with extra verbosity to see [class:instance:gt] tuple:

ATSM:~# lspci -ks 0000:4d:00.0 && ~/igt/benchmarks/gem_wsim -vvvl -D 
"pci:slot=0000:4d:00.0"
4d:00.0 Display controller: Intel Corporation Device 56c0 (rev 08)
         Subsystem: Intel Corporation Device 4905
         Kernel driver in use: i915
         Kernel modules: i915, xe
Using device /dev/dri/card0
RCS [0:0:65535]
BCS [1:0:65535]
VCS1 [2:0:65535]
VCS2 [2:1:65535]
VECS1 [3:0:65535]
VECS2 [3:1:65535]
CCS1 [4:0:65535]
CCS2 [4:1:65535]
CCS3 [4:2:65535]
CCS4 [4:3:65535]

ATSM:~# lspci -ks 0000:4d:00.0 && ~/igt/benchmarks/gem_wsim -vvvl -D 
"pci:slot=0000:4d:00.0"
4d:00.0 Display controller: Intel Corporation Device 56c0 (rev 08)
         Subsystem: Intel Corporation Device 4905
         Kernel driver in use: xe
         Kernel modules: i915, xe
Using device /dev/dri/card1
RCS [0:0:0]
BCS [1:0:0]
VCS1 [2:0:0]
VCS2 [2:1:0]
VECS1 [3:0:0]
VECS2 [3:1:0]
CCS [4:0:0]  - when ccs_mode = 1

ex. for ccs_mode = 4:
CCS1 [4:0:0]
CCS2 [4:1:0]
CCS3 [4:2:0]
CCS4 [4:3:0]

ADLP:~# lspci -ks 0000:00:02.0 && ~/igt/benchmarks/gem_wsim -vvvl -D 
"pci:slot=0000:00:02.0"
00:02.0 VGA compatible controller: Intel Corporation Alder Lake-P 
Integrated Graphics Controller (rev 0c)
         DeviceName: To Be Filled by O.E.M.
         Subsystem: Intel Corporation Device 2212
         Kernel driver in use: i915
         Kernel modules: i915, xe
Using device /dev/dri/card0
RCS [0:0:65535]
BCS [1:0:65535]
VCS1 [2:0:65535]
VCS2 [2:1:65535]
VECS [3:0:65535]

ADLP:~# lspci -ks 0000:00:02.0 && ~/igt/benchmarks/gem_wsim -vvvl -D 
"pci:slot=0000:00:02.0"
00:02.0 VGA compatible controller: Intel Corporation Alder Lake-P 
Integrated Graphics Controller (rev 0c)
         DeviceName: To Be Filled by O.E.M.
         Subsystem: Intel Corporation Device 2212
         Kernel driver in use: xe
         Kernel modules: i915, xe
Using device /dev/dri/card0
RCS [0:0:0]
BCS [1:0:0]
VCS1 [2:0:0]
VCS2 [2:1:0]
VECS [3:0:0]

MTLH:~# lspci -ks 0000:00:02.0 && ~/igt/benchmarks/gem_wsim -vvvl -D 
"pci:slot=0000:00:02.0"
00:02.0 VGA compatible controller: Intel Corporation Device 7d55 (rev 08)
         DeviceName: To Be Filled by O.E.M.
         Subsystem: Intel Corporation Device 2212
         Kernel driver in use: i915
         Kernel modules: i915, xe
Using device /dev/dri/card0
RCS [0:0:65535]
BCS [1:0:65535]
VCS1 [2:0:65535]
VCS2 [2:1:65535]
VECS [3:0:65535]
CCS [4:0:65535]

MTLH:~# lspci -ks 0000:00:02.0 && ~/igt/benchmarks/gem_wsim -vvvl -D 
"pci:slot=0000:00:02.0"
00:02.0 VGA compatible controller: Intel Corporation Device 7d55 (rev 08)
         DeviceName: To Be Filled by O.E.M.
         Subsystem: Intel Corporation Device 2212
         Kernel driver in use: xe
         Kernel modules: i915, xe
Using device /dev/dri/card0
RCS [0:0:0]
BCS [1:0:0]
CCS [4:0:0]
VCS1-1 [2:0:1]
VCS2-1 [2:1:1]
VECS-1 [3:0:1]

We see *-1 as gt is != 0, but workload definitions with VCS, VCS1, 
VCS1-1 are equivalent:

MTLH:~# ~/igt/benchmarks/gem_wsim -vvv -D "pci:slot=0000:00:02.0" -w 
"1.VCS1.100000.0.1"
Using device /dev/dri/card0
Random seed is 1713261312.
1 client.
0 ctx[1] VCS [2:0:1]
0: 0 bytes in working sets.
0: 0 bytes active working set in 0 buffers. 8192 in batch buffers.
*0: 0.108s elapsed (1 cycles, 9.234 workloads/s).
0.111s elapsed (9.043 workloads/s)

MTLH:~# ~/igt/benchmarks/gem_wsim -vvv -D "pci:slot=0000:00:02.0" -w 
"1.VCS1-1.100000.0.1"
Using device /dev/dri/card0
Random seed is 1713261375.
1 client.
0 ctx[1] VCS [2:0:1]
0: 0 bytes in working sets.
0: 0 bytes active working set in 0 buffers. 8192 in batch buffers.
*0: 0.105s elapsed (1 cycles, 9.530 workloads/s).
0.107s elapsed (9.381 workloads/s)

MTLH:~# ~/igt/benchmarks/gem_wsim -vvv -D "pci:slot=0000:00:02.0" -w 
"1.VCS.100000.0.1"
Using device /dev/dri/card0
Random seed is 1713262682.
1 client.
0 ctx[1] VCS [2:0:1]
0: 0 bytes in working sets.
0: 0 bytes active working set in 0 buffers. 8192 in batch buffers.
*0: 0.107s elapsed (1 cycles, 9.362 workloads/s).
0.108s elapsed (9.237 workloads/s)


> 
> Regards,
> 
> Tvrtko
> 
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   benchmarks/gem_wsim.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
>> index e79d26513..aa70b1770 100644
>> --- a/benchmarks/gem_wsim.c
>> +++ b/benchmarks/gem_wsim.c
>> @@ -2924,6 +2924,7 @@ static void print_help(void)
>>   "  -f <scale>        Scale factor for batch durations.\n"
>>   "  -F <scale>        Scale factor for delays.\n"
>>   "  -L                List GPUs.\n"
>> +"  -l                List physical engines.\n"
>>   "  -D <gpu>          One of the GPUs from -L.\n"
>>       );
>>   }
>> @@ -2983,10 +2984,42 @@ add_workload_arg(struct w_arg *w_args, 
>> unsigned int nr_args, char *w_arg,
>>       return w_args;
>>   }
>> +static void list_engines(void)
>> +{
>> +    struct intel_engines *engines = query_engines();
>> +    int engine_class_count[NUM_ENGINE_CLASSES] = {};
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < engines->nr_engines; ++i) {
>> +        igt_assert_lt(engines->engines[i].engine_class, 
>> NUM_ENGINE_CLASSES);
>> +        engine_class_count[engines->engines[i].engine_class]++;
>> +    }
>> +
>> +    for (i = 0; i < engines->nr_engines; ++i) {
>> +        if (engine_class_count[engines->engines[i].engine_class] > 1)
>> +            printf("%s%u",
>> +                   
>> intel_engine_class_string(engines->engines[i].engine_class),
>> +                   engines->engines[i].engine_instance + 1);
>> +        else
>> +            printf("%s",
>> +                   
>> intel_engine_class_string(engines->engines[i].engine_class));
>> +
>> +        if (is_xe && engines->engines[i].gt_id)
>> +            printf("-%u", engines->engines[i].gt_id);
>> +
>> +        if (verbose > 3)
>> +            printf(" [%d:%d:%d]", engines->engines[i].engine_class,
>> +                   engines->engines[i].engine_instance,
>> +                   engines->engines[i].gt_id);
>> +        printf("\n");
>> +    }
>> +}
>> +
>>   int main(int argc, char **argv)
>>   {
>>       struct igt_device_card card = { };
>>       bool list_devices_arg = false;
>> +    bool list_engines_arg = false;
>>       unsigned int repeat = 1;
>>       unsigned int clients = 1;
>>       unsigned int flags = 0;
>> @@ -3009,11 +3042,14 @@ int main(int argc, char **argv)
>>       master_prng = time(NULL);
>>       while ((c = getopt(argc, argv,
>> -               "LhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
>> +               "LlhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
>>           switch (c) {
>>           case 'L':
>>               list_devices_arg = true;
>>               break;
>> +        case 'l':
>> +            list_engines_arg = true;
>> +            break;
>>           case 'D':
>>               device_arg = strdup(optarg);
>>               break;
>> @@ -3134,6 +3170,11 @@ int main(int argc, char **argv)
>>       if (is_xe)
>>           xe_device_get(fd);
>> +    if (list_engines_arg) {
>> +        list_engines();
>> +        goto out;
>> +    }
>> +
>>       if (!nr_w_args) {
>>           wsim_err("No workload descriptor(s)!\n");
>>           goto err;
