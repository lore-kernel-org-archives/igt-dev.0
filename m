Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9BD89DE6
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2020 09:41:31 +0000 (UTC)
References: <20190708065724.26242-1-arkadiusz.hiler@intel.com>
 <20190708072514.21809.26820@emeril.freedesktop.org>
 <20190708122113.pdh2haai47i7eu6r@ahiler-desk1.fi.intel.com>
 <416b7018-170e-a777-311b-a6bd26c0d622@collabora.com>
 <20190715081310.ajgwdgetlg7ocvzi@ahiler-desk1.fi.intel.com>
 <8f4109a7-1057-e280-814c-f454684eacc5@collabora.com>
 <93a9ce9310b17517a4985e021524f2d8a0ddc6c6.camel@intel.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <cc195a61-c7e2-704e-453e-4ddf5e2ac534@collabora.com>
Date: Tue, 11 Aug 2020 10:41:24 +0100
MIME-Version: 1.0
In-Reply-To: <93a9ce9310b17517a4985e021524f2d8a0ddc6c6.camel@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_D?=
 =?utf-8?q?ockerfile=2Edebian*=3A_Switch_over_to_buster?=
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
To: "Ser, Simon" <simon.ser@intel.com>, "Hiler, Arkadiusz" <arkadiusz.hiler@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 22/07/2019 09:17, Ser, Simon wrote:
> On Mon, 2019-07-22 at 09:03 +0100, Guillaume Tucker wrote:
>> On 15/07/2019 09:13, Arkadiusz Hiler wrote:
>>> On Fri, Jul 12, 2019 at 09:57:17AM +0100, Guillaume Tucker wrote:
>>>> On 08/07/2019 13:21, Arkadiusz Hiler wrote:
>>>>> On Mon, Jul 08, 2019 at 07:25:14AM +0000, Patchwork wrote:
>>>>>> == Series Details ==
>>>>>>
>>>>>> Series: Dockerfile.debian*: Switch over to buster
>>>>>> URL   : https://patchwork.freedesktop.org/series/63339/
>>>>>> State : warning
>>>>>>
>>>>>> == Summary ==
>>>>>>
>>>>>> Pipeline status: FAILED.
>>>>>>
>>>>>> See https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/47180 for more details.
>>>>>>
>>>>>> == Logs ==
>>>>>>
>>>>>> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/47180
>>>>>
>>>>> Seems like it's failing for MIPS realiably:
>>>>>
>>>>> https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/405401
>>>>>
>>>>>
>>>>> One example of many sigsegvs:
>>>>> --- command ---
>>>>> /usr/bin/qemu-mips /builds/gfx-ci/igt-ci-tags/build/lib/tests/igt_invalid_subtest_name
>>>>> --- stdout ---
>>>>> IGT-Version: 1.24-NO-GIT (mips) (Linux: 4.9.0-9-amd64 mips)
>>>>> --- stderr ---
>>>>> (igt_invalid_subtest_name:92) igt_core-CRITICAL: Invalid subtest name "# invalid name !".
>>>>> igt_invalid_subtest_name: ../lib/igt_core.c:1714: igt_exit: Assertion `!test_with_subtests || skipped_one || succeeded_one || failed_one' failed.
>>>>> Received signal SIGABRT.
>>>>> Stack trace: 
>>>>> Received signal SIGSEGV.
>>>>> Stack trace: 
>>>>> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>>>>> igt_invalid_subtest_name: ../lib/tests/igt_tests_common.h:46: internal_assert_wsignaled: Assertion `WIFSIGNALED(wstatus) && WTERMSIG(wstatus) == signal' failed.
>>>>> qemu: uncaught target signal 6 (Aborted) - core dumped
>>>>> -------
>>>>>
>>>>> Other architectures seem to be fine and the same thing is passing on
>>>>> stretch.
>>>>>
>>>>> Guillaume, do you have any idea what may be going on before I dig into
>>>>> it?
>>>>
>>>> I've had a look, the segfault is coming from libunwind when
>>>> trying to do a stack trace.  The version of libunwind in Debian
>>>> Stretch (1.1) had large parts unimplemented for MIPS, and while
>>>> the one in Buster (1.2.1) seems to be able to fully support that
>>>> it also appears to have a bug causing the segfault.
>>>>
>>>> There have been a few fixes upstream in libunwind for MIPS, maybe
>>>> some of these need to be back-ported to the package in Debian.
>>>> I've built the 1.2.1 version from source and can reproduce the
>>>> problem, I can try the latest version to see if there has been a
>>>> fix for that next week.  And if that's the case, ask the Debian
>>>> package maintainer to add some fixes.  If the latest upstream
>>>> version still doesn't work, well I guess that would be something
>>>> to report to the MIPS people who worked on libunwind.
>>>>
>>>> Guillaume
>>>
>>> Thanks for investigating this! Poke me here or on the IRC (ivyl) when
>>> you think it might be working with buster. I'll give the series another
>>> spin.
>>
>> Sorry for the slow reply, I've now found a fix for it upstream:
>>
>>   https://github.com/libunwind/libunwind/commit/fd44f596b2dad70acdc81cc76983585f888e045d
>>
>> and I've sent a bug report in Debian to ask for this patch to be
>> added to the package in Buster.  I don't know how long it will
>> take for this to land but I'll ping you when I get some news.
> 
> Excellent. Thanks for this fix and the heads-up! :)

Turned out, it took precisely one year to the day for the
backported fix to get added to the Debian package.  I didn't
chase it too hard though as it wasn't a blocker for i-g-t, I
think I could have tried to upload a new package version myself
to speed things up... but I'm not too familiar with that.

So I've just sent a patch to use Buster with the MIPS Docker
image, it passed the pipeline:

  https://gitlab.freedesktop.org/gtucker/igt-gpu-tools/-/pipelines/188572

Thanks,
Guillaume
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
