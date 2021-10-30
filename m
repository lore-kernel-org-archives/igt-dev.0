Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DEB6EA97
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Oct 2021 00:42:28 +0000 (UTC)
Message-ID: <688f0a5a-c1c1-97d8-1f75-e8a69a0fa8e2@intel.com>
Date: Fri, 29 Oct 2021 17:42:19 -0700
Content-Language: en-GB
References: <cover.1635395331.git.ashutosh.dixit@intel.com>
 <8da5f8f799245a0dac45ea96c0a3f992a285352e.1635395331.git.ashutosh.dixit@intel.com>
 <ef87d355-d5da-7c80-5c84-2c521d0d3f19@intel.com>
 <87pmrosmc6.wl-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87pmrosmc6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/i915: Return actual submission
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 10/28/2021 17:31, Dixit, Ashutosh wrote:
> On Thu, 28 Oct 2021 16:55:32 -0700, John Harrison wrote:
>> On 10/27/2021 21:40, Ashutosh Dixit wrote:
>>> gem_submission_method() purports to return the currently used submission
>>> method by the kernel, as evidenced by its callers. Therefore remove the
>>> GEM_SUBMISSION_EXECLISTS flag when GuC submission is detected.
>>>
>>> This also fixes gem_has_execlists() to match its description, previously
>>> gem_has_execlists() would return true even if GuC submission was actually
>>> being used in the driver.
>>>
>>> v2: Or gem_has_execlists call-sites with gem_has_guc_submission to make the
>>>       new code equivalent to the previous code.
>>> v3: Clarify that submission method is either guc (0x4), execlists (0x2) or
>>>       legacy without semaphores (0x0) or legacy with semaphores (0x1)
>> What about GuC with semaphores vs GuC without semaphores? Likewise execlist.
>>
>> Semaphores is not a submission method. They are a submission feature whose
>> support or lack there of is independent of the submission method.
> Sorry I didn't know that. But if you see gem_submission_method() in current
> upstream IGT (pasted below) it doesn't return "GuC with semaphores' or
> "execlist with semaphores" either. Anyway, let me do this in the next
> rev. Thanks.
I mean that in the old code:
     "GuC with semaphores" == is_guc_submission() && has_semaphores()

But if you conflate semaphores with the submission method then you have 
to explicitly enumerate all combinations.

Hmm, okay. Just realised that the old code did indeed have 
GEM_SUBMISSION_SEMAPHORES. Not sure what that was about!? You can 
definitely have semaphores with GuC/execlists and you can definitely 
have GuC/execlists without semaphores. I don't see why ring buffer 
submission would be any different but I admit it's been a while since 
I've looked at any ring buffer code.

It doesn't look like anything was actually using 'gem_has_semaphores()' 
at all, though. So nothing would notice if it was removed ;).

John.


>
> unsigned gem_submission_method(int fd)
> {
> 	const int gen = intel_gen(intel_get_drm_devid(fd));
> 	unsigned flags = 0;
>
> 	int dir;
>
> 	dir = igt_params_open(fd);
> 	if (dir < 0)
> 		return 0;
>
> 	if (igt_sysfs_get_u32(dir, "enable_guc") & 1) {
> 		flags |= GEM_SUBMISSION_GUC | GEM_SUBMISSION_EXECLISTS;
> 		goto out;
> 	}
>
> 	if (gen >= 8) {
> 		flags |= GEM_SUBMISSION_EXECLISTS;
> 		goto out;
> 	}
>
> 	if (has_semaphores(fd, dir))
> 		flags |= GEM_SUBMISSION_SEMAPHORES;
>
> out:
> 	close(dir);
> 	return flags;
> }
