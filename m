Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7F610E084
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 08:18:13 +0000 (UTC)
Date: Tue, 24 Oct 2023 10:17:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <20231024081748.qewo6ta34cxqpcrh@kamilkon-desk.igk.intel.com>
References: <20211208192216.743364-1-robdclark@gmail.com>
 <20211208192216.743364-2-robdclark@gmail.com>
 <08cbf1e8-89c7-c0cd-2928-589e624710b1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08cbf1e8-89c7-c0cd-2928-589e624710b1@quicinc.com>
Subject: Re: [igt-dev] [PATCH igt 1/2] tools/msm_dp_compliance: Small arg
 parsing cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rob,

please add here description, for example what options
you added and why.

On 2023-10-19 at 03:40:04 -0700, Abhinav Kumar wrote:
> Reviving this:
> 
> On 12/8/2021 11:22 AM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Nit: shouldnt the patch prefix be "PATCH i-g-t" ?
> 
> We will test this out next week and land this.
> 
> > ---
> >   tools/msm_dp_compliance.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
> > index 5e491c89..a15a8dd9 100644
> > --- a/tools/msm_dp_compliance.c
> > +++ b/tools/msm_dp_compliance.c
> > @@ -629,7 +629,9 @@ static const char optstr[] = "hi";
> >   static void __attribute__((noreturn)) usage(char *name, char opt)
> >   {
> >   	igt_info("usage: %s [-hi]\n", name);
> > -	igt_info("\t-i\tdump info\n");
> > +	igt_info("\t-h, --help           - print this usage message");
> > +	igt_info("\t--help-description   - print test description");
------------------------------------------------ ^^^^
This is a tool, not a test, so imho s/test/tool/

Regards,
Kamil

> > +	igt_info("\t-i, --info           - dump info\n");
> >   	igt_info("\tDefault is to respond to Qd980 tests\n");
> >   	exit((opt != 'h') ? -1 : 0);
> >   }
> > @@ -709,6 +711,7 @@ int main(int argc, char **argv)
> >   	struct option long_opts[] = {
> >   		{"help-description", 0, 0, HELP_DESCRIPTION},
> >   		{"help", 0, 0, 'h'},
> > +		{"info", 0, 0, 'i'},
> >   	};
> >   	enter_exec_path(argv);
