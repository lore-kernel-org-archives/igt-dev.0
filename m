Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9206EB27
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 04:06:40 +0000 (UTC)
Date: Thu, 25 Mar 2021 09:35:36 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20210325040536.GA29841@intel.com>
References: <20210323061639.26460-1-karthik.b.s@intel.com>
 <20210323061639.26460-3-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323061639.26460-3-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_atomic_transition: Reset
 the pipe_count variable
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
To: Karthik B S <karthik.b.s@intel.com>, petri.latvala@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-03-23 at 11:46:39 +0530, Karthik B S wrote:
> The pipe_count variable is not being reset after every subtest.
> This is not causing any issue when running the subtests individually,
> but when running the full test only the first subtest runs
> and all the other subtests get skipped.
> 
> To fix this, reset the pipe_count variable after every subtest.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
