Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D9410E489
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 15:11:19 +0000 (UTC)
Date: Wed, 26 Jul 2023 17:10:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230726151058.wvpsstazbgajzso6@kamilkon-desk1>
References: <20230717075005.390330-1-kunal1.joshi@intel.com>
 <20230717075005.390330-2-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230717075005.390330-2-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH 1/9] tests/intel-ci: Added chamelium config
 blacklist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kunal,

please use new terminology: blocklist

On 2023-07-17 at 13:19:57 +0530, Kunal Joshi wrote:
> blacklist for non chamelium config
- ^ ------------------------------- ^
Start from uppercase and move to new terminology: blocklist,
so s/blacklist/Blocklist/
Also put dot '.' at end of sentence.

If that is already merged, talk with CI team about moving this
into 'blocklist' files.

Regards,
Kamil

> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel-ci/chamelium.blacklist | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 tests/intel-ci/chamelium.blacklist
> 
> diff --git a/tests/intel-ci/chamelium.blacklist b/tests/intel-ci/chamelium.blacklist
> new file mode 100644
> index 000000000..c0325b555
> --- /dev/null
> +++ b/tests/intel-ci/chamelium.blacklist
> @@ -0,0 +1 @@
> +igt@.*chamelium.*
> -- 
> 2.25.1
> 
