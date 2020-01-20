Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200117211129.3303428-1-chris@chris-wilson.co.uk>
From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Message-ID: <00c0940a-6ef3-a675-cab6-c98d515e3ed9@linux.intel.com>
Date: Mon, 20 Jan 2020 13:13:48 +0200
MIME-Version: 1.0
In-Reply-To: <20200117211129.3303428-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_mmap_offset: Exercise many,
 many mmap_offset
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 17/01/2020 23.11, Chris Wilson wrote:
> Just keep on generating a new mmap_offset for the same old buffer, but
> for different handles and so exercise the scaling of the obj->mmo lists.
> 

Reviewed-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
