Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A720210E115
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 12:50:58 +0000 (UTC)
Date: Tue, 4 Jul 2023 14:50:53 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <20230704145053.31c39a24@maurocar-mobl2>
In-Reply-To: <f307f97a-506a-4897-46a7-52ce032aa8b6@linux.intel.com>
References: <20230526064624.2886063-1-mauro.chehab@linux.intel.com>
 <20230526064624.2886063-3-mauro.chehab@linux.intel.com>
 <843966cc-f42a-5ec8-34d5-80cb832b8ee1@linux.intel.com>
 <f307f97a-506a-4897-46a7-52ce032aa8b6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] testplan/meson.build: make it check
 for missing i915 documentation
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

On Tue, 4 Jul 2023 13:41:14 +0100
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> On 04/07/2023 13:28, Tvrtko Ursulin wrote:
> > 
> > On 26/05/2023 07:46, Mauro Carvalho Chehab wrote:  
> >> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>
> >> Now that i915 is fully documented, check it at build time.  
> > 
> > This step seems to be slow as molasses and it also rebuilds the Xe test 
> > plan when I touch an i915 test.

This is fixable, but better to wait for Bhanu's patch series that will
be moving the Intel tests to a new directory (tests/intel/).

> > 
> > What is the way to disable it all when configuring the build?

Yes, you can disable it:

	$ meson -Dtestplan=disabled build --reconfigure

We do want this enabled by default, as CI needs to check it and
reject patches that aren't updating tests documentation.

Our internal CI is already dependent on it for the Xe and KMS, and
the plan is to extend it to i915 as well, to get rid of lots of
hacks that currently maps tests with the tested features.

> > 
> > P.S. I also find the "now that i915 is fully documented" statement a bit 
> > of a chuckle, since random two tests I happened to open haven't really 
> > been documented - it rather looks to be a bit of a charade.

Well, it is as good as what we had documented on IGT itself and on
some separate spreadsheets. If you find anything odd, please fix it.

> > 
> > I wouldn't care really apart from it significantly slowing down the 
> > development workflow.  
> 
> # time ninja
> [1/448] Generating lib/version.h with a custom command
> fatal: not a git repository (or any of the parent directories): .git
> [6/6] Generating docs/testplan/i915_tests.rst with a custom command
> 
> real    0m24.363s
> user    0m6.530s
> sys     0m20.968s
> 
> 24 seconds.. I just changed one i915 test. :(

What it takes time is not building the docs, but to run all tests with
"--list" parameter, in order to double-check if every test has some
documentation.

Regards,
Mauro
