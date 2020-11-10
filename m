Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E9289A0F
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 15:53:10 +0000 (UTC)
Date: Tue, 10 Nov 2020 16:53:02 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201110155302.GA86661@zkempczy-mobl2>
References: <20201110122448.84091-1-zbigniew.kempczynski@intel.com>
 <160501320739.29434.15560837802228029763@build.alporthouse.com>
 <20201110140321.GI5736@zkempczy-mobl2>
 <160502295116.29434.11385163477131284961@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160502295116.29434.11385163477131284961@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/api_intel_bb: Verify delta is
 properly added in emit relocation
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 03:42:31PM +0000, Chris Wilson wrote:
 > > 
> > > The instruction is different lengths; 1 upto gen8, 2 gen8+.
> > > -Chris
> > 
> > It requires 48b ppgtt, I thought it is not available before gen9.
> 48b is gen8+.
> 
> But you also have ibb->gen < 6, which is what I read and reacted to :)
> -Chris

Eh, copy-paste issue. v3 is almost on the way...

--
Zbigniew
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
