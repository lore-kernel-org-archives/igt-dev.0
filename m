Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF19289C84
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 08:50:12 +0000 (UTC)
References: <1616390813-26157-1-git-send-email-kunal1.joshi@intel.com>
 <f3a01f1b-3805-2ee8-866c-daa9086c893b@mupuf.org>
 <20210322072923.GA20972@intel.com>
 <bfe0f396-602b-77c7-951f-ea4d2821ed67@mupuf.org>
 <20210322083905.GA21298@intel.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <20519948-5308-b5d2-3662-02ad13d241cb@mupuf.org>
Date: Mon, 22 Mar 2021 10:50:02 +0200
MIME-Version: 1.0
In-Reply-To: <20210322083905.GA21298@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: only check chamelium's
 presence in chamelium tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 22/03/2021 10:39, Kunal Joshi wrote:
>> Yeah, but then that would not protect against tests that would forget to
>> re-plug the screens and thus would lead to unstable IGT results when the
>> test list is randomized (shard runs).
> 
> Correct, but from the recents runs i have observed that chamelium
> crashes in between (chameleond stops), There is no reply coming back
> and the test gives SIGQUIT.
> 
> I will try to come up with a non blocking plug all display,
> 
>> I think the idea was that the overhead of checking was measured in ms on
>> devices that have a chamelium, and no impact at all on machines without a
>> chamelium, so the convenience was deemed greater than the cost.
>>
>> Do you have specific measurements that would contradict this?
> 
> For this when chamelium is reachable its neglible in ms
> When chamelium is not reachable or crashed it takes 1m15.654s to ~4m causing inactivity timeout
> 
> The problem is chamelium crashes in between the runs not when the admin
> or someone starts it so time wasted is multiplied by all the tests we
> run.
> 
> So probably we have to find some other way of dealing with this,
> Either decreasing xmlrpc timeout below inactivity timeout or non
> blocking xmlrpc request.

I think the answer is pretty clear here: fix the problem at the source, 
don't work around it. You know the code is open source, right?

Martin

> 
> Thanks for the feedback
> 
> Regards
> Kunal Joshi
>>
>>>
>>> Currently when chamelium is not reachable we get SIGQUIT on all the
>>> tests
>>>
>>> Starting subtest: basic-fence-flip
>>> Received signal SIGQUIT.
>>> Stack trace:
>>> #0 [fatal_sig_handler+0xd6]
>>> #1 [killpg+0x40]
>>> #2 [pselect+0x59]
>>> #3 [xmlrpc_server_info_disallow_auth_ntlm+0x389]
>>> #4 [xmlrpc_server_info_disallow_auth_ntlm+0x786]
>>> #5 [xmlrpc_server_info_disallow_auth_ntlm+0xd1f]
>>> #6 [xmlrpc_client_call2+0xa8]
>>> #7 [xmlrpc_client_call2f_va+0x9e]
>>> #8 [__chamelium_rpc_va+0x87]
>>> #9 [__chamelium_rpc.constprop.8+0x8c]
>>> #10 [chamelium_wait_reachable+0x65]
>>> #11 [igt_display_require+0xbe]
>>> #12 [test_flip+0x4b]
>>> #13 [__real_main1093+0x1c38]
>>> #14 [main+0x27]
>>> #15 [__libc_start_main+0xe7]
>>> #16 [_start+0x2a]
>>>
>>> When chamelium is not reachable chamelium_wait_reachable() never returns
>>> back and we have inactivity timeout which kills the test.
>>
>> Isn't that exactly what we want? This seems to be a setup error, and we get
>> a clear message: we can't check the state of the chamelium, so better not
>> run KMS tests which depend on a state we can't check.
>>
>>>
>>> Regards
>>> Kunal Joshi
>>>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
