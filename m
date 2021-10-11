Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0E16E446
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 08:44:21 +0000 (UTC)
Message-ID: <fbe44331-125f-ec8a-80f6-3f9c1c8c05fd@mupuf.org>
Date: Mon, 11 Oct 2021 11:44:07 +0300
MIME-Version: 1.0
Content-Language: en-US
References: <20211008190251.3709425-1-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Martin_Roukala_=28n=c3=a9=c3=a9_Peres=29?=
 <martin.roukala@mupuf.org>
In-Reply-To: <20211008190251.3709425-1-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests: Add amdgpu test suite
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, igt-dev@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Nicholas Choi <Nicholas.Choi@amd.com>, Sun peng Li <sunpeng.li@amd.com>, Alexander Deucher <alexander.deucher@amd.com>, Hayden Goodfellow <hayden.goodfellow@amd.com>, Simon Ser <contact@emersion.fr>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 08/10/2021 22:02, Rodrigo Siqueira wrote:
> Add various test suites relevant for the amdgpu driver.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Nicholas Choi <Nicholas.Choi@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Sun peng (Leo) Li <sunpeng.li@amd.com>
> Cc: Alexander Deucher <alexander.deucher@amd.com>
> Cc: Martin Roukala <martin.roukala@mupuf.org>
> Cc: Hayden Goodfellow <hayden.goodfellow@amd.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Mark Yacoub <markyacoub@google.com>
> 
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   tests/amdgpu-ci/README                 |  31 +++++
>   tests/amdgpu-ci/fast-feedback.testlist | 135 +++++++++++++++++++
>   tests/amdgpu-ci/full-feedback.testlist | 173 +++++++++++++++++++++++++
>   3 files changed, 339 insertions(+)
>   create mode 100644 tests/amdgpu-ci/README
>   create mode 100644 tests/amdgpu-ci/fast-feedback.testlist
>   create mode 100644 tests/amdgpu-ci/full-feedback.testlist
> 
> diff --git a/tests/amdgpu-ci/README b/tests/amdgpu-ci/README
> new file mode 100644
> index 00000000..bd34245c
> --- /dev/null
> +++ b/tests/amdgpu-ci/README
> @@ -0,0 +1,31 @@
> +This directory contains test lists that are used by AMD's CI. The
> +files are passed to piglit with the --test-list parameter directly.
> +
> +The test lists are contained in the IGT repository for several
> +reasons:
> +
> +- The lists stay synchronized with the IGT codebase.
> +- Public availability. Kernel developers can see what tests are run,
> +  and can see what changes are done to the set, when, and why.

Thanks for doing this!

> +
> +Changing the test lists should only happen with approval from:
> +- Harry Wentland <harry.wentland@amd.com>
> +- Nicholas Choi <Nicholas.Choi@amd.com>
> +- Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> +- Sun peng (Leo) Li <sunpeng.li@amd.com>
> +
> +======================
> +fast-feedback.testlist
> +======================
> +
> +Fast-feedback contains tests that roughly tests a wide coverage of features in
> +a short time. We use this list for presubmission validation. Results of a
> +fast-feedback test round should only be considered to mean that the kernel is
> +not obviously broken.

It would be good to have a target execution time for this list. ~10 
minutes and 12 minutes in the worst case has been working for Intel, but 
what would you like to use?

> +
> +======================
> +full-feedback.testlist
> +======================
> +
> +This is an extensive set of tests that takes a long time to complete in which
> +we usually use as post-submission.

 From experience, I would specify the full list as a opt-out, rather 
than opt-in. Otherwise, you will soon realize that it takes a lot of 
time and energy to maintain the list to always add new tests there.

By opting out of i915/gem/nouveau/udl/... tests, you will at least get 
every new KMS test by default.

Is that making sense?

Martin
