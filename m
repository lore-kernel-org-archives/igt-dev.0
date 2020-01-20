Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9746E920
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2020 12:02:11 +0000 (UTC)
Date: Mon, 20 Jan 2020 14:02:08 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200120120208.GW25209@platvala-desk.ger.corp.intel.com>
References: <20200117091749.1606-1-mika.kahola@intel.com>
 <20200117121305.GT25209@platvala-desk.ger.corp.intel.com>
 <357202513f72d3e36517dfffacdc49577ab786c4.camel@intel.com>
 <20200117131516.GU25209@platvala-desk.ger.corp.intel.com>
 <da99bfa3432a4c4d267e29bbffc9a50f2b58855b.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da99bfa3432a4c4d267e29bbffc9a50f2b58855b.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_lowres: Test only with
 one plane
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 04:35:37PM +0200, Kahola, Mika wrote:
> On Fri, 2020-01-17 at 15:15 +0200, Petri Latvala wrote:
> > On Fri, Jan 17, 2020 at 02:44:40PM +0200, Kahola, Mika wrote:
> > > On Fri, 2020-01-17 at 14:13 +0200, Petri Latvala wrote:
> > > > On Fri, Jan 17, 2020 at 11:17:49AM +0200, Mika Kahola wrote:
> > > > > The test is intended to test resolution changes from higher to
> > > > > lower and back. We can test this with only one plane and we
> > > > > don't
> > > > > need to run through all planes. This will save significant
> > > > > amount
> > > > > of test execution time.
> > > > > 
> > > > > Fix for
> > > > > Bugzilla: https://gitlab.freedesktop.org/drm/intel/issues/899
> > > > 
> > > > I'm having a hard time understanding how this change fixes this
> > > > issue.
> > > 
> > > For some reason crc's don't match if we loop through multiple
> > > overlay
> > > planes. The reference image has primary, first overlay and cursors
> > > plane. Crc already fails if we compare the reference with the image
> > > having primary, second overlay and cursor plane. This I have been
> > > testing with TGL.
> > 
> > 
> > Commit message talks about saving test execution time but this
> > explanation is about working around failures.
> Right. I should have been more verbal about the commit message. On TGL
> running a single subtest takes ~15s with one plane of each type. If we
> loop through all planes, it takes ~55s.

Ok fair enough.

> > What is actually broken and is this working around an issue or hiding
> > it? Is it always the same plane combination failing, every test
> > round?
> > 
> > (Am I reading the test wrong though, as far as I can see there's just
> > two planes in use at a time, primary and one other...)
> That's true. The crc's are ok with overlay plane[0] but has a mismatch
> on the round plane[1]. Should we draw references too with all the
> overlay planes instead? Any suggestions how to handle this?
> 
> Originally, we tested only with the first overlay plane. This is not
> about testing the plane but more on testing resolution changes. That's
> why I suggested to take a step back and test only with one plane.


The thumb rule is that we have a test case for all different
behaviours of the driver, and incidentally for different behaviours of
the hardware because the kernel is supposed to handle the
differences. I suppose the pertinent question here is: Does the driver
have different code paths for resolution changes for different plane
usage?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
