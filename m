Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E869210E13E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 14:19:12 +0000 (UTC)
Message-ID: <9a0fb3d6-c6a3-5643-6382-c28518814624@intel.com>
Date: Tue, 21 Mar 2023 14:19:09 +0000
MIME-Version: 1.0
Content-Language: en-GB
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20230315150129.245398-1-matthew.auld@intel.com>
 <CAM0jSHNUyTpFQ8PoJKV6Yze0bANzSLjOj7Y_GbT_UVQZRbz-dw@mail.gmail.com>
 <061d795d-0af6-156b-203c-5709558f25ff@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <061d795d-0af6-156b-203c-5709558f25ff@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/debugfs: fix double-free in
 test_base
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

On 21/03/2023 13:16, Maarten Lankhorst wrote:
> Hey,
> 
> Change looks good.
> 
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Thanks.

> 
> On 2023-03-20 12:23, Matthew Auld wrote:
>> On Wed, 15 Mar 2023 at 15:02, Matthew Auld <matthew.auld@intel.com> 
>> wrote:
>>> Looks to incorrectly free the xe_dev->config, even though there is still
>>> a cached entry pointing to it. The test fixture will also call
>>> xe_device_put() at the end, freeing the same pointer (might now point to
>>> valid memory), which hopefully explains why we see strange looking
>>> crashes in CI:
>>>
>>> Starting subtest: base
>>> Subtest base: SUCCESS (0.005s)
>>> Received signal SIGABRT.
>>> Stack trace:
>>>   #0 [fatal_sig_handler+0x10f]
>>>   #1 [killpg+0x40]
>>>   #2 [gsignal+0xcb]
>>>   #3 [abort+0x12b]
>>>   #4 [__fsetlocking+0x42e]
>>>   #5 [pthread_attr_setschedparam+0x54c]
>>>   #6 [pthread_attr_setschedparam+0xd28]
>>>   #7 [pthread_attr_setschedparam+0x2ed3]
>>>   #8 [__libc_malloc+0x74]
>>>   #9 [_IO_file_doallocate+0x94]
>>>   #10 [_IO_doallocbuf+0x50]
>>>   #11 [_IO_file_overflow+0x1b0]
>>>   #12 [_IO_file_xsputn+0xe5]
>>>   #13 [psiginfo+0x13512]
>>>   #14 [igt_kmsg+0xc9]
>>>   #15 [igt_exit+0xd3]
>>>   #16 [main+0x44]
>>>   #17 [__libc_start_main+0xf3]
>>>   #18 [_start+0x2e]
>>>
>>> Keep the xe_device stuff in test_base, since that looks be the only user
>>> here.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Ping? Any takers for this one?
>>
>>> ---
>>>   tests/xe/xe_debugfs.c | 4 +---
>>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
>>> index 38c8becc..ddb01568 100644
>>> --- a/tests/xe/xe_debugfs.c
>>> +++ b/tests/xe/xe_debugfs.c
>>> @@ -146,7 +146,7 @@ test_base(int fd)
>>>
>>>          validate_entries(fd, "", expected_files, 
>>> ARRAY_SIZE(expected_files));
>>>
>>> -       free(config);
>>> +       xe_device_put(fd);
>>>   }
>>>
>>>   /**
>>> @@ -250,7 +250,6 @@ igt_main_args("", long_options, help_str, 
>>> opt_handler, NULL)
>>>
>>>          igt_fixture {
>>>                  fd = drm_open_driver(DRIVER_XE);
>>> -               xe_device_get(fd);
>>>                  __igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
>>>          }
>>>
>>> @@ -272,7 +271,6 @@ igt_main_args("", long_options, help_str, 
>>> opt_handler, NULL)
>>>          }
>>>
>>>          igt_fixture {
>>> -               xe_device_put(fd);
>>>                  close(fd);
>>>          }
>>>   }
>>> -- 
>>> 2.39.2
>>>
