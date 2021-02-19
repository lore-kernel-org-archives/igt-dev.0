Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0396E8B0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 09:29:34 +0000 (UTC)
Date: Fri, 19 Feb 2021 11:29:44 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YC+FCL2EgBibSln0@platvala-desk.ger.corp.intel.com>
References: <20210219084257.31867-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219084257.31867-1-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Added option to toggle fsm handling
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org, mukunda.pramodh.kumar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 19, 2021 at 02:12:55PM +0530, Kunal Joshi wrote:
> We communicate with chamelium through xmlrpc which is
> uni-directional, if chamelium wants to signal something
> it triggers hpd pulses which we detect and then do DPMS
> cycle on-off, tests which changes modes such as 
> dp-frame-dump requires this, but test which runs through out
> on a single mode doesn't, so providing an option to toggle.
> 
> Kunal Joshi (2):
>   lib/igt_chamelium: Added toggle for fsm_handling
>   tests/kms_color_chamelium: Disabled fsm handling for
>     kms_color_chamelium
> 
>  lib/igt_chamelium.c         | 6 ++++--
>  lib/igt_chamelium.h         | 2 ++
>  tests/kms_color_chamelium.c | 2 ++
>  3 files changed, 8 insertions(+), 2 deletions(-)
> 
> -- 
> 2.17.1
> 


Series is
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
