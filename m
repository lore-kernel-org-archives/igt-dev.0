Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD776E8C2
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Dec 2020 04:59:21 +0000 (UTC)
Date: Wed, 23 Dec 2020 10:30:54 +0530
From: Kunal Joshi <kunal@intel.com>
Message-ID: <20201223050054.GA3906@intel.com>
References: <20201222043813.15566-1-karthik.b.s@intel.com>
 <20201222043813.15566-2-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222043813.15566-2-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/kms_plane: Test optimization
 by removing redundancies
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
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-12-22 at 10:08:13 +0530, Karthik B S wrote:
> The panning sub-tests currently loop for all the planes, but only uses
> primary plane for the actual verification. Removed this redundant loop.
> 
> Also, instead of grabbing reference crc's for both blue and red fb's,
> made changes to grab the reference crc based on the requirement of the
> particular subtest.
> 
LGTM
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
>  	test_fini(data);
>  }
> -- 
> 2.22.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
