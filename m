Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD58B6EC18
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 09:31:27 +0000 (UTC)
Date: Tue, 21 Jan 2020 11:31:24 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200121093124.GZ25209@platvala-desk.ger.corp.intel.com>
References: <1579219079-10981-1-git-send-email-john.machado@intel.com>
 <20200121093014.GY25209@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121093014.GY25209@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Add TigerLake Registers file
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
To: John Machado <john.machado@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 11:30:14AM +0200, Petri Latvala wrote:
> On Fri, Jan 17, 2020 at 05:27:59AM +0530, John Machado wrote:
> > Added the TigerLake register spec file and a register delta file
> > that contain additional registers corresponding to TigerLake.
> > 
> > The spec file uses the icelake file along with the newly added
> > register file for TGL register definations.
> > 
> > Suggested-by: Swati Sharma <swati2.sharma@intel.com>
> > Signed-off-by: John Machado <john.machado@intel.com>
> 
> igt@tools_test@tools_test doesn't explode. The values I'm not going to
> check, if they're incorrect we can fix them later, they're only used
> by the tools and won't affect CI.
> 
> Acked-by: Petri Latvala <petri.latvala@intel.com>

And now merged, thanks.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
