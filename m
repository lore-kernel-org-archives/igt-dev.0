Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0390E6E51D
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Mar 2021 12:53:13 +0000 (UTC)
Date: Mon, 8 Mar 2021 14:53:39 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YEYeU0Pq/wsLP/5j@platvala-desk.ger.corp.intel.com>
References: <20210219172738.263820-1-jcline@redhat.com>
 <20210305164253.11788-1-jcline@redhat.com>
 <20210305164253.11788-2-jcline@redhat.com>
 <YEXkhTnlwCaFo9Fk@platvala-desk.ger.corp.intel.com>
 <d95e9fef-ee70-4875-beb6-7ebfee4c56f7@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d95e9fef-ee70-4875-beb6-7ebfee4c56f7@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] kms_hdr: Skip HDR tests on
 pre-Kaby Lake Intel devices
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
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 08, 2021 at 06:11:09PM +0530, Sharma, Swati2 wrote:
> 
> 
> On 08-Mar-21 2:17 PM, Petri Latvala wrote:
> > On Fri, Mar 05, 2021 at 11:42:52AM -0500, Jeremy Cline wrote:
> > > According to the Intel documentation[0] I could find, HDR support is
> > > only in Kaby Lake+. Skip tests in kms_hdr if the hardware doesn't
> > > support HDR.
> > > 
> > > [0] https://www.intel.com/content/dam/support/us/en/documents/graphics/HDR_Intel_Graphics_TechWhitePaper.pdf
> > > 
> > > Signed-off-by: Jeremy Cline <jcline@redhat.com>
> > 
> > 
> > While that might be true, strictly speaking IGT tests are not testing
> > the HW capabilities but the kernel interfaces. The difference is often
> > only interesting for nitpicking.
> > 
> > However, in this case a good argument can be made either way, with
> > what the correct behaviour with setting the "max bpc" property when
> > the HW doesn't support HDR _output_ should be. IGT tests should be
> > written the way one would expect "real" userspace to behave; does the
> > documented kernel interface require userspace to detect the device id
> > somehow? The connector property is there so one would assume setting
> > it should work and do something.
> > 
> > A good argument can also be made that even though we're testing "just
> > the interface", we (Intel) should have a separate test that requires
> > actual HW support...
> > 
> > Swati, Maarten, thoughts on this? Are we even testing the right things
> > for i915 at all? Are we able to express the HW requirement for HDR
> > with something other than comparing devid? Should we? (If we should
> > not, please suggest a better way to get around the issue being fixed
> > here)
> 
> There are 2 types of tests which are being validated in kms_hdr
> (i) bpc switch
> (ii) hdr metadata
> And both these tests will skip on platforms which doesn't support respective
> connector
> properties (MAX_BPC, HDR_OUTPUT_METADATA resp). These tests are independent
> of platforms on which they are being tested.
> This can be validated from the link below:
> https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=kms_hdr
> where you can see platforms which doesn't support either max_bpc or
> hdr_metadata
> connector properties; tests are being skipped.
> 
> And I don't think anything is being fixed here

What I meant is the fix in patch 2, removing the removal of the
primary plane, which was done because of a HSW limitation. Patch 1
(this thread) is then making sure HSW is unaffected by a spurious
failure. Sorry for not being clear when pulling more CCs.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
