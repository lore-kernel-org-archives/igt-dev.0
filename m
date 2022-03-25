Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <af23ceff-4899-6bef-87e5-273419f030f8@intel.com>
Date: Fri, 25 Mar 2022 08:40:45 +0000
MIME-Version: 1.0
Content-Language: en-GB
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
References: <20220324142621.347452-1-matthew.auld@intel.com>
 <20220324142621.347452-4-matthew.auld@intel.com>
 <8735j75jjk.wl-ashutosh.dixit@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <8735j75jjk.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/gem_lmem_swapping: limit lmem
 to 4G
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, CQ Tang <cq.tang@intel.com>,
 Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 24/03/2022 17:47, Dixit, Ashutosh wrote:
> On Thu, 24 Mar 2022 07:26:20 -0700, Matthew Auld wrote:
>>
>> @@ -554,6 +560,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>> 	igt_fixture {
>> 		free(regions);
>> 		close(i915);
>> +		igt_i915_driver_unload();
> 
> I thought we'd reload the module with default params here but when the next
> test runs the module gets loaded automatically so maybe this is ok?

Yeah, that at least matches my understanding. Adding Petri in case he 
has some comments here.
