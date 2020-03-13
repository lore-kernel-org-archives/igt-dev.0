Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36A06E193
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2020 13:27:40 +0000 (UTC)
References: <20200312230535.4613-1-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <e721ffdf-2cf0-7177-b269-2455bd9ec300@intel.com>
Date: Fri, 13 Mar 2020 15:27:38 +0200
MIME-Version: 1.0
In-Reply-To: <20200312230535.4613-1-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Test configurable poll delay in
 perf OA
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 13/03/2020 01:05, Umesh Nerlige Ramappa wrote:
> Add tests that verify the configurable poll delay in perf OA.
>
> Lionel Landwerlin (2):
>    include/drm-uapi: Update i915_drm.h for perf OA APIs
>    tests/perf: new tests for parameterized OA buffer polling
>
>   include/drm-uapi/i915_drm.h |  13 ++++
>   tests/perf.c                | 132 ++++++++++++++++++++++++++----------
>   2 files changed, 111 insertions(+), 34 deletions(-)
>
Just found a few nits, but otherwise it looks good.

That said I wrote those tests so... ;)


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
