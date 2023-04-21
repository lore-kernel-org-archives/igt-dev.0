Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2671810E09B
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 05:19:01 +0000 (UTC)
Date: Fri, 21 Apr 2023 07:18:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Message-ID: <20230421051858.ervvkhtl3pt5hbyc@zkempczy-mobl2>
References: <20230420063908.66568-1-zbigniew.kempczynski@intel.com>
 <20230420063908.66568-7-zbigniew.kempczynski@intel.com>
 <3f91f56b-21f3-6664-25a9-73b2a6e84c52@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f91f56b-21f3-6664-25a9-73b2a6e84c52@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 06/10] lib/intel_batchbuffer: Add Xe
 support in intel-bb
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 02:48:33PM +0200, Manszewski, Christoph wrote:

<cut>

> >   	/* For debugging on CI, remove in final series */
> 
> PS I know this is not part of this patch but it left a smile on my face :)

Who said this is final series? ;) It's still in progress as you see.

--
Zbigniew

> 
> 
> >   	intel_bb_dump_execbuf(ibb, &execbuf);
