Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C9510E0A9
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Nov 2022 12:46:37 +0000 (UTC)
Date: Wed, 9 Nov 2022 13:46:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y2uhKRx7mPKgeyOV@kamilkon-desk1>
References: <cover.1667994832.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1667994832.git.karolina.drobnik@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] misplaced-blitter - for CI only
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-11-09 at 12:56:36 +0100, Karolina Drobnik wrote:
> Please don't review.
> 
> Karolina Drobnik (2):
>   tests/api_intel_bb: Check for blitter support in misplaced-blitter
>   HAX: Test misplaced_blitter only

Please try to use trybot for that purpose rather than main
mailinglist,

https://patchwork.freedesktop.org/project/igt-trybot/series/

e-mail: intel-gfx-trybot@lists.freedesktop.org

Regards,
Kamil

> 
>  tests/i915/api_intel_bb.c             |   1 +
>  tests/intel-ci/fast-feedback.testlist | 179 +-------------------------
>  2 files changed, 3 insertions(+), 177 deletions(-)
> 
> --
> 2.25.1
