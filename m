Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57A510E08C
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 08:10:28 +0000 (UTC)
Date: Wed, 7 Jun 2023 10:10:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230607101024.75ad82bc@maurocar-mobl2>
In-Reply-To: <2884858.e9J7NaK4W3@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <4686292.rnE6jSC6OK@jkrzyszt-mobl2.ger.corp.intel.com>
 <20230606155727.032e0fa3@maurocar-mobl2>
 <2884858.e9J7NaK4W3@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] lib/igt_kmod: place KUnit tests on
 a subtest
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

On Tue, 06 Jun 2023 16:22:21 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> > We can use whatever other name, provided that the output of
> > --list-subtests will be identical to the dynamic subtest. If not,
> > build will fail when checking for documentation inconsistencies.   
> 
> AFAICU, that checking process compares subtest names found in a documentation, 
> here the source code, as pointed by you in one of your previouse answers as 
> the source of the documentation, against --list output.  But that sounds 
> weird.  What a sophisticated code parser must be used to resolve subtest names 
> potentially provided via expressions?  Another compiler?
> Or is there another source of documentation, which I already asked you for a 
> reference to, and you didn't clearly answered yet, used by the build process 
> for that checking?

There's no other source of documentation. The documentation toolset
has a --check tool that calls the binaries using "--list" parameter,
comparing them with the documentation inside the source code.

So, for tests/drm_mm.c file, the documentation is on its source:

	/**
	 * TEST: drm mm
	 * Description: Basic sanity check of DRM's range manager (struct drm_mm)
	 * Feature: mapping
	 * Run type: FULL
	 *
	 * SUBTEST: all-tests
	 *
	 * SUBTEST: all-tests@align
	 * Category: Infrastructure
	 * Description: drm_mm range manager SW validation
	 * Functionality: DRM memory mangemnt
	 * Test category: GEM_Legacy
	...

It will run build/tests/drm_mm --list in order to compare "SUBTEST"
the fields. The ones with "@" are dynamic subtests and are currently
ignored, as --list is currently not capable of reporting dynamic 
subtests.

Now, it is possible to change from "all-tests" to something else, but
such patch also needs to change it inside tests/drm_mm.c.

Regards,
Mauro
