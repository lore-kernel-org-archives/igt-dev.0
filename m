Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A90889885
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Sep 2021 09:31:58 +0000 (UTC)
References: <20210903140348.252686-1-thomas.hellstrom@linux.intel.com>
 <YTW0PS1FF5XTGhmO@platvala-desk.ger.corp.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <d51e3861-90a8-6d40-c393-82603b571700@linux.intel.com>
Date: Mon, 6 Sep 2021 11:31:53 +0200
MIME-Version: 1.0
In-Reply-To: <YTW0PS1FF5XTGhmO@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] test/gem_exec_suspend: Enable the test
 for discrete GPUs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, matthew.auld@intel.com
List-ID: <igt-dev@lists.freedesktop.org>


On 9/6/21 8:25 AM, Petri Latvala wrote:
> On Fri, Sep 03, 2021 at 04:03:48PM +0200, Thomas Hellström wrote:
>> Discrete GPUs don't support gem_set_caching() and uses a single,
>> kernel provided mapping mode, FIXED. Adjust the test accordingly.
>>
>> This makes the test run on DG1.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   tests/i915/gem_exec_suspend.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
>> index dbe0c8a7..5f17e600 100644
>> --- a/tests/i915/gem_exec_suspend.c
>> +++ b/tests/i915/gem_exec_suspend.c
>> @@ -114,7 +114,8 @@ static void run_test(int fd, const intel_ctx_t *ctx,
>>   
>>   	memset(obj, 0, sizeof(obj));
>>   	obj[0].handle = gem_create(fd, 4096);
>> -	gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
>> +	if (!gem_has_lmem(fd))
>> +		gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
>>   	obj[0].flags |= EXEC_OBJECT_WRITE;
>>   	obj[1].handle = gem_create(fd, 4096);
>>   	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
>> @@ -293,6 +294,7 @@ igt_main
>>   	const struct intel_execution_engine2 *e;
>>   	igt_hang_t hang;
>>   	const intel_ctx_t *ctx;
>> +	bool has_lmem;
>>   	int fd;
>>   
>>   	igt_fixture {
>> @@ -302,6 +304,7 @@ igt_main
>>   		ctx = intel_ctx_create_all_physical(fd);
>>   
>>   		igt_fork_hang_detector(fd);
>> +		has_lmem = gem_has_lmem(fd);
>>   	}
>>   
>>   	igt_subtest("basic")
>> @@ -318,6 +321,18 @@ igt_main
>>   		run_test(fd, ctx, ALL_ENGINES, HIBERNATE);
>>   
>>   	for (m = modes; m->suffix; m++) {
>> +		if (has_lmem) {
>> +			igt_subtest_with_dynamic_f("fixed%s", m->suffix) {
> You can't do
>
> if (something_that_depends_on_the_running_system)
>    igt_subtest_of_any_kind(...)
>
>
> Instead you need to do
>
> igt_subtest_of_any_kind(...) {
>    igt_require(something_that_depends_on_the_running_system);
>    ...
> }
>
>
Thanks. I'll respin.

/Thomas


