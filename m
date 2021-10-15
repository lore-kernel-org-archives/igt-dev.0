Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20211014194238.1078854-1-John.C.Harrison@Intel.com>
 <87k0iecpc1.wl-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <92e77c59-f783-8d2c-c306-be163c6626d3@intel.com>
Date: Fri, 15 Oct 2021 14:46:20 -0700
In-Reply-To: <87k0iecpc1.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [igt-dev] [PATCH v2 i-g-t] tests/i915: Skip
 gem_exec_fair on GuC based platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On 10/15/2021 07:52, Dixit, Ashutosh wrote:
> On Thu, 14 Oct 2021 12:42:38 -0700, <John.C.Harrison@Intel.com> wrote:
>> +		/*
>> +		 * These tests are for a specific scheduling model which is
>> +		 * not currently implemented by GuC. So skip on GuC platforms.
>> +		 */
>> +		devid = intel_get_drm_devid(i915);
>> +		igt_require((intel_gen(devid) < 12) || IS_TIGERLAKE(devid) ||
>> +			    IS_ROCKETLAKE(devid) || IS_ALDERLAKE_S(devid));
> As I hinted on v1 let's just do this here:
>
> 	igt_require(gem_has_guc_submission(i915));
>
> So that we can can have a single unified way of detecting if GuC is being
> used throughout IGT. Today it is gem_has_guc_submission() and it works with
> the current kernel.
Earlier, you were saying that 'has' was only checking for capability not 
usage. Which would be pretty useless for this situation. Looking at the 
code, though it sort of does work. It checks the live value of the 
enable_guc module parameter. If that says that GuC submission is enabled 
then either we are using GuC submission or we have no engines (because a 
failure to start the submission backend is terminal, there is no 
fallback to execlist mode if GuC didn't work). So it can be used.

I say sort of, though, because the code also sets 'has_execlists' when 
it sets 'has_guc'. Which means that the gem_has_execlists() test is not 
useable as an indication that the execlist back end is being used. So 
gem_has_execlists() and gem_has_guc_submission() are basically very 
non-orthogonal. One is a test of hardware presence irrespective of use, 
the other is a test of usage irrespective of presence. The comment in 
the code is 'query whether the driver is using execlists as a hardware 
submission method'. So it seems like that was the original intention. 
Whether it has been broken since or was just broken from the beginning 
is unclear.

John.
