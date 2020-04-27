Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062BA6E0E8
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2020 08:40:42 +0000 (UTC)
Date: Mon, 27 Apr 2020 11:40:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200427084037.GP9497@platvala-desk.ger.corp.intel.com>
References: <20200420140312.3401290-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420140312.3401290-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] kms_atomic_transition: Make the
 available pipe discovery dynamic
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 03:03:12PM +0100, Chris Wilson wrote:
> All of the per-plane tests are run on all available matching pipes. A
> natural case for igt_subtest_with_dynamic + igt_dynamic_f
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---


A side note, now that this change has been in effect for a bit and
properly skips when no matching pipe/output combos are found:

We're using for_each_pipe_with_valid_output, omitting the loop
elements with a (non-)internal panel. However, that loop only loops
through pipes, trying one output valid for that pipe. In effect, we
only test internal panels even if we have non-internal outputs
available, if the pipe can also drive the internal panel's output.

Maarten, do we really need the non/internal panel separation for this
test?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
