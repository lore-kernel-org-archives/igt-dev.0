Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 26 Jan 2023 16:53:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Message-ID: <20230126155306.w6jj2sg4gqhqaulo@kamilkon-desk1>
References: <20230112174730.1101192-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230112174730.1101192-1-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 0/4] Some intel_gpu_top
 tweaks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-01-12 at 17:47:26 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Mostly by popular demand from
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/109, although for
> some of these changes I'd like some second opinions. For instance is it user
> friendly to change the default aggregation mode for stdout and JSON output?

I do not see any response so imho we can merge this.

Regrads,
Kamil

> 
> Tvrtko Ursulin (4):
>   intel_gpu_top: Fix man page formatting
>   intel_gpu_top: Automatically enclose JSON output into brackets
>   intel_gpu_top: Add command line switch to start in physical engine
>     mode
>   intel_gpu_top: Aggregate engine classes in all output modes
> 
>  man/intel_gpu_top.rst | 20 ++++++++++++--------
>  tools/intel_gpu_top.c | 16 ++++++++++++++--
>  2 files changed, 26 insertions(+), 10 deletions(-)
> 
> -- 
> 2.34.1
> 
