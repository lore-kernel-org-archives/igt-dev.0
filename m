Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
References: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159247859872.4042.2113901688631498152@build.alporthouse.com>
Date: Thu, 18 Jun 2020 12:09:58 +0100
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 01/11] gem_wsim: Rip out
 userspace balancing
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

Quoting Tvrtko Ursulin (2020-06-18 11:47:37)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Evaluation of userspace load balancing options was how this tool started
> but since we have settled on doing it in the kernel.
> 
> Tomorrow we will want to update the tool for new engine interfaces and all
> this legacy code will just be a distraction.
> 
> Rip out everything not related to explicit load balancing implemented via
> context engine maps and adjust the workloads to use it.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
