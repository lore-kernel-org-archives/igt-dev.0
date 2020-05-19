Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D93E6E30F
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 11:10:55 +0000 (UTC)
Date: Tue, 19 May 2020 14:10:52 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200519111052.GB9497@platvala-desk.ger.corp.intel.com>
References: <20200519061028.26699-1-anshuman.gupta@intel.com>
 <20200519084226.GY9497@platvala-desk.ger.corp.intel.com>
 <20200519102713.GP10565@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519102713.GP10565@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: CP
 cleanup exit handler
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 19, 2020 at 03:57:13PM +0530, Anshuman Gupta wrote:
> On 2020-05-19 at 11:42:26 +0300, Petri Latvala wrote:
> > On Tue, May 19, 2020 at 11:40:28AM +0530, Anshuman Gupta wrote:
> > > Add HDCP content protection cleanup igt exit handler,
> > > earlier it was done through igt_fixture which doesn't
> > > trigger hdcp cleanup on igt abortion due to any signal.
> > > This should avoid any HDCP content protection leak.
> > > 
> > > Cc: Ramalingam C <ramalingam.c@intel.com>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >  tests/kms_content_protection.c | 14 +++++++++-----
> > >  1 file changed, 9 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> > > index 3b9cedcb..f3101b8a 100644
> > > --- a/tests/kms_content_protection.c
> > > +++ b/tests/kms_content_protection.c
> > > @@ -651,12 +651,21 @@ static void test_content_protection_cleanup(void)
> > >  	}
> > >  }
> > >  
> > > +static void test_content_protection_exit_handler(int sig)
> > > +{
> > > +	igt_fixture {
> > > +		test_content_protection_cleanup();
> > > +		igt_display_fini(&data.display);
> > > +	}
> >
> Thanks Petri for review. 
> > Don't put it in an igt_fixture. If a test fails, you're still inside a
> > subtest and entering an igt_fixture will fail.
> test_content_protection_cleanup is using for_each_connected_output() which
> of using assert on igt_can_fail(), because of that i had to used
> igt_fixture(), could you please suggest to mitigate above.

Ohhh bugger, you're right =(

Well, the lib is in need of a good cleanup regarding exit handlers, as
this has now revealed. We need to fix the context tracking to properly
support exit handlers and have igt_can_fail work in those.

I suppose this code should work for now, the comment included:


/*
 * FIXME: igt_can_fail() is sometimes incorrect in exit handlers. Wrap
 * cleanup in igt_fixture if igt_core thinks we're still in a subtest.
 */
if (igt_subtest_name()) {
  test_content_protection_cleanup();
  igt_display_fini(&data.display);
 } else {
  igt_fixture {
    test_content_protection_cleanup();
    igt_display_fini(&data.display);
  }
 }


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
