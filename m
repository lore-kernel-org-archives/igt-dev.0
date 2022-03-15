Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F285210E31E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Mar 2022 13:53:18 +0000 (UTC)
Date: Tue, 15 Mar 2022 15:52:44 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <YjCaLLlVuBJ4V+da@platvala-desk.ger.corp.intel.com>
References: <20220308142205.275928-1-bhanuprakash.modem@intel.com>
 <20220308142205.275928-2-bhanuprakash.modem@intel.com>
 <3e9ab021-3650-0acc-191d-8fce611aa199@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e9ab021-3650-0acc-191d-8fce611aa199@amd.com>
Subject: Re: [igt-dev] [v2 i-g-t 1/3] tests/kms_setmode: Use dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hayden Goodfellow <hayden.goodfellow@amd.com>,
 igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 09:37:31AM -0400, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2022-03-08 09:22, Bhanuprakash Modem wrote:
> > Add support to use dynamic subtests.
> > 
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> > ---
> >   tests/kms_setmode.c | 37 ++++++++++++++++++++++++++++++++++---
> >   1 file changed, 34 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> > index 18d81ee4f3..a47d47e5ab 100644
> > --- a/tests/kms_setmode.c
> > +++ b/tests/kms_setmode.c
> > @@ -653,6 +653,26 @@ static void test_crtc_config(const struct test_config *tconf,
> >   	return;
> >   }
> > +static int get_test_name_str(struct crtc_config *crtc, char *buf,
> > +				size_t buf_size)
> > +{
> > +	int pos;
> > +	int i;
> > +
> > +	pos = snprintf(buf, buf_size, "pipe-%s-", kmstest_pipe_name(crtc->pipe_id));
> > +
> > +	for (i = 0; i < crtc->connector_count; i++) {
> > +		drmModeConnector *connector = crtc->cconfs[i].connector;
> > +
> > +		pos += snprintf(&buf[pos], buf_size - pos,
> > +			"%s%s-%d", i ? "-" : "",
> > +			kmstest_connector_type_str(connector->connector_type),
> > +			connector->connector_type_id);
> > +	}
> > +
> > +	return pos;
> > +}
> > +
> >   static void test_one_combination(const struct test_config *tconf,
> >   				 struct connector_config *cconfs,
> >   				 int connector_count)
> > @@ -664,8 +684,19 @@ static void test_one_combination(const struct test_config *tconf,
> >   	setup_crtcs(tconf, cconfs, connector_count, crtcs,
> >   		    &crtc_count, &config_valid);
> > -	if (config_valid == !(tconf->flags & TEST_INVALID))
> > -		test_crtc_config(tconf, crtcs, crtc_count);
> > +	if (config_valid == !(tconf->flags & TEST_INVALID)) {
> > +		int i, pos = 0;
> > +		char test_name[256];
> > +
> > +		for (i = 0; i < crtc_count; i++) {
> > +			if (i > 0)
> > +				pos += snprintf(&test_name[pos], ARRAY_SIZE(test_name) - pos, "-");
> > +			pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
> > +		}
> > +
> > +		igt_dynamic_f("%s", test_name)
> > +			test_crtc_config(tconf, crtcs, crtc_count);
> > +	}
> >   	cleanup_crtcs(crtcs, crtc_count);
> >   }
> > @@ -939,7 +970,7 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
> >   	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> >   		igt_describe("Tests the mode by iterating through all valid/invalid crtc/connector combinations");
> > -		igt_subtest(tests[i].name) {
> > +		igt_subtest_with_dynamic(tests[i].name) {
> 
> Hi Bhanuprakash,
> 
> The above change causes a regression in AMD CI. Previously, all the below
> tests were passing, but now they are skipping.
> 
> basic-clone-single-crtc
> clone-exclusive-crtc
> invalid-clone-exclusive-crtc
> invalid-clone-single-crtc
> invalid-clone-single-crtc-stealing
> basic-clone-single-crtc
> 
> If we use igt_subtest instead of igt_subtest_with_dynamic, everything gets
> back to normal. Can we reintroduce igt_subtest? Or is there a better way to
> fix this issue?

What is the skip message? If it's "no dynamic subtests executed", then
you don't have any valid configs. Previously that would just silently
give a pass even when the test did absolutely nothing.


-- 
Petri Latvala
