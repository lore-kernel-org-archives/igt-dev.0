Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B46A6E96B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2020 09:12:36 +0000 (UTC)
Date: Thu, 13 Aug 2020 12:12:33 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200813091233.GT7444@platvala-desk.ger.corp.intel.com>
References: <20200806110803.19062-1-swati2.sharma@intel.com>
 <159730796702.14054.3936393887648687575@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159730796702.14054.3936393887648687575@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Add testdisplay test to BAT
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 09:39:27AM +0100, Chris Wilson wrote:
> Quoting Swati Sharma (2020-08-06 12:08:03)
> > testdisplay should be added to BAT. testdisplay is considered
> > to be the most basic test to test display functionality.
> > With this test we will be able to test modesetting.
> 
> Some might say that kms_setmode@basic provides the same coverage of
> basic modesetting. So what can be replaced? Does testdisplay have a good
> history of detecting bugs that others cannot? Does testdisplay have a
> good history of providing easy-to-debug results? [The latter is asking
> if it is a good primary test.] As I remember, testdisplay was relegated
> because it wasn't particularly helpful as anything other than an
> exhaustive sweep through all the modes.

I had similar recollections but testdisplay was never part of BAT,
says git log. I believe the original reason to not even consider it
was the runtime, which has been considerably impoved lately.

Other than that, the questions could use some answers.

(We should write those questions down in tests/intel-ci/README)


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
