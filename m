Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006210E4AE
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 09:30:00 +0000 (UTC)
Date: Thu, 2 Feb 2023 11:27:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Message-ID: <Y9uCCp/eouIXyzOx@intel.com>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
 <20230131120646.27434-5-ville.syrjala@linux.intel.com>
 <61922555-cfbf-e8bb-7b70-e047e98afc25@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61922555-cfbf-e8bb-7b70-e047e98afc25@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] tests/kms_async_flips: Run the test
 only once per pipe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 05:51:22PM +0530, Modem, Bhanuprakash wrote:
> Hi Ville,
> 
> On Tue-31-01-2023 05:36 pm, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > No real reason to iterate over all the outputs here. Just
> > do the test once per pipe.
> > 
> > Cc: Arun R Murthy <arun.r.murthy@intel.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   tests/kms_async_flips.c | 18 +++++-------------
> >   1 file changed, 5 insertions(+), 13 deletions(-)
> > 
> > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> > index f8c97e029c59..54611f66350d 100644
> > --- a/tests/kms_async_flips.c
> > +++ b/tests/kms_async_flips.c
> > @@ -544,20 +544,12 @@ static void test_crc(data_t *data)
> >   
> >   static void run_test(data_t *data, void (*test)(data_t *))
> >   {
> > -	igt_output_t *output;
> > -	enum pipe pipe;
> > +	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
> 
> If data->extended is true, it'll iterate over all outputs. Maybe we can 
> use for_each_pipe_with_single_output() to run test once per pipe.

Hmm. After further thought it might still be nice to iterate all
outputs, in case we have output specific stuff (eg. PSR) that
could affect the behaviour or async flips. In which case I suppose
we need to keep including the output name in the test name.

> 
> - Bhanu
> 
> > +		igt_dynamic_f("pipe-%s", kmstest_pipe_name(data->pipe))
> > +			test(data);
> >   
> > -	for_each_pipe(&data->display, pipe) {
> > -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> > -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> > -				data->output = output;
> > -				data->pipe = pipe;
> > -				test(data);
> > -			}
> > -
> > -			if (!data->extended)
> > -				break;
> > -		}
> > +		if (!data->extended)
> > +			break;
> >   	}
> >   }
> >   

-- 
Ville Syrjälä
Intel
