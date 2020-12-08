Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 8 Dec 2020 13:04:05 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201208110405.GO7444@platvala-desk.ger.corp.intel.com>
References: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
 <20201207161150.1841453-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207161150.1841453-2-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/query: Directly check query
 results against GETPARAM
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 04:11:50PM +0000, Chris Wilson wrote:
> Simplify the cross-check by asserting that the existence of an engine in
> the list matches the existence of the engine as reported by GETPARAM.
> By using the comparison, we check both directions at once.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Petri Latvala <petri.latvala@intel.com>


For the series,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Thanks!
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
