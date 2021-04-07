Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4630B6E072
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Apr 2021 07:42:06 +0000 (UTC)
Date: Wed, 7 Apr 2021 10:42:59 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YG1igzvUPT41npFD@platvala-desk.ger.corp.intel.com>
References: <20210407030952.44288-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407030952.44288-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [igt-dev] [i-g-t] test/i915/basic-wide-active: set max
 relocation limit
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
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org, hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 07, 2021 at 08:39:52AM +0530, Tejas Upadhyay wrote:
> practically its highly unlike to get as many relocations which
> basic-wide-active test is testing thus setting and adjusting
> max limit and count to avoid failures on legacy platforms like KBL.

The previous such patch against gem_exec_reloc had an unaddressed
objection and it was still merged. If you don't agree with the
objection, you still need to explain how in your view it's not valid.

This commit message quite clearly says the purpose of this patch is to
ignore failures, improving passrate metrics instead of driver
health. The same objection to this patch applies as far as I can see,
so nak on this.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
