Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6751110F00F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 12:17:00 +0000 (UTC)
Date: Fri, 10 Jun 2022 14:16:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YqM2OKMuMl/1069d@kamilkon-desk1>
References: <20220610054834.469387-1-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220610054834.469387-1-sinjan.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 0/2] Add subtests description
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

Hi Sinjan,

please add test name which you are changed, for example:

gem_exec_await: Add subtests description

This will help when looking for your patches at patchwork.

Regards,
Kamil

On 2022-06-10 at 11:18:32 +0530, sinjan.kumar@intel.com wrote:
> From: Sinjan Kumar <sinjan.kumar@intel.com>
> 
> Add subtests description for the following subtest
> 1. wide-all
> 2. wide-exec
> 
> Sinjan Kumar (2):
>   i915/gem_exec_await: Add subtests description
>   HAX: don't do full run
> 
>  tests/i915/gem_exec_await.c           |   4 +
>  tests/intel-ci/fast-feedback.testlist | 186 +-------------------------
>  2 files changed, 5 insertions(+), 185 deletions(-)
> 
> -- 
> 2.25.1
> 
