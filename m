Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D59510E1A5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jan 2023 05:46:27 +0000 (UTC)
Message-ID: <da82dcc9-2d27-4a16-46a8-349277f2108b@intel.com>
Date: Mon, 23 Jan 2023 11:16:08 +0530
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230117190317.17728-1-ashutosh.dixit@intel.com>
 <CY5PR11MB621110BD11315EEA8F6F69BC95C79@CY5PR11MB6211.namprd11.prod.outlook.com>
 <bddffb35-4a95-58c5-473d-5904fb1dfc84@intel.com>
 <87o7qvurlo.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <87o7qvurlo.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/i915_power: Measure GPU idle/busy
 power
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 1/19/2023 9:02 AM, Dixit, Ashutosh wrote:
> On Tue, 17 Jan 2023 23:22:46 -0800, Tauro, Riana wrote:
>>
>> Hi Ashutosh
>>
> 
> Hi Riana,
> 
>> Energy measurement when idle and with workload is also a part of rc6-idle
>> test.  Why do we need new tests?
> 
> We want to be able to measure max/peak power.
> 
> rc6-idle has this:
> 
> static void bg_load()
> {
> 	...
> 		/* aim for ~1% busy */
> 
> Therefore it measures this:
> 
> [adixit@DUT1220-DG2SVC igt-gpu-tools]$ sudo ./build/tests/i915_pm_rc6_residency --r rc6-idle
> IGT-Version: 1.27-g369bb6fb0f (x86_64) (Linux: 5.15.47+ x86_64)
> Opened device: /dev/dri/card0
> Starting subtest: rc6-idle
> Starting dynamic subtest: gt0-rcs0
> Total energy used while idle: 85825.3mJ (28606.5mW)
> Total energy used for normal: 86731.6mJ (28908.6mW)
> Total energy used for boost: 86992.8mJ (28995.8mW)
> Total energy used for once: 86677.9mJ (28890.5mW)
> Dynamic subtest gt0-rcs0: SUCCESS (12.235s)
> 
> The new test measures this:
> 
> [adixit@DUT1220-DG2SVC igt-gpu-tools]$ sudo ./build/tests/i915_power
> IGT-Version: 1.27-g369bb6fb0f (x86_64) (Linux: 5.15.47+ x86_64)
> Opened device: /dev/dri/card0
> Starting subtest: gpu-idle
> Measured power: 28535.5 mW
> Subtest gpu-idle: SUCCESS (3.002s)
> Starting subtest: gpu-busy
> Measured power: 50331.9 mW
> Subtest gpu-busy: SUCCESS (3.008s)
> 
> So you can see rc6-idle basically measures idle power (28 W instead of 50
> W), not power under load.
> 
> Other tests such as gem_exec_schedule also have igt_require etc. which skip
> in all sorts of situations. That is why I was forced to write these simple
> new tests.

Hi Ashutosh

Thanks for the clarification.

Riana
> Thanks.
> --
> Ashutosh
