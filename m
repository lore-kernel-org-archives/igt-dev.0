Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A00E10E1EA
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 10:53:22 +0000 (UTC)
Date: Tue, 17 May 2022 12:53:16 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YoN+nPGPIcBdiUnR@intel.intel>
References: <20220517072803.186989-1-mauro.chehab@linux.intel.com>
 <20220517072803.186989-10-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517072803.186989-10-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 9/9] lib/igt_aux: get rid of passing
 pipewire-pulse pid on functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On Tue, May 17, 2022 at 09:28:03AM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The logic already stores pw-reserve PID on a static var. Store
> also the pipewire-pulse pid, in order to keep passing the arguments
> on all functions.
> 
> Suggested-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Looks better :) Thanks!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
