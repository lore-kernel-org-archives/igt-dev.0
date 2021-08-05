Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4D16E2DF
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Aug 2021 07:55:30 +0000 (UTC)
Date: Thu, 5 Aug 2021 10:58:05 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YQuaDbwVexeeuzfQ@platvala-desk.ger.corp.intel.com>
References: <20210803200749.416767-1-bindu.r@amd.com>
 <162803469403.9818.14107810064192681063@emeril.freedesktop.org>
 <DM4PR12MB5120C56166DE4941BA966ECFF5F19@DM4PR12MB5120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR12MB5120C56166DE4941BA966ECFF5F19@DM4PR12MB5120.namprd12.prod.outlook.com>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fbw=3A_New_test_for_bandwidth_validation_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "R, Bindu" <Bindu.R@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Lakshminarayana <lakshminarayana.vudum@intel.com>, "arek@hiler.eu" <arek@hiler.eu>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 04, 2021 at 09:44:47PM +0000, R, Bindu wrote:
> [AMD Official Use Only]
> 
> Hi Lakshminarayana<mailto:lakshminarayana.vudum@intel.com> and Hiler,
>      We see Gitlab build failures reported for this kms_bw.c, based on the logs, we are not able to get more details except for the "timeout" messages.
> Can you please let us know if these are generic errors -or- the errors specific to this IGT ?

You can safely ignore this error. The gitlab runner is having a bad
day and has a big load on it.


-- 
Petri Latvala


> 
> Regards,
> Bindu
> ________________________________
> From: Patchwork <patchwork@emeril.freedesktop.org>
> Sent: Tuesday, August 3, 2021 7:51 PM
> To: R, Bindu <Bindu.R@amd.com>
> Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> Subject: ✗ GitLab.Pipeline: warning for tests/kms_bw: New test for bandwidth validation (rev2)
> 
> == Series Details ==
> 
> Series: tests/kms_bw: New test for bandwidth validation (rev2)
> URL   : https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F92976%2F&amp;data=04%7C01%7Cbindu.r%40amd.com%7Cba2b1cca2c2d48b6c74008d956d9a04a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637636316011882996%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=78NQrilC%2FE5%2FBb%2FbmsEeE23SmNwTPehnlUved8qN4nU%3D&amp;reserved=0
> State : warning
> 
> == Summary ==
> 
> Pipeline status: FAILED.
> 
> see https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fgfx-ci%2Figt-ci-tags%2F-%2Fpipelines%2F374074&amp;data=04%7C01%7Cbindu.r%40amd.com%7Cba2b1cca2c2d48b6c74008d956d9a04a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637636316011882996%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=2VbElTGqsOCSteIAjQuUL%2F92Wn6HHyrsbH%2FEF3xKPyE%3D&amp;reserved=0 for the overview.
> 
> test:ninja-test-arm64 has failed (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fgfx-ci%2Figt-ci-tags%2F-%2Fjobs%2F12474146&amp;data=04%7C01%7Cbindu.r%40amd.com%7Cba2b1cca2c2d48b6c74008d956d9a04a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637636316011882996%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=DGQpKtfMPrxNCwxEBaAwcaXlz7lUYFEwjqduKmUr85s%3D&amp;reserved=0):
>   Traceback (most recent call last):
>     File "/usr/lib/python3/dist-packages/mesonbuild/mesonmain.py", line 112, in run
>       return options.run_func(options)
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 805, in run
>       return th.doit()
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 555, in doit
>       self.run_tests(tests)
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 715, in run_tests
>       self.drain_futures(futures)
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 732, in drain_futures
>       self.print_stats(numlen, tests, name, result.result(), i)
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 505, in print_stats
>       result_str += "\n\n" + result.get_log()
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 178, in get_log
>       res += self.stde
>   TypeError: can only concatenate str (not "bytes") to str
>     1/292 lib igt_assert                          TIMEOUT 32.02 s
>   section_end:1628034408:step_script
>   ERROR: Job failed: execution took longer than 1h0m0s seconds
> 
> 
> test:ninja-test-armhf has failed (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fgfx-ci%2Figt-ci-tags%2F-%2Fjobs%2F12474145&amp;data=04%7C01%7Cbindu.r%40amd.com%7Cba2b1cca2c2d48b6c74008d956d9a04a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637636316011882996%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2FKS5yqTqqbhn%2BGm3g86JOKL4mQoV%2F9n0Q7edQj6ZwhA%3D&amp;reserved=0):
>   Traceback (most recent call last):
>     File "/usr/lib/python3/dist-packages/mesonbuild/mesonmain.py", line 112, in run
>       return options.run_func(options)
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 805, in run
>       return th.doit()
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 555, in doit
>       self.run_tests(tests)
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 715, in run_tests
>       self.drain_futures(futures)
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 732, in drain_futures
>       self.print_stats(numlen, tests, name, result.result(), i)
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 505, in print_stats
>       result_str += "\n\n" + result.get_log()
>     File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 178, in get_log
>       res += self.stde
>   TypeError: can only concatenate str (not "bytes") to str
>     1/292 lib igt_assert                          TIMEOUT 32.08 s
>   section_end:1628034408:step_script
>   ERROR: Job failed: execution took longer than 1h0m0s seconds
> 
> 
> test:ninja-test-clang has failed (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fgfx-ci%2Figt-ci-tags%2F-%2Fjobs%2F12474144&amp;data=04%7C01%7Cbindu.r%40amd.com%7Cba2b1cca2c2d48b6c74008d956d9a04a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637636316011882996%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=770lkjUWB%2BE9Rks%2FpwzCcwiKkecjPmsWK%2F5KZ4%2F3wTc%3D&amp;reserved=0):
>   299/306 assembler test/rndd                     OK       0.02 s
>   300/306 assembler test/rndu                     OK       0.02 s
>   301/306 assembler test/rnde                     OK       0.02 s
>   302/306 assembler test/rnde-intsrc              OK       0.02 s
>   303/306 assembler test/rndz                     OK       0.01 s
>   304/306 assembler test/lzd                      OK       0.02 s
>   305/306 assembler test/not                      OK       0.02 s
>   306/306 assembler test/immediate                OK       0.01 s
> 
>   Ok:                  281
>   Expected Fail:         0
>   Fail:                  0
>   Unexpected Pass:       0
>   Skipped:               0
>   Timeout:              25
> 
>   Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
>   section_end:1628034408:step_script
>   ERROR: Job failed: execution took longer than 1h0m0s seconds
> 
> == Logs ==
> 
> For more details see: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fgfx-ci%2Figt-ci-tags%2F-%2Fpipelines%2F374074&amp;data=04%7C01%7Cbindu.r%40amd.com%7Cba2b1cca2c2d48b6c74008d956d9a04a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637636316011882996%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=2VbElTGqsOCSteIAjQuUL%2F92Wn6HHyrsbH%2FEF3xKPyE%3D&amp;reserved=0
