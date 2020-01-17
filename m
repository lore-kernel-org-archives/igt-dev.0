Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED1E6E504
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2020 13:15:43 +0000 (UTC)
Date: Fri, 17 Jan 2020 15:15:16 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200117131516.GU25209@platvala-desk.ger.corp.intel.com>
References: <20200117091749.1606-1-mika.kahola@intel.com>
 <20200117121305.GT25209@platvala-desk.ger.corp.intel.com>
 <357202513f72d3e36517dfffacdc49577ab786c4.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <357202513f72d3e36517dfffacdc49577ab786c4.camel@intel.com>
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

On Fri, Jan 17, 2020 at 02:44:40PM +0200, Kahola, Mika wrote:
> On Fri, 2020-01-17 at 14:13 +0200, Petri Latvala wrote:
> > On Fri, Jan 17, 2020 at 11:17:49AM +0200, Mika Kahola wrote:
> > > The test is intended to test resolution changes from higher to
> > > lower and back. We can test this with only one plane and we don't
> > > need to run through all planes. This will save significant amount
> > > of test execution time.
> > > 
> > > Fix for
> > > Bugzilla: https://gitlab.freedesktop.org/drm/intel/issues/899
> > 
> > I'm having a hard time understanding how this change fixes this
> > issue.
> For some reason crc's don't match if we loop through multiple overlay
> planes. The reference image has primary, first overlay and cursors
> plane. Crc already fails if we compare the reference with the image
> having primary, second overlay and cursor plane. This I have been
> testing with TGL.


Commit message talks about saving test execution time but this
explanation is about working around failures.

What is actually broken and is this working around an issue or hiding
it? Is it always the same plane combination failing, every test round?

(Am I reading the test wrong though, as far as I can see there's just
two planes in use at a time, primary and one other...)

At the very least one plane of each type should be tested instead of
just the first non-primary.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
