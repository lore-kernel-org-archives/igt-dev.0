Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532B76EA12
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 11:37:10 +0000 (UTC)
Message-ID: <ccf3f049-a67a-ec5b-377d-c23abecbc94b@intel.com>
Date: Wed, 1 Dec 2021 12:36:58 +0100
References: <20211126015735.908681-1-mastanx.katragadda@intel.com>
 <b4f66160-c947-1c47-5788-8a0d69f9bc48@linux.intel.com>
 <BN9PR11MB52905C33F740FAB54340B43C97669@BN9PR11MB5290.namprd11.prod.outlook.com>
 <5c09cc84-7f44-969c-9a7f-8c925f077ec5@linux.intel.com>
 <20211130164818.GA12888@jons-linux-dev-box>
 <400e33dd-8c5f-10ee-c5e9-631ebcf63253@linux.intel.com>
From: Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>
In-Reply-To: <400e33dd-8c5f-10ee-c5e9-631ebcf63253@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip Guc
 Submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Katragadda, MastanX" <mastanx.katragadda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 01/12/2021 10:46, Tvrtko Ursulin wrote:
> 
> On 30/11/2021 16:48, Matthew Brost wrote:
>>
>> IMO this fix is 100% correct as this is a known, tracked issue. It was
>> agreed upon (arch, i915, GuC team) that we just skip these tests with
>> GuC submission.
This does not look like a fix to me - you just disable test to hide the 
result. If this issue is recorded with a bug, is tracked - why cant we 
just let this test fail till we get this issue fixed?
> 
> I915 team is here on upstream as well.
> 
> Record those acks publicly would be my ask. Unless some security by 
> obscurity is happening here? Until then from me it is a soft nack to 
> keep disabling tests which show genuine weaknesses in GuC mode. Soft 
> until we get a public record of exactly what is broken and in what 
> circumstances, acked by architects publicly as you say they acked it 
> somewhere. Commit message devoid of detail is not good enough.
This should be most probably documented in the bug, right? Here we 
should just keep the test as is till the issue is fixed. I don't see how 
docummenting an issue would enable us to just disable the test.

Radek
