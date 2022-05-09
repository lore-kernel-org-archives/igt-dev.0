Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0B510F2FD
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 15:55:44 +0000 (UTC)
Date: Mon, 9 May 2022 17:55:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Ynk5ewL5bY0tcoKf@kamilkon-DESK1>
References: <20220506142445.2068263-1-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220506142445.2068263-1-sinjan.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/i915/gem_exec_balancer: Add busy
 subtest description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Ramadevi Gandi <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sinjan,

On 2022-05-06 at 19:54:45 +0530, sinjan.kumar@intel.com wrote:
> From: Sinjan Kumar <sinjan.kumar@intel.com>
> 
> Add busy subtest description
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

If you sended this mail to other developers, please put more
addresses here.

> Signed-off-by: Sinjan Kumar <sinjan.kumar@intel.com>
> ---
>  tests/i915/gem_exec_balancer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index 857d0085..c68a50e7 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -3301,6 +3301,9 @@ igt_main
>  	igt_subtest("indices")
>  		indices(i915);
>  
> +	igt_describe("Test for validating engine busyness by checking"
> +		     " read-write event through GEM_BUSY IOCTL");
> +

Please remove this empty line. Please try to avoid starting
desciption with "Test" word (well, sometimes you can use it).
Here you could start with "Validate" word:

	igt_describe("Validate engine busyness by checking read-write"
		     " event through GEM_BUSY IOCTL.");

For future versions of this and other description patches please
send them as HAX series, e.g. add second patch with file
tests/intel-ci/fast-feedback.testlist
containing only one line:

igt@meta_test@fail-result

and with subject "HAX: do not run tests", also in cover letter
subject put "HAX add description to [put name of test here]"

See e-mail from Zbigniew on 3 Mar 2022,
"Use HAX for series which add igt_describe"

or https://patchwork.freedesktop.org/series/101198/
as an example.

>  	igt_subtest("busy")
>  		busy(i915);

May you add more descriptions for other subtests ? Check them
with --describe option.

Regards,
Kamil

>  
> -- 
> 2.25.1
> 
