Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12586F431
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 12:19:07 +0000 (UTC)
Date: Fri, 21 Feb 2020 14:19:05 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200221121905.GG25209@platvala-desk.ger.corp.intel.com>
References: <20200219142445.69061-1-emil.l.velikov@gmail.com>
 <20200221115825.GF25209@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115825.GF25209@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] ts/core_setmaster: new test for
 drop/set master semantics
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 01:58:25PM +0200, Petri Latvala wrote:
> Wrapping all that in an igt_subtest_group not required but could be
> used to communicate to human readers that this is the subtest these
> two fixtures are for.


Correction, it is required if you use igt_require with chmod().


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
