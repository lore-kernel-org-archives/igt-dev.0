Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164466E14E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 11:23:38 +0000 (UTC)
Date: Thu, 12 Mar 2020 13:23:34 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200312112334.xqndl6jhclrjq37f@ahiler-desk1.fi.intel.com>
References: <20200312095137.551252-1-arkadiusz.hiler@intel.com>
 <20200312095137.551252-2-arkadiusz.hiler@intel.com>
 <bc3aec7ff3264fb397beb80c6dc25caa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc3aec7ff3264fb397beb80c6dc25caa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_chamelium: Don't fail
 random palnes tests on invalid config
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Peres, Martin" <martin.peres@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 01:15:11PM +0200, Peres, Martin wrote:
> s/palnes/planes
> 
> On 2020-03-12 11:51, Hiler, Arkadiusz wrote:
> > It is possible to generate a configuration that the driver rejects
> > because it cannot be handled (e.g. exceeding the number of available
> > scalers). Until now the test was failing in such cases with:
> > 
> >   igt_kms-CRITICAL: Test assertion failure function igt_display_commit_atomic, file ../lib/igt_kms.c:3490:
> >   igt_kms-CRITICAL: Failed assertion: ret == 0
> >   igt_kms-CRITICAL: Last errno: 22, Invalid argument
> >   igt_kms-CRITICAL: error: -22 != 0
> > 
> > With this change we will just note that the atomic commit is invalid and
> > pass the test without causing random noise.
> 
> I was about to object strongly, but thinking about it further, I think
> this whole subtest makes no sense. We have a ton of tests for planes,
> and if the targeted HW does not have support for CRCs, then it should be
> emulated using pipe writeback or using chamelium as a source of CRC.
> 
> Anyway, fixing this test would require a loop of atomic tries until a
> suitable configuration would be found, until then, I would rather skip
> than give the idea that the test could test anything.

You would get a valid configuration most of the runs. It looks like the
test was originally coined as "maybe we hit some real issue sometime" as
exhaustive testing of all valid configurations is impossible.

> In summary, either:
> 
>  - nuke the subtest

I was thinking about it, but prefered to have someone else say that
aloud.

>  - make it skip upon atomic check failure

You would get a random skip flip-floper. This would make many people
quite grumpy.

>  - fix it by looking for valid configurations

Better to nuke it than to throw even more complexity at it.

> I am just against the idea of passing a test without it doing anything.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
