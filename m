Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20201105184355.97296-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <a3520ec2-140c-befc-71a7-56977c287f44@intel.com>
Date: Fri, 6 Nov 2020 15:50:50 +0000
MIME-Version: 1.0
In-Reply-To: <20201105184355.97296-1-chris@chris-wilson.co.uk>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [PATCH i-g-t] i915/gem_pread,
 gem_pwrite: Exercise exhaustion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 05/11/2020 18:43, Chris Wilson wrote:
> Use userfault to arbitrarily delay the completion of copy_from_user() in
> order to trap many, many threads inside the core of
> gem_pread/gem_pwrite. This allows us to exhaust the preferred paths and
> potentially trip over unexpected fallback paths.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
