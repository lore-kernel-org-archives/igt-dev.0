Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B9E6E22A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2020 05:06:57 +0000 (UTC)
Date: Fri, 12 Jun 2020 08:06:55 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200612050655.GP9497@platvala-desk.ger.corp.intel.com>
References: <20200611180406.629107-1-stefan@agner.ch>
 <20200612050108.GO9497@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612050108.GO9497@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/run-tests.sh: also search path
 for runner binaries
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
To: Stefan Agner <stefan@agner.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 08:01:08AM +0300, Petri Latvala wrote:
> On Thu, Jun 11, 2020 at 08:04:06PM +0200, Stefan Agner wrote:
> > To make the script also useful when igt_runner/igt_resume binarires are
> > installed, also search PATH for the binaries.
> > 
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

And merged, thanks for the patch!


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
