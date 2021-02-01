Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20210201104524.875560-3-tvrtko.ursulin@linux.intel.com>
References: <20210201104524.875560-1-tvrtko.ursulin@linux.intel.com>
 <20210201104524.875560-3-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 01 Feb 2021 10:47:39 +0000
Message-ID: <161217645910.27906.13192145479606717134@build.alporthouse.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 3/3] intel_gpu_top: Fix
 interactive header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2021-02-01 10:45:24)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Client stats refactoring broke the header layout with an extra newline.

Argh; keep the newline, or at least check the terminal width and make
the newline conditional.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
