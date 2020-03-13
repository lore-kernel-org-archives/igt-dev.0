Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 2.mo173.mail-out.ovh.net (2.mo173.mail-out.ovh.net
 [178.33.251.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FB06E057
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2020 22:09:49 +0000 (UTC)
Received: from player728.ha.ovh.net (unknown [10.110.115.233])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id EB57D135199
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2020 23:02:18 +0100 (CET)
Date: Sat, 14 Mar 2020 00:02:12 +0200
From: Andi Shyti <andi@etezian.org>
Message-ID: <20200313220212.GA27848@jack.zhora.eu>
References: <20200311093448.4103262-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311093448.4103262-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/5] lib/i915: Create a
 context wrapping one specific engine
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

On Wed, Mar 11, 2020 at 09:34:44AM +0000, Chris Wilson wrote:
> Quite frequently we want to execute on one precise engine, so add a
> convenience routine to create a context that contains only that engine
> in the default [0] slot.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
