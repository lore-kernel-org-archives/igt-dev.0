Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7446E881
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 23:39:47 +0000 (UTC)
References: <20211016002334.14580-1-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <15873c81-caec-c822-867f-7f0392606126@intel.com>
Date: Mon, 18 Oct 2021 16:39:40 -0700
In-Reply-To: <20211016002334.14580-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Return actual submission
 method from gem_submission_method
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 10/15/2021 17:23, Ashutosh Dixit wrote:
> gem_submission_method() purports to return the currently used submission
> method by the driver, as evidenced by its callers. Therefore remove the
> GEM_SUBMISSION_EXECLISTS flag when GuC submission is detected.
>
> This also fixes gem_has_execlists() to match its description, previously
> gem_has_execlists() would return true even if GuC submission was actually
> being used in the driver.
>
> Reported-by: John Harrison <john.c.harrison@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   lib/i915/gem_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index 2627b802cfb..b037d04cc4a 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -86,7 +86,7 @@ unsigned gem_submission_method(int fd)
>   		return 0;
>   
>   	if (igt_sysfs_get_u32(dir, "enable_guc") & 1) {
> -		flags |= GEM_SUBMISSION_GUC | GEM_SUBMISSION_EXECLISTS;
> +		flags |= GEM_SUBMISSION_GUC;
>   		goto out;
>   	}
>   
Looks good to me, but as per the comments in the other thread, this 
might have unintended side effects. Have you gone through all instances 
of the submission query usages to check how it is used and whether this 
will break something? E.g. if something is explicitly testing for 
execlist support to mean 'something better than ring buffer' then it 
would now fail.


John.
