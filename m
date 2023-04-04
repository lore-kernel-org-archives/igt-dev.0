Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 4 Apr 2023 07:10:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230404141053.b2qi4deyus2it3p2@ldmartin-desk2.lan>
References: <20230403202437.1816411-1-lucas.demarchi@intel.com>
 <168061139110.5056.15908803129907670095@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <168061139110.5056.15908803129907670095@gjsousa-mobl2>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tools: Add tool to dump GuC/HuC CSS
 header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 09:29:51AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2023-04-03 17:24:37)
>> Since we are now using unversioned GuC/HuC, it's useful to be able to
>> dump the firmware blob and get that information from the CSS header.
>> Add a tool that decodes that information and dumps the raw header.
>>
>> Example output:
>>
>>         $ tools/intel-gfx-fw-info /lib/firmware/i915/tgl_guc_70.bin
>>         version: 70.5.1
>>         date: 2022-09-09
>>         raw dump:
>>         00000000  06 00 00 00 a1 00 00 00  00 00 01 00 00 00 00 00   ................
>>         00000010  86 80 00 00 09 09 22 20  71 17 01 00 40 00 00 00   ......" q...@...
>>         00000020  40 00 00 00 01 00 00 00  09 21 45 00 73 79 73 5f   @........!E.sys_
>>         00000030  67 62 73 62 50 43 2d 31  2e 30 2e 33 31 35 30 00   gbsbPC-1.0.3150.
>>         00000040  01 05 46 00 00 00 00 00  00 00 00 00 00 00 00 00   ..F.............
>>         00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00   ................
>>         00000060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00   ................
>>         00000070  00 00 00 00 00 00 00 00  00 10 80 00 00 01 40 00   ..............@.
>>
>>         struct uc_css_header:
>>         - module_type: 0x6
>>         - header_size_dw: 0xa1
>>         - header_version: 0x10000
>>         - module_id: 0x0
>>         - module_vendor: 0x8086
>>         - date: 0x20220909
>>         - size_dw: 0x11771
>>         - key_size_dw: 0x40
>>         - modulus_size_dw: 0x40
>>         - exponent_size_dw: 0x1
>>         - time: 0x452109
>>         - username: b'sys_gbsb'
>>         - buildnumber: b'PC-1.0.3150\x00'
>>         - sw_version: 0x460501
>>         - vf_version: 0x0
>>         - reserved0: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
>>         - rsvd: <rsvd private_data_size=0x801000, reserved1=0x801000>
>>         - header_info: 0x400100
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  tools/intel-gfx-fw-info | 120 ++++++++++++++++++++++++++++++++++++++++
>>  tools/meson.build       |   2 +-
>>  2 files changed, 121 insertions(+), 1 deletion(-)
>>  create mode 100755 tools/intel-gfx-fw-info
>>
>> diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>> new file mode 100755
>> index 000000000..fc1fafdf5
>> --- /dev/null
>> +++ b/tools/intel-gfx-fw-info
>> @@ -0,0 +1,120 @@
>> +#!/usr/bin/env python3
>> +# pylint: disable=C0301
>> +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +#
>> +# Copyright (C) 2023    Intel Corporation
>> +
>> +import argparse
>> +import logging
>> +import pprint
>> +import sys
>> +import typing
>> +
>> +from dissect import cstruct
>
>Since we are not packaging this tool in a way that dependencies are
>automatically installed, I think it is worth to capture an ImportError
>here and point the user to the github repository for this dependency.

sounds good. I also have a minor update to this patch: we don't really
need to remove the comments as stated below, it's just the defines in
the middle of the struct that are not compatible with the minimal C
parser from this module.

>
>Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks

Lucas De Marchi
