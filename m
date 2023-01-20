Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30912890BB
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 15:45:32 +0000 (UTC)
Message-ID: <9b0f24fd-5a46-d695-859b-4cccfe63b6bd@intel.com>
Date: Fri, 20 Jan 2023 15:45:27 +0000
MIME-Version: 1.0
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20230120100750.24122-1-nirmoy.das@intel.com>
 <20230120100750.24122-2-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230120100750.24122-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test/i915/gem_eio: Skip suspend
 test on smallbar machine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 20/01/2023 10:07, Nirmoy Das wrote:
> Suspending machine requires backing up gem objects to
> system memory. CPU non-visible lmem objects can only be
> backed up with the help of GPU on a smallbar device and if
> the gpu is wedged then such backup action will fail with -EIO.
> 
> This test sets the gpu to wedge state before suspending the
> machine which will always fail on smallbar machine.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7896
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

For the series,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

I guess this would also fail on full-bar, if there were some userspace 
lmem objects allocated during the test (due to ccs).

> ---
>   tests/i915/gem_eio.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index 70e82b811..8dbaa7a75 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -500,6 +500,7 @@ static void test_wait(int fd, unsigned int flags, unsigned int wait)
>   
>   static void test_suspend(int fd, int state)
>   {
> +	igt_require(!gem_has_smallbar(fd));
>   	/* Do a suspend first so that we don't skip inside the test */
>   	igt_system_suspend_autoresume(state, SUSPEND_TEST_DEVICES);
>   
