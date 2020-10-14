Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
 <20201014104038.2554985-3-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <27f4ac94-cf2e-f17d-e23f-29e6e976fd01@intel.com>
Date: Wed, 14 Oct 2020 11:43:48 +0100
MIME-Version: 1.0
In-Reply-To: <20201014104038.2554985-3-chris@chris-wilson.co.uk>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t 03/10] i915/gen9_exec_parse: Check
 oversized batch with length==0
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 14/10/2020 11:40, Chris Wilson wrote:
> Include the implicit eb.batch_len=0 into the mix of various offsets and
> lengths.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
