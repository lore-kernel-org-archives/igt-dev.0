Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Wed, 01 Feb 2023 16:51:27 +0100
Message-ID: <4458915.LvFx2qVVIh@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <877cx2v9dp.wl-ashutosh.dixit@intel.com>
References: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
 <1949047.usQuhbGJ8B@jkrzyszt-mobl1.ger.corp.intel.com>
 <877cx2v9dp.wl-ashutosh.dixit@intel.com>
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

Hi Ashutosh,

On Tuesday, 31 January 2023 19:36:50 CET Dixit, Ashutosh wrote:
> On Tue, 31 Jan 2023 09:36:30 -0800, Janusz Krzysztofik wrote:
> >
> > Since Chris' subtest didn't help in triggering the list corruption, I've
> > developed a new subtest that can do it.  Since it is almost identical to the
> > one Chris added, I decided to reuse his code, then add my new subtest to perf
> > as well.  But maybe you are right that my subtest better fits to another test.
> > not perf.  I'll think this over.
> >
> > I hope this clarifies things for you.
> 
> Thanks Janusz. Of course the test is valid but because it is not triggering
> bugs in perf perhaps it is better added to a different IGT file. Maybe
> gem_ctx_persistence? Maybe perf is also ok. Anyway something to think
> about.

I raised this point on today's IGT workroup meeting, asking for opinion.  
Since the new subtests depend on perf, we agreed that what needs to be done 
first is to provide an IGT library with perf helpers.  As soon as it is 
available, other tests can use it if needed.  Since I'm not familiar with 
perf, and I have other tasks in my queue, I've no time to spend on learning 
perf and working on that library.  Then, for now I'll keep the new subtests 
inside the perf test.  We can move them elsewhere at a later time, when the 
library is ready.

Thanks,
Janusz

> 
> Thanks.
> --
> Ashutosh
> 



