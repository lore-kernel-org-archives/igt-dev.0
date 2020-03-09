Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF6989E0D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2020 08:49:11 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20200307211751.22125-4-mohammed.khajapasha@intel.com>
References: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
 <20200307211751.22125-4-mohammed.khajapasha@intel.com>
Date: Mon, 09 Mar 2020 10:49:20 +0200
Message-ID: <87d09lnca7.fsf@intel.com>
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, 08 Mar 2020, Mohammed Khajapasha <mohammed.khajapasha@intel.com> wrote:
> currently kmstest_pipe_name() fn gets the pipe index
> value to print the pipe name, but with non-contiguous
> display, pipe index is not always same as pipe name.
>
> for example: if PIPE_A is disabled in kernel, PIPE_B,C & D
> get registered with 0,1 & 2 indexes in mode config's crtc list
> and kmstest_pipe_name() always prints PIPE_A for 0 index
> which is actually PIPE_B in kernel.

IMO if you have enum pipe pipe in IGT, it should match the kernel pipe.

If you have crtc indexes in igt, then you should call them crtc indexes,
*not* pipes.

Otherwise you'll end up completely lost when a pipe is a pipe and when
it's not.

>  	igt_info("Running test on pipe %s with resolution %dx%d and sprite size %dx%d alpha %i\n",
> -		 kmstest_pipe_name(pipe), mode->hdisplay, mode->vdisplay,
> +		 kmstest_pipe_name(display->pipes[pipe].pipe), mode->hdisplay, mode->vdisplay,

For example in changes like this my only conclusion is that the pipe is
not really a pipe, but something else. So you should probably not call
it a pipe to begin with.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
