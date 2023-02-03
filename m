Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Fri, 03 Feb 2023 21:59:05 +0100
Message-ID: <1780744.TLkxdtWsSY@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <Y91ews5O6nHf+2EX@orsosgc001.jf.intel.com>
References: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
 <Y91ews5O6nHf+2EX@orsosgc001.jf.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] tests/i915/perf: Add stress / race
 exercises
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Umesh,

Thanks for taking a look.

On Friday, 3 February 2023 20:21:38 CET Umesh Nerlige Ramappa wrote:
> On Tue, Jan 31, 2023 at 10:17:29AM +0100, Janusz Krzysztofik wrote:
> >Users reported oopses on list corruptions when using i915 perf with a
> >number of concurrently running graphics applications.  That indicates we
> >are currently missing some important tests for such scenarios.  Cover
> >that gap.
> 
> Any bug ids that were filed for the issue? 

Yes, https://gitlab.freedesktop.org/drm/intel/issues/6333.

> Also what were the parameters 
> passed to perf OA when the issues were reported? This could help 
> actually root cause the issue and have a test closer to the actual use 
> case.

Root cause has been already identified, and it lays not in perf, only in 
barriers handling code, see https://patchwork.freedesktop.org/series/113636/ 
(submitted to trybot so far, soon to the public list).

Thanks,
Janusz

> 
> Regards,
> Umesh
> >
> >Chris Wilson (1):
> >  i915/perf: Stress opening of new perf streams against existing
> >    contexts
> >
> >Janusz Krzysztofik (1):
> >  tests/i915/perf: Exercise barrier race
> >
> > tests/i915/perf.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 111 insertions(+)
> >
> 



