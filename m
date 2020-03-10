Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24A56E34A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2020 05:52:41 +0000 (UTC)
From: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>
Date: Tue, 10 Mar 2020 05:52:37 +0000
Message-ID: <1EBC98102E7E77409022937977AC68920C3E4633@BGSMSX110.gar.corp.intel.com>
References: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
 <20200307211751.22125-4-mohammed.khajapasha@intel.com>
 <87d09lnca7.fsf@intel.com>
In-Reply-To: <87d09lnca7.fsf@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] kms/test: Pass correct pipe value
 to print pipe name
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
To: Jani Nikula <jani.nikula@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, March 9, 2020 2:19 PM
> To: Khajapasha, Mohammed <mohammed.khajapasha@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH i-g-t 3/3] kms/test: Pass correct pipe value to
> print pipe name
> 
> On Sun, 08 Mar 2020, Mohammed Khajapasha
> <mohammed.khajapasha@intel.com> wrote:
> > currently kmstest_pipe_name() fn gets the pipe index value to print
> > the pipe name, but with non-contiguous display, pipe index is not
> > always same as pipe name.
> >
> > for example: if PIPE_A is disabled in kernel, PIPE_B,C & D get
> > registered with 0,1 & 2 indexes in mode config's crtc list and
> > kmstest_pipe_name() always prints PIPE_A for 0 index which is actually
> > PIPE_B in kernel.
> 
> IMO if you have enum pipe pipe in IGT, it should match the kernel pipe.
> 
> If you have crtc indexes in igt, then you should call them crtc indexes,
> *not* pipes.
> 
> Otherwise you'll end up completely lost when a pipe is a pipe and when it's
> not.
> 
> >  	igt_info("Running test on pipe %s with resolution %dx%d and sprite
> size %dx%d alpha %i\n",
> > -		 kmstest_pipe_name(pipe), mode->hdisplay, mode-
> >vdisplay,
> > +		 kmstest_pipe_name(display->pipes[pipe].pipe), mode-
> >hdisplay,
> > +mode->vdisplay,
> 
> For example in changes like this my only conclusion is that the pipe is not
> really a pipe, but something else. So you should probably not call it a pipe
> to begin with.

Are you saying, we should get rid of pipe enum and make it array index
based? Is my understanding correct?  
At present, every IGT subtest iterates over pipe list using "enum pipe" and
this is getting passed down. 
e.g.
In kms_atomic_transition test, each test case iterate over enum pipe to run the subtest.
snippet:
igt_main
{
	igt_display_t display;
	igt_output_t *output;
	enum pipe pipe;
	/*
	*/
	igt_subtest("plane-primary-toggle-with-vblank-wait")
		for_each_pipe_with_valid_output(&display, pipe, output)
			run_primary_test(&display, pipe, output);
	/*
	*/
}

In such case we might have to change all IGT test cases to handle pipe index based instead of enum pipe.


> 
> BR,
> Jani.
> 
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
