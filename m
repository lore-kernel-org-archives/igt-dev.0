Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BB810E2BC
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Mar 2023 15:57:12 +0000 (UTC)
Date: Wed, 1 Mar 2023 16:54:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Petri Latvala <adrinael@adrinael.net>
Message-ID: <20230301155427.4cf55wlu7glblx4v@kamilkon-desk1>
References: <20230228212538.47984-1-kamil.konieczny@linux.intel.com>
 <Y/9SZ43ytZpxNJ6V@adrinael.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/9SZ43ytZpxNJ6V@adrinael.net>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner/resultgen: relax results
 processing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

On 2023-03-01 at 15:25:59 +0200, Petri Latvala wrote:
> On Tue, Feb 28, 2023 at 10:25:37PM +0100, Kamil Konieczny wrote:
> > We observed problems with resume runs when one of tests from
> > run fail to respond to SIGKILL and then don't exits, which
> > was reported like:
> > 
> > [1415.815247] Child refuses to die, tainted 0x40. Aborting.
> > 
> > After machine was rebooted runs were resumed but at the end
> > results from run wasn't processed due to error at comms file
> > from failed test. Try to correct that behaviour and count
> > results if at least one of files (comms or log) or dmesg was
> > successfully processed and fail only when both fail. Also
> > print more detailed info about what failed.
> 
> What is the comms file error? Are the logs from that run available
> somewhere?

I wasn't able to get a file, only this was in logs:

Invalid canary while parsing comms: 0, expected 1229411377

I guess kernel taint caused buffers were not flushed but file size
stay enlarged, so there were just zeroes, or maybe CI infra made
external reboot and that is what left. After reboot igt_resume was
called and seemed to precess all jobs until end, then at the very end
it failed at generating results.

--
Kamil

> 
> 
> -- 
> Petri Latvala
> 
> 
> > 
> > Cc: Petri Latvala <adrinael@adrinael.net>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  runner/resultgen.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > index b00bb6ba..ddc2098e 100644
> > --- a/runner/resultgen.c
> > +++ b/runner/resultgen.c
> > @@ -2133,7 +2133,6 @@ static bool parse_test_directory(int dirfd,
> >  	if (commsparsed == COMMSPARSE_ERROR) {
> >  		fprintf(stderr, "Error parsing output files (comms)\n");
> >  		status = false;
> > -		goto parse_output_end;
> >  	}
> >  
> >  	if (commsparsed == COMMSPARSE_EMPTY) {
> > @@ -2147,14 +2146,22 @@ static bool parse_test_directory(int dirfd,
> >  		    !fill_from_output(fds[_F_ERR], entry->binary, "err", &subtests, results->tests)) {
> >  			fprintf(stderr, "Error parsing output files (out.txt, err.txt)\n");
> >  			status = false;
> > -			goto parse_output_end;
> >  		}
> >  	}
> >  
> >  	if (!fill_from_dmesg(fds[_F_DMESG], settings, entry->binary, &subtests, results->tests)) {
> >  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
> > +		if (!status) {
> > +			fprintf(stderr, "resultgen: Error parsing output files and dmesg.txt, bail out\n");
> > +			goto parse_output_end;
> > +		}
> > +
> >  		status = false;
> > -		goto parse_output_end;
> > +	}
> > +
> > +	if (!status) {
> > +		fprintf(stderr, "resultgen: Warning: results may be incomplete for %s\n", entry->binary);
> > +		status = true;
> >  	}
> >  
> >  	override_results(entry->binary, &subtests, results->tests);
> > @@ -2302,6 +2309,7 @@ struct json_object *generate_results_json(int dirfd)
> >  
> >  		if (!parse_test_directory(testdirfd, &job_list.entries[i], &settings, &results)) {
> >  			close(testdirfd);
> > +			fprintf(stderr, "resultgen: Cannot parse results for: %s testname: %s\n", name, job_list.entries[i].binary);
> >  			return NULL;
> >  		}
> >  		close(testdirfd);
> > -- 
> > 2.37.2
> > 
