Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6F810E52C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 17:34:32 +0000 (UTC)
Date: Thu, 19 Oct 2023 10:34:10 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZTFokh5HqQs3XJyd@nvishwa1-DESK>
References: <20231019144106.560624-1-matthew.auld@intel.com>
 <20231019144106.560624-12-matthew.auld@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231019144106.560624-12-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 11/15] lib/intel_allocator: treat
 default_alignment as the minimum
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

On Thu, Oct 19, 2023 at 03:41:02PM +0100, Matthew Auld wrote:
>If something overrides the default alignment, we should only apply the
>alignment if it is larger than the default_alignment.
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>Cc: José Roberto de Souza <jose.souza@intel.com>
>Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>---
> lib/intel_allocator.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
>index e5b9457b8..d94043016 100644
>--- a/lib/intel_allocator.c
>+++ b/lib/intel_allocator.c
>@@ -586,6 +586,9 @@ static int handle_request(struct alloc_req *req, struct alloc_resp *resp)
> 		case REQ_ALLOC:
> 			if (!req->alloc.alignment)
> 				req->alloc.alignment = ial->default_alignment;
>+			else
>+				req->alloc.alignment = max(ial->default_alignment,
>+							   req->alloc.alignment);

Looks like we don't need if/else clause here.
req->alloc.alignment = max(ial->default_alignment, req->alloc.alignment);

Other than that, change looks good to me.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana

>
> 			resp->response_type = RESP_ALLOC;
> 			resp->alloc.offset = ial->alloc(ial,
>-- 
>2.41.0
>
