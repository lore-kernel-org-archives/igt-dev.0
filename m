Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989F46E2F2
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 10:36:13 +0000 (UTC)
Date: Tue, 19 May 2020 15:57:13 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200519102713.GP10565@intel.com>
References: <20200519061028.26699-1-anshuman.gupta@intel.com>
 <20200519084226.GY9497@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519084226.GY9497@platvala-desk.ger.corp.intel.com>
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-05-19 at 11:42:26 +0300, Petri Latvala wrote:
> On Tue, May 19, 2020 at 11:40:28AM +0530, Anshuman Gupta wrote:
> > Add HDCP content protection cleanup igt exit handler,
> > earlier it was done through igt_fixture which doesn't
> > trigger hdcp cleanup on igt abortion due to any signal.
> > This should avoid any HDCP content protection leak.
> > 
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tests/kms_content_protection.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> > index 3b9cedcb..f3101b8a 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -651,12 +651,21 @@ static void test_content_protection_cleanup(void)
> >  	}
> >  }
> >  
> > +static void test_content_protection_exit_handler(int sig)
> > +{
> > +	igt_fixture {
> > +		test_content_protection_cleanup();
> > +		igt_display_fini(&data.display);
> > +	}
>
Thanks Petri for review. 
> Don't put it in an igt_fixture. If a test fails, you're still inside a
> subtest and entering an igt_fixture will fail.
test_content_protection_cleanup is using for_each_connected_output() which
of using assert on igt_can_fail(), because of that i had to used
igt_fixture(), could you please suggest to mitigate above.

Thanks,
Anshuman Gupta.
> 
> You can trust the state to be correct without the fixture because you
> only install the exit handler when we're actually executing and the
> init has been already done.
> 
> 
> -- 
> Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
