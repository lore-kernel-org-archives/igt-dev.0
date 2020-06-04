Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10A76E2B6
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2020 08:39:25 +0000 (UTC)
Date: Thu, 4 Jun 2020 11:39:22 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200604083922.GV9497@platvala-desk.ger.corp.intel.com>
References: <20200603125414.1027845-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603125414.1027845-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_core: Don't kill the world
 after a failed fork
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Michael Hebenstreit <michael.hebenstreit@intel.com>, Fei Yang <fei.yang@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 03:54:14PM +0300, Arkadiusz Hiler wrote:
> If we fail to fork (e.g. due to restrictive limits) -1 gets written as
> PID of our child and we assert out.
> 
> The cleanup that happens afterwards tries to kill all our children,
> which ends up in kill(-1, SIGKILL) which is not good.
> 
> This patch makes sure of two things:
>  * -1 doesn't get written down as our child
>  * when we are killing children we make sure that pid > 0
> 
> Reported-by: Fei Yang <fei.yang@intel.com>
> Cc: Michael Hebenstreit <michael.hebenstreit@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
