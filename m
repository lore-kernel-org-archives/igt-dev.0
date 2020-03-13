Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Sat, 14 Mar 2020 00:26:34 +0200
From: Andi Shyti <andi@etezian.org>
Message-ID: <20200313222634.GB27848@jack.zhora.eu>
References: <20200311093448.4103262-1-chris@chris-wilson.co.uk>
 <20200311093448.4103262-3-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311093448.4103262-3-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH i-g-t 3/5] i915: Exercise preemption timeout
 controls in sysfs
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

> We [will] expose various per-engine scheduling controls. One of which,
> 'preempt_timeout_ms', defines how we wait for a preemption request to be
> honoured by the currently executing context. If it fails to relieve the
> GPU within the required timeout, the engine is reset and the miscreant
> forcibly evicted.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

for the next three patches (3, 4 and 5) I'm not going to repeat
myself :P

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
