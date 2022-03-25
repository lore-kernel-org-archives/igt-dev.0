Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 25 Mar 2022 12:02:37 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <Yj2TPQE3p16uIFLP@platvala-desk.ger.corp.intel.com>
References: <20220324142621.347452-1-matthew.auld@intel.com>
 <20220324142621.347452-4-matthew.auld@intel.com>
 <8735j75jjk.wl-ashutosh.dixit@intel.com>
 <af23ceff-4899-6bef-87e5-273419f030f8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af23ceff-4899-6bef-87e5-273419f030f8@intel.com>
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
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>,
 CQ Tang <cq.tang@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 08:40:45AM +0000, Matthew Auld wrote:
> On 24/03/2022 17:47, Dixit, Ashutosh wrote:
> > On Thu, 24 Mar 2022 07:26:20 -0700, Matthew Auld wrote:
> > > 
> > > @@ -554,6 +560,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
> > > 	igt_fixture {
> > > 		free(regions);
> > > 		close(i915);
> > > +		igt_i915_driver_unload();
> > 
> > I thought we'd reload the module with default params here but when the next
> > test runs the module gets loaded automatically so maybe this is ok?
> 
> Yeah, that at least matches my understanding. Adding Petri in case he has
> some comments here.

Yes, the convention is to either leave the module loaded with
defaults, or leave it unloaded. If the next test happens to be one
that wants to load the module with different params, we save some
time.

If loading the module again doesn't work we should see some fireworks
in CI results elsewhere anyway. Due to module loading problems we used
to limit them to known places (reloading tests, selftests, ...) so we
might need to revisit this topic later. But no need to FUD it at this
time.



-- 
Petri Latvala
