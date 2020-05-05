Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5725E89DA2
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 12:32:31 +0000 (UTC)
Date: Tue, 5 May 2020 15:32:27 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200505123227.botf5x7cksccmhqi@ahiler-desk1.fi.intel.com>
References: <20200504112623.285610-1-arkadiusz.hiler@intel.com>
 <20200504112623.285610-3-arkadiusz.hiler@intel.com>
 <20200505064102.GJ9497@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505064102.GJ9497@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/tests: Add tests for magic
 control blocks nesting
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 05, 2020 at 09:41:02AM +0300, Petri Latvala wrote:
> On Mon, May 04, 2020 at 02:26:23PM +0300, Arkadiusz Hiler wrote:
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> 
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
> Is igt_fork usage covered elsewhere?

There are some tests in lib/test/, but not for nesting.

We can add them here. I'll try to do that today.

I have addressed your comment on the messages consistency and merged the
patches.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
