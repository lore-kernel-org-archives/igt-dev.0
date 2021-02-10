Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20210210093756.61424-1-tvrtko.ursulin@linux.intel.com>
References: <20210210093756.61424-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 10 Feb 2021 10:37:28 +0000
Message-ID: <161295344868.6673.1570268063396739578@build.alporthouse.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/3] intel_gpu_top: Wrap interactive
 header
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

Quoting Tvrtko Ursulin (2021-02-10 09:37:54)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Slight improvement with regards to wrapping header components to fit
> console width. If a single element is wider than max it can still
> overflow but it should now work better for practical console widths.

I'm not fond of this layout, but that's just a personal preference.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
