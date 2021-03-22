Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6062D6E3D6
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 07:30:41 +0000 (UTC)
Date: Mon, 22 Mar 2021 12:59:23 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20210322072923.GA20972@intel.com>
References: <1616390813-26157-1-git-send-email-kunal1.joshi@intel.com>
 <f3a01f1b-3805-2ee8-866c-daa9086c893b@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3a01f1b-3805-2ee8-866c-daa9086c893b@mupuf.org>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: only check chamelium's
 presence in chamelium tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Martin Peres <martin.peres@mupuf.org>, igt-dev@lists.freedesktop.org, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-03-22 at 08:29:02 +0200, Martin Peres wrote:
> On 22/03/2021 07:26, Kunal Joshi wrote:
> > Avoid checking if chamelium is present or not in non chamelium
> > tests as its just an overhead.
> 
> The point of doing this was to stop having screens in CI and instead mostly
> have chameliums. This means that we need to make sure the chamelium exposes
> all the ports before starting a KMS test, since some tests may have left the
> screens disconnected.
> 
> Is that making sense?

Thanks martin for having a look and yeah i got your point,

But for checking all the ports are connected we can have a script which
checks it before the execution starts rather than checking it everytime

Currently when chamelium is not reachable we get SIGQUIT on all the
tests

Starting subtest: basic-fence-flip
Received signal SIGQUIT.
Stack trace:
#0 [fatal_sig_handler+0xd6]
#1 [killpg+0x40]
#2 [pselect+0x59]
#3 [xmlrpc_server_info_disallow_auth_ntlm+0x389]
#4 [xmlrpc_server_info_disallow_auth_ntlm+0x786]
#5 [xmlrpc_server_info_disallow_auth_ntlm+0xd1f]
#6 [xmlrpc_client_call2+0xa8]
#7 [xmlrpc_client_call2f_va+0x9e]
#8 [__chamelium_rpc_va+0x87]
#9 [__chamelium_rpc.constprop.8+0x8c]
#10 [chamelium_wait_reachable+0x65]
#11 [igt_display_require+0xbe]
#12 [test_flip+0x4b]
#13 [__real_main1093+0x1c38]
#14 [main+0x27]
#15 [__libc_start_main+0xe7]
#16 [_start+0x2a]

When chamelium is not reachable chamelium_wait_reachable() never returns
back and we have inactivity timeout which kills the test.

Regards
Kunal Joshi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
