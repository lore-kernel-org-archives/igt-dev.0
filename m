Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED9B10E093
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 06:55:12 +0000 (UTC)
Date: Fri, 26 May 2023 08:55:08 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526085508.3fb9e96d@maurocar-mobl2>
In-Reply-To: <20230525211144.snixsj3tbhkypi4a@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-12-mauro.chehab@linux.intel.com>
 <20230525211144.snixsj3tbhkypi4a@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 11/11] testplan/meson.build: make it
 check for missing i915 documentation
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

On Thu, 25 May 2023 23:11:44 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2023-05-25 at 11:05:35 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Now that i915 is fully documented, check it at build time.  
> 
> This is not working now, see GitLab log:
> 
> Warning: Missing documentation for igt@perf_pmu@rc6-all-gts
> ninja: build stopped: subcommand failed.

Btw, this shows why such change pays-off. What happened is that
changeset 446187157b00 ("perf_pmu: Two new rc6 subtests"), created a
new rc6-all-gts subtest:

+       igt_subtest("rc6-all-gts")
+               test_rc6(fd, 0, num_gt, TEST_ALL | TEST_OTHER);

also, changeset a00f3ad8a783 ("perf_pmu: Support multi-tile in rc6 subtest")
dropped two tests.

I ran the sync scripts before those patches got merged.

Just send a patch series syncing with both changes and applying the
documentation check patch:

	https://patchwork.freedesktop.org/series/118411/

Regards,
Mauro
