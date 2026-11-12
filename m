Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E9F606A323
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=j4+jQjBG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6AF10E849;
	Thu, 12 Nov 2026 13:17:02 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E6710E607
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 13:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
 MIME-Version:Date:Message-ID:From:Reply-To;
 bh=VEzS0CTxua6F1IjInze+PgPK8sXj2AYE73rod5FWymM=; t=1794489221; x=2109849221; 
 b=j4+jQjBGcfT4O87A5EAuYWDqKuykovyyJPDSUOeF7++7BniLytKW5PFPlj9cr2v8imiFU3FhB5v
 gEk2MRnqohhp27FLZ1qLVurru2+T7SwVeylB7pRj2FYh81qCrmB5Q/RDLjaecePxd4mYqvqCDR5xn
 muetDu5Uk8WQE8UMKyfVoPRh/NqlUSFU5pWDDL+K8mdzxSVewTVF72IyiQwAfQQ+L7ccAdwsVR4l0
 NDDvzdztHHO6JJSRpISvXTBQskiBtiJRUeIVwxKL80m+cKObBGdfnorQLKR5auDNwI6r+C1Ca/Sji
 SgWBaYFgTPAMOMOZusMTxblzxepBpQoHjjCQ==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1xRUcP-009YKz-Ly; Thu, 12 Nov 2026 14:13:33 +0100
Message-ID: <da49e63f-c48b-41b1-84b2-138ba9286892@igalia.com>
Date: Thu, 12 Nov 2026 13:13:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
To: "Francis, David" <David.Francis@amd.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20261007141209.2928162-1-David.Francis@amd.com>
 <b9ffe1b9-1a65-45bd-858b-74f6ddd40a3b@igalia.com>
 <DMN81PMG934A.3W1P5EQFBJ9XU@intel.com>
 <72d94198-4678-4641-bbfb-e140c982b059@igalia.com>
 <CHAPR12MB999247E175D3C316F052F38778EF722@CHAPR12MB999247.namprd12.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CHAPR12MB999247E175D3C316F052F38778EF722@CHAPR12MB999247.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/11/2026 15:29, Francis, David wrote:
>>> +     /* New handle must be valid */
>>> +     ret = gem_close_bo(ctx, new_h);
>>
>> FWIW for all success checks you could use gem_close() from
>> ioctl_wrappers which has the built in assert. You lose the custom error
>> message, but is that really interesting.
>>
>> For me it's more readable to be more compact so one can focus better on
>> test logic versus the noise. I'd then rename gem_close_bo to __gem_close
>> so end result is gem_close for success tests and ret = __gem_close for
>> negative. That follows the existing helper naming pattern from
>> ioctl_wrappers, where double underscore helpers return a negative errno,
>> while normal ones assert success.
>>
>> If you decide to go this route probably also have __gem_change_handle
>> and gem_change_handle with the same pattern.
>>
>> If we convert one of the below subtests to this we would have:
>>
>> static void test_new_handle_zero(struct gpu_ctx *ctx)
>> {
>>         uint32_t handle;
>>         int ret;
>>
>>         handle = gpu_create_bo(ctx, 4096);
>>
>>         /* new_handle = 0 must fail with -EINVAL */
>>         ret = __gem_change_handle(ctx, handle, 0);
>>         igt_assert_eq(ret, -EINVAL);
>>
>>         /* Original handle should still be valid */
>>         gem_close(ctx, handle);
>> }
>>
>> Is it a bit nicer to read? I leave it to you.
> 
> Nothing wrong with either approach - to me, the complexity of having
> gem_close and __gem_close outweighs the complexity of extra characters
> in the tests. I'll probably keep things as is if that's okay.
> 
>>> +     /* new_handle > INT_MAX must fail with -EINVAL */
>>> +     ret = gem_change_handle(ctx, handle, (uint32_t)INT_MAX + 1);
>>> +     igt_assert(ret < 0);
>>> +     igt_assert_eq(errno, EINVAL);
>>
>> About this one I am not sure. Is it not implementation details as long
>> as the uapi for handle is u32? Let say someone converts to XArray one
>> day and then we have to artificially limit that to s32 just so
>> gem_change_handle can keep working.
> 
> My understanding of this kind of interface is that it's okay if a scenario
> goes from being an error to a kind of useful case in a later update -
> like when a padding element that was previously required to be 0 becomes
> a new field in the input struct. So good to test these, at least for now.
> 
>>> +     __atomic_store_n(&data->running, true, __ATOMIC_RELEASE);
>>
>> Potentially simpler to flip the semantices to data->stop which only
>> needs to be written before the join. Because threads are not running yet
>> despite true being written so it is slightly confusing.
> 
> To me having a swtch be on for test is running makes more sense than on
> for test is swap? In any case it would save exactly this one line.
> 
>>> +                     if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
>>> +                             return NULL;
>>
>> Stop condition can go instead of while (true).
> 
> In this case, this needs to be an immediate return. If it isn't a return,
> the test can try to gpu_create_bo even though the driver has been closed.
> Could do that with a check in the while and then another check right below
> but I think this is simpler.
> 
>>> +                     while (true) {
>>> +                             ret = gem_change_handle(data->ctx, handle, h[i]);
>>> +                             if (ret == 0) {
>>> +                                     if (verbose_logging) {
>>> +                                             igt_info("[CLOSE-TID:%lu] Change handle %u to %u\n",
>>> +                                                      (unsigned long)tid, handle, h[i]);
>>> +                                     }
>>> +                                     break;
>>> +                             }
>>
>> As in the other review I am not convinced this loop is guranteed to
>> break out. The change handle thread can keep taking the target this loop
>> wants by moving other handles around. Not sure how to solve it though
>> apart from adding some coordination between the threads.
> 
> At this point there should be only 1 valid bo being shuffled around
> between the 4 handle (we just closed the other one) so at most
> there should be 2 handles unavailable (change_handle locks down both the
> old and new handles for a bit). With the other 2 available, it shouldn't
> take long (and in my testing this does proceed)

Okay but if this thread fails due collision it tries a different target 
in the next round, right? By which time the other thread could have made 
that handle busy. I think in theory this can latch perfectly and never 
succeed but okay, you can try. Once the test is merged and becomes a 
part of Intel's public CI, where it will run constantly and on dozens of 
different machines if you get test runner timeout reports you will know 
where to look. :)

>>> +     /* Exactly two gem objects should still exist */
>>> +     num_handles = 0;
>>> +     for (int i = 0; i < 4; i++) {
>>
>> ARRAY_SIZE
> 
> I could parameterize this as shuffling K bos over N handles but I don't
> see a great reason to do any numbers other than 2 and 4.

No need to parametrize I was only thinking ARRAY_SIZE so you don't have 
to hardcode 4. Anyway, not a big deal.

I'll go read v4.

Regards,

Tvrtko

> All other feedback makes sense
> 
> I also am having trouble keeping track of the igt tests for the multiple
> different change_* ioctls and ioctl options and their different versions
> and feedback
> 
> Changes in v4
> 
> Thanks,
> David Francis
> 
> ________________________________________
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Sent: Thursday, November 5, 2026 6:07 AM
> To: Sebastian Brzezinka; Francis, David; igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly; Kamil Konieczny; Koenig, Christian; Simona Vetter; Deucher, Alexander
> Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests for GEM_CHANGE_HANDLE
> 
> 
> On 05/11/2026 10:56, Sebastian Brzezinka wrote:
>> Hi Tvrtko,
>>
>> On Thu Nov 5, 2026 at 11:49 AM CET, Tvrtko Ursulin wrote:
>>>
>>> Sorry for the delay, a combination of things..
>>>
>>> On 07/10/2026 15:12, David Francis wrote:
>>>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>
>>>> Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
>>>> functionality, edge cases, and race conditions of this ioctl against
>>>> itself, gem close, gem create, and prime import and export.
>>>>
>>>> GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This IGT
>>>> coverage is a prerequisite for validating the eventual kernel-side ioctl
>>>> implementation and makes fixing its security bugs safer.
>>>>
>>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>>>> Cc: Christian Konig <christian.koenig@amd.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>> Signed-off-by: David Francis <David.Francis@amd.com>
>>>> ---
>> There's already a v2. I commented here by accident, sorry for not
>> correcting it sooner.
> 
> Ah right, thank you. I wasn't copied on v2. Anyway, I think some of my
> comments still stand so I will let David sort through them first and
> maybe agree on v3 before I re-read it.
> 
> Regards,
> 
> Tvrtko
> 

