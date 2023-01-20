Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9BD10EA52
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 15:35:10 +0000 (UTC)
Date: Fri, 20 Jan 2023 17:32:00 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <Y8qz8KK5DsFHW3Oe@platvala-desk.ger.corp.intel.com>
References: <20230120144500.29821-1-swati2.sharma@intel.com>
 <Y8qpngjAz2oYS76B@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8qpngjAz2oYS76B@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Revert VDSC lib changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 04:47:58PM +0200, Petri Latvala wrote:
> On Fri, Jan 20, 2023 at 08:15:00PM +0530, Swati Sharma wrote:
> > This reverts
> >     commit 2a611c37bd170763052bf6c17aa2d48cf09a63c1
> >     commit 65202cbc6109f17cf786a95947f4ee9223aec6b8
> >     commit b6984b946ba66f6bb0452b223fe188429ddeab34
> >     commit bbc2a5ceadb656552c5bcf95a19ce2b292a78128
> > 
> > Series broke git pipeline, revert above commits.
> > 
> > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> 
> The ultimate root cause is gitlab CI using Debian buster and thus
> libdrm 2.4.97. Until that's changed (soon) #include <stddef.h> and
> maybe some others need to be liberally applied all around.
> 
> Thanks for the quick revert.
> 
> Acked-by: Petri Latvala <petri.latvala@intel.com>

Gitlab pipeline for this series was a success, go ahead and merge.


-- 
Petri Latvala
