Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDE710E2A4
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 06:07:42 +0000 (UTC)
Message-ID: <38397ce7-80f0-a374-ef38-a129c7c24296@linux.intel.com>
Date: Tue, 4 Apr 2023 08:07:38 +0200
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
 <20230327134119.2429388-5-mauro.chehab@linux.intel.com>
 <20230403105801.ha34wl757ijkshle@zkempczy-mobl2>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230403105801.ha34wl757ijkshle@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] gen_opencl_kernel: add script to
 dynamically create OpenCL kernels
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

On 4/3/23 12:58, Zbigniew Kempczyński wrote:
> On Mon, Mar 27, 2023 at 03:41:18PM +0200, Mauro Carvalho Chehab wrote:
>> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>>
>> Compute tests can be produced by using OpenCL, by calling ocloc.
>>
>> While this can be part of IGT building system, for now, let's add
>> a script for such purpose.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>> ---
>>   opencl/README            | 11 +++++
>>   opencl/gen_opencl_kernel | 86 ++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 97 insertions(+)
>>   create mode 100644 opencl/README
>>   create mode 100755 opencl/gen_opencl_kernel
>>
>> diff --git a/opencl/README b/opencl/README
>> new file mode 100644
>> index 000000000000..5d0df2ad6c33
>> --- /dev/null
>> +++ b/opencl/README
>> @@ -0,0 +1,11 @@
>> +This directory contains some OpenCL compute files, and a script to be used
>> +to produce a header file containing the binaries for the CL against
>> +multiple platforms.
>> +
>> +For instance, to generate compute square Kernel binaries for TGL and ADL
>> +variants, use this:
>> +
>> +    opencl/gen_opencl_kernel xe_compute_square opencl/compute_square_kernel.cl \
>> +	   xe_compute_square_kernels.c build/opencl tgllp adl-s adl-p adl-n
>> +
>> +    cp build/opencl/xe_compute_square_kernels.c lib/xe/
> Fails on Ubuntu 22.04.2 LTS:
>
> ./opencl/gen_opencl_kernel xe_compute_square opencl/compute_square_kernel.cl xe_compute_square_kernels.c build/opencl tgllp
> tgllp
> Generating build/opencl/tgllp_xe_compute_square.h
> Usage:
>         xxd [options] [infile [outfile]]
>      or
>         xxd -r [-s [-]offset] [-c cols] [-ps] [infile [outfile]]
> Options:
>      -a          toggle autoskip: A single '*' replaces nul-lines. Default off.
>      -b          binary digit dump (incompatible with -ps,-i,-r). Default hex.
>      -C          capitalize variable names in C include file style (-i).
>      -c cols     format <cols> octets per line. Default 16 (-i: 12, -ps: 30).
>      -E          show characters in EBCDIC. Default ASCII.
>      -e          little-endian dump (incompatible with -ps,-i,-r).
>      -g bytes    number of octets per group in normal output. Default 2 (-e: 4).
>      -h          print this summary.
>      -i          output in C include file style.
>      -l len      stop after <len> octets.
>      -o off      add <off> to the displayed file position.
>      -ps         output in postscript plain hexdump style.
>      -r          reverse operation: convert (or patch) hexdump into binary.
>      -r -s off   revert with <off> added to file positions found in hexdump.
>      -d          show offset in decimal instead of hex.
>      -s [+][-]seek  start at <seek> bytes abs. (or +: rel.) infile offset.
>      -u          use upper case hex letters.
>      -v          show version: "xxd 2021-10-22 by Juergen Weigert et al.".
> error in line 42

The issue is that xxd is too old on Ubuntu and doesn't support "-n 
<name>" parameter.

I'll add an extra patch addressing it.

Yet, the above command will fail as-is with native ocloc provided via 
intel-opencl-icd

package, as it doesn't support other Gen12 targets but tgllp.


On Ubuntu 22.04 (intel-opencl-icd/focal,now 20.13.16352-1 amd64):

     $ ocloc compile --help 2>&1|grep -A1 'Target device.'
       -device <device_type>         Target device.
                                 <device_type> can be: 
bdw,skl,kbl,cfl,bxt,glk,icllp,lkf,ehl,tgllp


On Fedora 37 (intel-ocloc-22.43.24558-1.fc37.x86_64 package):

     $ ocloc compile --help 2>&1|grep -A1 'Target device.'
       -device <device_type>         Target device.
                                 <device_type> can be: bdw, skl, kbl, 
cfl, apl, bxt, glk, whl, aml, cml, icllp, lkf, ehl, jsl, tgllp, rkl, 
adl-s, adl-p, adl-n, dg1, acm-g10, ats-m150, dg2-g10, acm-g11, ats-m75, 
dg2-g11, acm-g12, dg2-g12, pvc-sdv, pvc, gen11, gen12lp, gen8, gen9, xe, 
xe-hp, xe-hpc, xe-hpg, version  or hexadecimal value with 0x prefix

So, you need to either use a more modern distribution or download OpenCL 
by hand if you want

to compile OpenCL for newer GPU models.

I'll add a note at the patch.


Regards,
Mauro
