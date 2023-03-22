Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43B610E8E8
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 10:22:32 +0000 (UTC)
Message-ID: <17274286-8b9b-4106-ca44-c76c17fc738a@intel.com>
Date: Wed, 22 Mar 2023 15:52:18 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Luca Coelho <luca@coelho.fi>, igt-dev@lists.freedesktop.org
References: <20230320143622.5166-1-swati2.sharma@intel.com>
 <4b8b5e1fd10fd32ab7f2196cb5b11129e849f3b9.camel@coelho.fi>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <4b8b5e1fd10fd32ab7f2196cb5b11129e849f3b9.camel@coelho.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane_scaling: Fix
 out-of-bound array access
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



On 22-Mar-23 3:36 PM, Luca Coelho wrote:
> On Mon, 2023-03-20 at 20:06 +0530, Swati Sharma wrote:
>> With this fix we are solving 2 issues. Firstly, the
>> planes_scaling_combo() tests were leaving one scaler assigned
>> after running sub-test with two consecutive planes because
>> one scaler was getting reused in the next run. So with this fix
>> scaler is not reused since we won't have any common plane.
>>
>> Secondly, when k == n_planes - 1, we were trying to access
>> planes[n_planes], which led to array out of bounds error. So, with
>> this fix, this issue is fixed too.
>>
>> v2: -fix condition if n_planes is not even (JP)
>>
>> Suggested-by: Luca Coelho <luciano.coelho@intel.com>
>> Suggested-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Reported-by: Luca Coelho <luciano.coelho@intel.com>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_plane_scaling.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 3a6904afb..7feb45ca3 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -744,7 +744,7 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>>   		igt_assert(0);
>>   	}
>>   
>> -	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
>> +	for (int k = 0; k < display->pipes[pipe].n_planes - 1; k += 2) {
>>   		igt_plane_t *p1, *p2;
>>   
>>   		p1 = &display->pipes[pipe].planes[k];
> 
> What will happen if we have only 1 plane? Shouldn't the test be
> skipped? It seems that the loop will just not run and the test result
> will be pass?
Right.
Should we add igt_require(n_planes >=2)?
With that if n_planes=1 test will SKIP.
> 
> --
> Cheers,
> Luca.

-- 
~Swati Sharma
