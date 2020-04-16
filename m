Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFEA6E08A
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 11:23:54 +0000 (UTC)
Date: Thu, 16 Apr 2020 09:56:09 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20200416042609.GB22861@intel.com>
References: <20200416032114.22318-1-kunal1.joshi@intel.com>
 <20200416104149.iptyqjw4r6rq5jak@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416104149.iptyqjw4r6rq5jak@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_chamelium Capture on type-c
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-04-16 at 13:41:49 +0300, Arkadiusz Hiler wrote:
> Handling of *connector is broken here and in the other chunk:
> 
> 1. you get connector first and then use it to start iteration
> 
> 2. you refresh the connector each iteration after you plug leaking the
>    old one
> 
> 3. there are no guarantee that the amount of modes will stay the same -
>    link training and mode pruning may kick in
> 
> 4. you are preparing output two times in a row for the first iteration
> 
> You need to re-work the flow here and make sure that at least the number
> of modes stays constant.
> 
> -- 
> Cheers,
> Arek
Thanks for the evaluation arek.
Will come over this things in the next version :).
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
