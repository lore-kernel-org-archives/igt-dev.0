Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093196EE0C
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Oct 2021 23:42:24 +0000 (UTC)
References: <20211015233845.12272-1-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <7fee0739-2ef5-f6c7-84fd-e73c9a8085f2@intel.com>
Date: Fri, 15 Oct 2021 16:42:12 -0700
In-Reply-To: <20211015233845.12272-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Fix gem_has_execlists to
 match description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 10/15/2021 16:38, Ashutosh Dixit wrote:
> Driver is using execlists if it is not using GuC submission.
> GEM_SUBMISSION_EXECLISTS flag indicates if execlist submission is
> available, not if it is being used by the driver.
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   lib/i915/gem_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index 2627b802cfb..4312a73bd85 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -153,7 +153,7 @@ bool gem_has_semaphores(int fd)
>    */
>   bool gem_has_execlists(int fd)
>   {
> -	return gem_submission_method(fd) & GEM_SUBMISSION_EXECLISTS;
> +	return !gem_has_guc_submission(fd);
Don't we use ring submission on older platforms?

Isn't the better fix to just not set the EXECLIST flag when GuC 
submission is detected?

John.


>   }
>   
>   /**
