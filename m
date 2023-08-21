Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0C910E222
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Aug 2023 10:00:24 +0000 (UTC)
Date: Mon, 21 Aug 2023 12:00:16 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <20230821100016.g42t4nhjklebe3ij@zkempczy-mobl2>
References: <20230811164950.11074-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811164950.11074-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_exec_store: Fix number of
 placements in store_all
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

On Fri, Aug 11, 2023 at 10:19:50PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Fix number of placements in store_all using which we can create
> multiple engine instances.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/xe/xe_exec_store.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/xe/xe_exec_store.c b/tests/xe/xe_exec_store.c
> index bab5ea5bc..498aa0f7f 100644
> --- a/tests/xe/xe_exec_store.c
> +++ b/tests/xe/xe_exec_store.c
> @@ -149,7 +149,8 @@ static void store_all(int fd, int gt, int class)
>  		eci[num_placements++] = *hwe;
>  	}
>  
> -	igt_require(num_placements);
> +	if (num_placements < 2)
> +		return;

I think this isn't correct solution for this test. On adlp I've seen
there're two gt's - graphics and media, each which different set of
engines. So you may encounter situation there's no engine according
to iterator loop in 'basic-all' subtest.

I think this loop requires rework to be multi-gt ready.

--
Zbigniew

>  
>  	for (i = 0; i < num_placements; i++) {
>  		struct drm_xe_exec_queue_create create = {
> -- 
> 2.39.1
> 
