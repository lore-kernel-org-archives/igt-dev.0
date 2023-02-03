Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 11:21:38 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <Y91ews5O6nHf+2EX@orsosgc001.jf.intel.com>
References: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] tests/i915/perf: Add stress / race
 exercises
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris
 Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 10:17:29AM +0100, Janusz Krzysztofik wrote:
>Users reported oopses on list corruptions when using i915 perf with a
>number of concurrently running graphics applications.  That indicates we
>are currently missing some important tests for such scenarios.  Cover
>that gap.

Any bug ids that were filed for the issue? Also what were the parameters 
passed to perf OA when the issues were reported? This could help 
actually root cause the issue and have a test closer to the actual use 
case.

Regards,
Umesh
>
>Chris Wilson (1):
>  i915/perf: Stress opening of new perf streams against existing
>    contexts
>
>Janusz Krzysztofik (1):
>  tests/i915/perf: Exercise barrier race
>
> tests/i915/perf.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 111 insertions(+)
>
>-- 
>2.25.1
>
