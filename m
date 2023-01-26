Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBC910E8EA
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jan 2023 13:12:32 +0000 (UTC)
Date: Thu, 26 Jan 2023 14:12:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230126131228.o36lg6hglii25d64@kamilkon-desk1>
References: <20230126105338.419418-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230126105338.419418-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] runner: Using 'abort' as test
 result instead of a separate test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

On 2023-01-26 at 12:53:35 +0200, Petri Latvala wrote:
> If a test caused an abort condition to trigger, a pseudoresult
> "igt@runner@aborted" would be generated, detailing which test caused
> the condition. That was implemented in a simpler world where there
> were no dynamic subtests and CI systems (i915-CI in particular) didn't
> have much test resuming happening.
> 
> The generated pseudoresult was completely unable to point to a
> particular dynamic subtest if the executed subtest had any, and there
> could inherently be only one of them. When combined with the fact that
> the pseudoresult doesn't have logs that could be used to automatically
> point to particular bug reports, that made results filtering by
> CIBugLog difficult.
> 
> With socket communications it's easier to inject information "in
> between" test's logs and result overriding is designed into the
> system. Thus, when using socket communications, this patch series will
> make the abort-condition-causing test's result 'abort' instead of
> using that pseudoresult.
> 
> The flow becomes a little bit messier with monitor_output() gaining
> more and more out-parameters but those can be cleaned later.

Please copy this into description of your last patch 3/3
runner: Use 'abort' as result if a test caused an abort

I would prefer to have all info about why patch is needed
in git log rather than patchwork.

For the series
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> 
> Petri Latvala (3):
>   runner: Don't override more results than requested
>   runner: Refactor abort-checking to a helper function
>   runner: Use 'abort' as result if a test caused an abort
> 
>  runner/executor.c  | 121 +++++++++++++++++++++++++++++++++++++++------
>  runner/resultgen.c |   6 +++
>  2 files changed, 111 insertions(+), 16 deletions(-)
> 
> -- 
> 2.30.2
> 
