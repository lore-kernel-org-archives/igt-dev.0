Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB20910E819
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 11:25:52 +0000 (UTC)
Date: Fri, 29 Apr 2022 14:24:05 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Message-ID: <YmvK1QJ8e3dlhQWV@platvala-desk.ger.corp.intel.com>
References: <20220425132804.1142619-1-riana.tauro@intel.com>
 <20220429095436.2203529-1-riana.tauro@intel.com>
 <f002bbaa0dfa44faac020885b8dc6ceb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f002bbaa0dfa44faac020885b8dc6ceb@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/intel-ci/fast-feedback:
 Add suspend tests without i915 to fast-feedback list
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 01:58:55PM +0300, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Tauro, Riana <riana.tauro@intel.com>
> > Sent: Friday, April 29, 2022 3:25 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>
> > Subject: [PATCH i-g-t v3 2/2] tests/intel-ci/fast-feedback: Add suspend tests
> > without i915 to fast-feedback list
> > 
> > From: "Tauro, Riana" <riana.tauro@intel.com>
> > 
> > Add basic-s2idle-without-i915 and basic-s3-without-i915 to fast-feedback list.
> > 
> > v2: rebase
> > v3: rebase
> > 
> > Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> > ---
> >  tests/intel-ci/fast-feedback.testlist | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-
> > feedback.testlist
> > index d075aa31..b579c20a 100644
> > --- a/tests/intel-ci/fast-feedback.testlist
> > +++ b/tests/intel-ci/fast-feedback.testlist
> > @@ -176,7 +176,8 @@ igt@i915_selftest@live  igt@dmabuf@all
> > 
> >  # System wide suspend tests
> > -igt@i915_suspend@system-suspend-without-i915
> > +igt@i915_suspend@basic-s2idle-without-i915
> > +igt@i915_suspend@basic-s3-without-i915
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Hi Petri,
> Is it ok to add extension of this test to fast feedback list.

Acked-by: Petri Latvala <petri.latvala@intel.com>
