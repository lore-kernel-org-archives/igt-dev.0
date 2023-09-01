Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C628E10E184
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 09:02:29 +0000 (UTC)
Message-ID: <4c6de075-f0b3-fae0-cf6c-48f177f3ced3@intel.com>
Date: Fri, 1 Sep 2023 14:32:09 +0530
Content-Language: en-US
References: <20230901051808.1369104-1-bhanuprakash.modem@intel.com>
 <20230901092019.44f35b7e@maurocar-mobl2>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230901092019.44f35b7e@maurocar-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] scripts/test_list: Allow unrecognized
 field:values in testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On Fri-01-09-2023 12:50 pm, Mauro Carvalho Chehab wrote:
> On Fri,  1 Sep 2023 10:48:08 +0530
> Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> 
>> As non-Intel vendors also contributing to KMS tests, allow
>> them to re-use the existing testplan documentation along with
>> their own definitions of field:values pair in test config json.
>>
>> Instead of aborting, just throw a warning about this unrecognized
>> field:values.
>>
>> Example:
>> tests/kms_color.c:994: Warning: unrecognized field in tests/kms_test_config.json  ==> Foo: bla
> 
> IMO, there's no need to to that. I mean, if someone wants to add
> a new field, he can just patch tests/kms_test_config.json, adding the
> new "Foo" field at kms_test_config.json:

Non-Intel people may not use kms_test_config.json since it is designed 
for Intel supported (tests/kms_*.c & tests/intel/kms_*.c) tests 
(Probably we may need to rename it to intel_kms_test_config.json).

So, non-Intel vendors are also allowed to include few kms tests 
(tests/kms_*.c) in their own testplan. Also, we can't restrict them to 
use the same testplan as kms_test_config.json.

Example:
Suppose, some non-Intel vendor (xyz) created a xyz_kms_test_config.json 
with the "Foo" field defined in it, and updated the documentation of 
tests/kms_*.c accordingly. Since Intel's kms_test_config.json is also 
using tests/kms_*.c and not aware of "Foo" can lead the failure.

The problem statement is to have different testplans with their own set 
of field:values and share the documentation.

- Bhanu

> 
> diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
> index 9219ae4ebd9d..1dfca84dd73c 100644
> --- a/tests/kms_test_config.json
> +++ b/tests/kms_test_config.json
> @@ -35,6 +35,7 @@
>                   "description": "Defines the test category. Usually used at subtest level."
>               }
>           },
> +        "Foo" : { },
>           "Description" : {
>               "_properties_": {
>                   "description": "Provides a description for the test/subtest."
> 
> NOTE: It would probably make sense to add a description to it, to make
> clear what such "Foo" field means, in a similar way to the descriptions
> added to the other fields.
> 
> As the fields are optional, this won't require any changes at the
> existing tests, and will provide an extra benefit that the meaning of
> the "Foo" field can be documented via _properties_/description field >
> Regards,
> Mauro
> 
>>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   scripts/test_list.py | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/test_list.py b/scripts/test_list.py
>> index 0bcc96869..517c4d067 100755
>> --- a/scripts/test_list.py
>> +++ b/scripts/test_list.py
>> @@ -1219,8 +1219,8 @@ class TestList:
>>                       continue
>>   
>>                   file_line.rstrip(r"\n")
>> -                sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
>> -                         (self.config_fname, file_line))
>> +                print(f"{'/'.join(fname.split('/')[-2:])}:{file_ln + 1}: Warning: unrecognized field in %s ==> %s" %
>> +                        ('/'.join(self.config_fname.split('/')[-2:]), file_line))
>>   
>>       def show_subtests(self, sort_field):
>>   

