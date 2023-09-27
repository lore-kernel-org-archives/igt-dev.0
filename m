Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A6110E4B3
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 09:01:29 +0000 (UTC)
Date: Wed, 27 Sep 2023 12:01:19 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Message-ID: <ZRPvX5Nyf1311cRY@intel.com>
References: <20230914080329.16648-1-stanislav.lisovskiy@intel.com>
 <344efd54-9002-dce5-2ad2-b60706a6763e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <344efd54-9002-dce5-2ad2-b60706a6763e@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/intel/i915_pipe_stress: Use only first
 pipe if Bigjoiner is used
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 07:13:39PM +0530, Modem, Bhanuprakash wrote:
> Hi Stan,
> 
> On Thu-14-09-2023 01:33 pm, Stanislav Lisovskiy wrote:
> > We currently are having test failures for Bigjoiner, because that
> > test tries to use all pipes simultaneously, not realizing that
> > if we use a Bigjoiner mode on pipe A, the adjacent pipe won't be
> > available.
> > For now just fix it by using only one pipe, if resolution > 3840
> > is detected.
> > 
> > Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > ---
> >   tests/intel/i915_pipe_stress.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
> > index 3cd84d027f..a050fa0117 100644
> > --- a/tests/intel/i915_pipe_stress.c
> > +++ b/tests/intel/i915_pipe_stress.c
> > @@ -590,6 +590,12 @@ static void stress_pipes(struct data *data, struct timespec *start,
> >   		igt_pipe_crc_stop(data->pipe_crc[pipe]);
> >   		igt_assert_crc_equal(&crc, &crc2);
> > +		/*
> > +		 * Do not try to use other pipes, if Bigjoiner is used
> > +		 */
> > +		if (data->highest_mode[pipe]->hdisplay > 3840)
> > +			break;
> 
> I think, you can use "igt_check_bigjoiner_support()" to know the selected
> pipe can drive the Bigjoiner or not.
> 
> - Bhanu

Yep, would be nicer of course to use some helper function here, but I guess
the one above just checks if bigjoiner is supported at all, while here we really
need to check if we are actually using it.
As I understand being able to support Bigjoiner doesn't always mean it is used at
the moment.

Stan

> 
> > +
> >   		++pipe;
> >   	}
> >   }
