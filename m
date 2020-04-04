Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2EC89D30
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Apr 2020 15:11:16 +0000 (UTC)
Date: Sat, 4 Apr 2020 18:11:13 +0300
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20200404151113.GH50931@intel.intel>
References: <20200404104140.1242766-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200404104140.1242766-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] kms_flip: Skip interruptible testing
 for negative and hangs tests
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

Hi Chris,

On Sat, Apr 04, 2020 at 11:41:40AM +0100, Chris Wilson wrote:
> Negative tests are API tests that will be rejected before we either
> waiting. Repeating them expecting it to be interrupted is a forlorn
> hope.
> 
> Hang tests are expected to be blocked until they can be resolved by
> hangcheck. Repeating those to see how a long wait responds when
> interrupted is counter purpose, just a waste of time.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Andi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
