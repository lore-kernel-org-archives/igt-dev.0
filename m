Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB1789C8D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 15:34:20 +0000 (UTC)
Date: Mon, 14 Jun 2021 18:33:59 +0300
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20210614153343.yd62qzjjna4dksfp@hatecraft.localdomain>
References: <20210505083958.25105-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210505083958.25105-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] prime_udl: Add test description
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 05, 2021 at 11:39:58AM +0300, Petri Latvala wrote:
> Add a test description line, and remove the misleading comment
> entirely. The comment has been copied from prime_nv_test.c and
> mistakenly says the test is using nouveau.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> ---

Reviewed-by: Arkadiusz Hiler <arek@hiler.eu>

> The test is also out of date in various ways and should probably
> rather be removed in favor of more general prime tests...

Yes. I don't think kms_prime will cover this exact scenarion though, so
we would need more, generic tests.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
