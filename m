Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <b0998c4c-f76c-d6c4-6d6d-19de452f8e42@linux.intel.com>
Date: Wed, 2 Feb 2022 10:54:41 +0000
MIME-Version: 1.0
Content-Language: en-US
References: <20220201151946.258360-1-tvrtko.ursulin@linux.intel.com>
 <87h79i4lg6.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <87h79i4lg6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] intel_gpu_top: Improve
 error message when insufficient privilege
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
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 01/02/2022 16:10, Dixit, Ashutosh wrote:
> On Tue, 01 Feb 2022 07:19:46 -0800, Tvrtko Ursulin wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Print out end user friendly help text when the running user has
>> insufficient privilege for accessing system wide performance counters.
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Pushed, thank you!

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Issue: https://gitlab.freedesktop.org/drm/intel/-/issues/5018
>> ---
>>   tools/intel_gpu_top.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 81c724d1fe1c..0404a5881b40 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -1761,6 +1761,15 @@ int main(int argc, char **argv)
>> 	if (ret) {
>> 		fprintf(stderr,
>> 			"Failed to initialize PMU! (%s)\n", strerror(errno));
>> +		if (errno == EACCES && geteuid())
>> +			fprintf(stderr,
>> +"\n"
>> +"When running as a normal user CAP_PERFMON is required to access performance\n"
>> +"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
>> +"distribution vendor for assistance.\n"
>> +"\n"
>> +"More information can be found at 'Perf events and tool security' document:\n"
>> +"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
>> 		ret = EXIT_FAILURE;
>> 		goto err;
>> 	}
>> --
>> 2.32.0
>>
